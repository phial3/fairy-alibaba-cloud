package com.fairy.cloud.search.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fairy.cloud.mbg.model.pojo.PmsProductPO;
import com.fairy.cloud.search.entity.PmsProductDTO;
import com.fairy.common.page.PageInfoDTO;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.io.IOException;
import java.util.Collection;
import java.util.List;

/**
 * @author 鹿少年
 * @date 2022/9/9 19:34
 */
public interface EsProductService {

    /**
     * import Product Info to Es
     * @param pmsProductPOS product Info
     */
    void importProductToEs(List<PmsProductDTO>pmsProductPOS) throws IOException;

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
     * 将数据库数据加载到ES
     */
    void loadAllProductToEs() throws IOException;

    /**
     * 插入一条商品数据
     * @param productDTO
     */
    void insertPms(PmsProductDTO productDTO) throws IOException;

    /**
     * 从ES删除商品信息
     * @param id
     */
    void deleteById(String id) throws IOException;

    /**
     * 批量删除
     * @param ids
     */
    void deleteByIds(Collection<String> ids) throws IOException;

    /**
     * 更新ES存储信息
     * @param productDTO
     */
    void updatePms(PmsProductDTO productDTO) throws IOException;

    /**
     * 根据关键字或者商品品牌模糊查询
     * @param keyWord
     * @return
     */
    PageInfoDTO selectByKeyWordsOrBrands(String keyWord);
}
