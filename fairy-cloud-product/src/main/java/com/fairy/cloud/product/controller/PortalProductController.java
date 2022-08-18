package com.fairy.cloud.product.controller;

import com.alibaba.fastjson.JSON;
import com.fairy.cloud.api.feign.OrderFeign;
import com.fairy.cloud.api.feign.StockFeign;
import com.fairy.cloud.mbg.mapper.PmsBrandMapper;
import com.fairy.cloud.mbg.model.dto.OmsOrderParamDTO;
import com.fairy.cloud.mbg.model.pojo.PmsBrandPO;
import com.fairy.cloud.mbg.model.pojo.PmsProductPO;
import com.fairy.cloud.product.constant.Constants;
import com.fairy.cloud.product.service.PmsProductService;
import com.fairy.common.response.CommonResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.skywalking.apm.toolkit.trace.Tag;
import org.apache.skywalking.apm.toolkit.trace.Tags;
import org.apache.skywalking.apm.toolkit.trace.Trace;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;
import java.net.URISyntaxException;
import java.security.Principal;


@RestController
@Api(tags = "PortalProductController", description = "商品查询查看")
public class PortalProductController {


    Logger log = LoggerFactory.getLogger(PortalProductController.class);

    @Autowired
    private PmsProductService pmsProductService;

    @Autowired
    private OrderFeign orderFeign;
    @Autowired
    private StockFeign stockFeign;

    @Autowired
    private PmsBrandMapper pmsBrandMapper;

    @Autowired
    private RestTemplate loadBalance;

    @Autowired
    @Qualifier("restTemplate")
    private RestTemplate restTemplate;

    /**
     * 只有通过过滤拦截请求后的 才可以访问接口
     *
     * @param id
     * @return
     */
    @ApiOperation(value = "根据商品id获取商品详情#功能需要做QPS优化")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "flashPromotionId", value = "秒杀活动ID", paramType = "query", dataType = "long"),
            @ApiImplicitParam(name = "flashPromotionSessionId", value = "活动场次ID,例如:12点场", paramType = "query", dataType = "long")
    })
    @RequestMapping(value = "/productInfo/{id}", method = RequestMethod.GET)
    public CommonResponse getProductInfo(@PathVariable Integer id) {
        PmsProductPO pmsProduct = pmsProductService.getProductInfo(id);
        return CommonResponse.success(pmsProduct);
    }

    /**
     * 下单操作
     * principal 是空值知道为什么吗？（经过网关处理后）
     *
     * @param productId
     * @return
     */
    @Trace
    @Tags({@Tag(key = "param", value = "arg[0]"), @Tag(key = "commonResponse", value = "returnedObj")})
    @RequestMapping(value = "/sale/{productId}", method = RequestMethod.GET)
    public CommonResponse saleProduct(@PathVariable Integer productId, HttpServletRequest request, Principal principal) throws URISyntaxException {
        String userName = request.getHeader("username");
        Integer memberId = Integer.parseInt(request.getHeader("memberId"));
        //新增一条订单
        OmsOrderParamDTO omsOrderItemPO = new OmsOrderParamDTO();
        PmsProductPO productPO = pmsProductService.getProductInfo(productId);
        omsOrderItemPO.setProductPrice(productPO.getPrice());
        omsOrderItemPO.setProductPic(productPO.getPic());
        //品牌
        PmsBrandPO pmsBrandPO = pmsBrandMapper.selectById(productPO.getBrandId());
        omsOrderItemPO.setProductBrand(pmsBrandPO.getName());
        omsOrderItemPO.setProductQuantity(2);
        omsOrderItemPO.setOrderSn(Constants.getOrderSn(productId, memberId));
        omsOrderItemPO.setProductName(productPO.getName());
        omsOrderItemPO.setProductSn(productPO.getProductSn());
        omsOrderItemPO.setMemeberId(memberId);
        omsOrderItemPO.setUserName(userName);

        String url = "http://fairy-cloud-order/order/create";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<OmsOrderParamDTO> entity = new HttpEntity<OmsOrderParamDTO>(omsOrderItemPO, headers);

        ResponseEntity<CommonResponse> responseEntity = loadBalance.exchange(url, HttpMethod.POST, entity, CommonResponse.class);

//        orderFeign.createOrder(omsOrderItemPO);
        //库存减少
//        stockFeign.deduceStock(productId);

        //ribbon调用
        url = "http://fairy-cloud-stock/stock/deduce?productId=" + productId;
        CommonResponse rs = loadBalance.getForObject(url, CommonResponse.class);
        log.info("调用结果:{}", rs);
        return CommonResponse.success("下单成功");
    }


}
