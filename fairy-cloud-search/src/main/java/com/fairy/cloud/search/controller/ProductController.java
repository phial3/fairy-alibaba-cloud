package com.fairy.cloud.search.controller;

import cn.hutool.core.collection.CollectionUtil;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fairy.cloud.mbg.model.pojo.PmsProductPO;
import com.fairy.cloud.search.service.EsProductService;
import com.fairy.common.page.PageInfoDTO;
import com.fairy.common.response.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

/**
 * @author 鹿少年
 * @date 2022/9/9 20:17
 */
@Slf4j
@RestController
@RequestMapping("/search")
public class ProductController {
    @Autowired
    private EsProductService productService;

    @GetMapping("/pms")
    public Result selectProduct(@RequestParam(name = "page", defaultValue = "10") Integer page, @RequestParam(name = "row", defaultValue = "10") Integer row) {
        log.info("---分页查询商品信息:page:{} , row:{}", page, row);
        List<PmsProductPO> pmsProductPOList = productService.searchProductWithPage(new Page<>(page, row));
        return Result.success(pmsProductPOList);
    }

    @PostMapping("/import/product")
    public Result importProductInfo(@RequestParam("page") Integer page, @RequestParam("row") Integer row) throws IOException {
        log.info("---将数据库商品信息导入到Es中---");
        List<PmsProductPO> pmsProductPOList = productService.searchProductWithPage(new Page(page, row));
        if (!CollectionUtil.isEmpty(pmsProductPOList)) {
            productService.importProductToEs(pmsProductPOList);
        }
        return Result.success(pmsProductPOList);
    }

    @PostMapping("/db/product")
    public Result searchProductFromDB(@RequestParam("productName") String productName, @RequestParam(name = "page", defaultValue = "10") Integer page, @RequestParam(name = "row", defaultValue = "10") Integer row) throws IOException {
        log.info("---从数据库根据商品名称商品描述信息查询商品 ---");
        PageInfoDTO pageInfoDTO = productService.findProductByNameOrDescription(productName, productName, PageRequest.of(page, row));
        return Result.success(pageInfoDTO);
    }

    @PostMapping("/es/product")
    public Result searchProductFromES(@RequestParam("productName") String productName, @RequestParam(name = "page", defaultValue = "10") Integer page, @RequestParam(name = "row", defaultValue = "10") Integer row) throws IOException {
        log.info("---从ES根据商品名称商品描述信息查询商品 ---");
        PageInfoDTO pageInfoDTO = productService.findByNameOrDescription(productName, productName, PageRequest.of(page, row));
        return Result.success(pageInfoDTO);
    }
}
