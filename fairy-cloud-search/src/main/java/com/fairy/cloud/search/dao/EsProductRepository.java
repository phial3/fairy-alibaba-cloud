package com.fairy.cloud.search.dao;

import com.fairy.cloud.mbg.model.pojo.PmsProductPO;
import com.fairy.cloud.search.entity.PmsProductDTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

/**
 * @author 鹿少年
 * @date 2022/8/28 17:43
 */
public interface EsProductRepository extends ElasticsearchRepository<PmsProductDTO, String > {
    /**
     * 搜索查询
     * @param name 商品名称
     * @param description 商品描述
     * @param page 分页信息
     * @return Page
     */
    Page<PmsProductPO> findByNameOrDescription(String name, String description, Pageable page);

}
