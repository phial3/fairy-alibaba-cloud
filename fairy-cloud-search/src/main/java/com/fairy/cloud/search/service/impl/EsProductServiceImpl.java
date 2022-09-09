package com.fairy.cloud.search.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fairy.cloud.mbg.mapper.PmsProductMapper;
import com.fairy.cloud.mbg.model.pojo.PmsProductPO;
import com.fairy.cloud.search.dao.EsProductRepository;
import com.fairy.cloud.search.ems.SearchEnums;
import com.fairy.cloud.search.service.EsProductService;
import com.fairy.common.page.PageInfoDTO;
import com.github.pagehelper.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.elasticsearch.action.DocWriteRequest;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.List;

/**
 * @author 鹿少年
 * @date 2022/9/9 19:34
 */
@Slf4j
@Service
public class EsProductServiceImpl implements EsProductService {

    @Autowired
    private PmsProductMapper productMapper;
    @Resource
    private EsProductRepository esProductRepository;
    @Resource
    private RestHighLevelClient elasticsearchClient;

    @Override
    public List<PmsProductPO> searchProductWithPage(Page pageInfo) {
        LambdaQueryWrapper<PmsProductPO> queryWrapper = new LambdaQueryWrapper<>();
        Page<PmsProductPO> pages = productMapper.selectPage(pageInfo, queryWrapper);
        log.info("查询页数：{}，查询条数:{}", pages.getSize(), pages.getTotal());
        return pages.getRecords();
    }

    @Override
    public void importProductToEs(List<PmsProductPO> pmsProductPOS) throws IOException {
        for (PmsProductPO productPO : pmsProductPOS) {
            IndexRequest indexRequest = new IndexRequest(SearchEnums.ProductIndex.getIndexName());
            indexRequest.id(productPO.getId() + "").opType(DocWriteRequest.OpType.CREATE).source(JSON.toJSONString(productPO));
            IndexResponse response = elasticsearchClient.index(indexRequest, RequestOptions.DEFAULT);
            log.info("插入结果：seq_No{}, primary_term:{},shardId:{}", response.getSeqNo(), response.getPrimaryTerm(), response.getShardId());
        }

    }

    @Override
    public PageInfoDTO getProductInfoWithPage(Integer page, Integer row) {

        org.springframework.data.domain.Page<PmsProductPO> pageInfo = esProductRepository.search(QueryBuilders.boolQuery(), PageRequest.of(page, row));
        return new PageInfoDTO(pageInfo);
    }

    @Override
    public PageInfoDTO findByNameOrDescription(String name, String description, Pageable page) {
        BoolQueryBuilder builder = QueryBuilders.boolQuery();
        builder.should(QueryBuilders.matchQuery("name", name)).should(QueryBuilders.matchQuery("description", description)).boost(0.95f);
        org.springframework.data.domain.Page<PmsProductPO> pageInfo = esProductRepository.search(builder, page);
        org.springframework.data.domain.Page<PmsProductPO> rs = esProductRepository.findByNameOrDescription(name, description, page);
        return new PageInfoDTO(pageInfo);
    }

    @Override
    public PageInfoDTO findProductByNameOrDescription(String productName, String productName1, Pageable pageable) {
        Page page = new Page(pageable.getPageNumber(), pageable.getPageSize());
        LambdaQueryWrapper<PmsProductPO> queryWrapper = new LambdaQueryWrapper();
        queryWrapper.like(PmsProductPO::getName, productName).or().like(PmsProductPO::getDescription, productName);
        Page<PmsProductPO> poPage = productMapper.selectPage(page, queryWrapper);
        return new PageInfoDTO(poPage);
    }

}
