package com.fairy.cloud.search.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fairy.cloud.mbg.model.pojo.PmsProductPO;
import com.fairy.common.page.PageInfoDTO;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.io.IOException;
import java.util.List;

/**
 * @author 鹿少年
 * @date 2022/9/9 19:34
 */
public interface EsProductService {
    /**
     * 一下子读取全部数据比较不友好 我们分页读取数据
     * @param pageInfo 分页信息
     * @return
     */
    List<PmsProductPO> searchProductWithPage(Page pageInfo);

    /**
     * import Product Info to Es
     * @param pmsProductPOS product Info
     */
    void importProductToEs(List<PmsProductPO>pmsProductPOS) throws IOException;

    /**
     * Search for Paging
     * @param page page num
     * @param row num of per page
     * @return page data
     */
    PageInfoDTO getProductInfoWithPage(Integer page, Integer row);

    /**
     * search product info by product Name or product description
     * @param name product Name
     * @param description product description info
     * @param page page info
     * @return PageInfoDTO
     */
    PageInfoDTO findByNameOrDescription(String name, String description, Pageable page);

    /**
     * search product from DB
     * @param productName
     * @param productName1
     * @param of
     * @return
     */
    PageInfoDTO findProductByNameOrDescription(String productName, String productName1, Pageable of);
}
