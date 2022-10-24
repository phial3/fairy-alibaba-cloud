package com.fairy.cloud.search.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fairy.cloud.mbg.mapper.PmsProductMapper;
import com.fairy.cloud.mbg.model.pojo.PmsProductPO;
import com.fairy.cloud.search.dao.EsProductRepository;
import com.fairy.cloud.search.ems.SearchEnums;
import com.fairy.cloud.search.entity.PmsProductDTO;
import com.fairy.cloud.search.service.DbPmsService;
import com.fairy.cloud.search.service.EsProductService;
import com.fairy.common.page.PageInfoDTO;
import com.github.pagehelper.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.apache.lucene.util.CollectionUtil;
import org.elasticsearch.action.DocWriteRequest;
import org.elasticsearch.action.DocWriteResponse;
import org.elasticsearch.action.bulk.BulkRequest;
import org.elasticsearch.action.bulk.BulkResponse;
import org.elasticsearch.action.delete.DeleteRequest;
import org.elasticsearch.action.index.IndexRequest;
import org.elasticsearch.action.index.IndexResponse;
import org.elasticsearch.action.update.UpdateRequest;
import org.elasticsearch.action.update.UpdateResponse;
import org.elasticsearch.client.RequestOptions;
import org.elasticsearch.client.RestHighLevelClient;
import org.elasticsearch.index.VersionType;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.Collection;
import java.util.List;

/**
 * @author 鹿少年
 * @date 2022/9/9 19:34
 */
@Slf4j
@Service
public class EsProductServiceImpl implements EsProductService {

    @Resource
    private DbPmsService dbPmsService;
    @Resource
    private EsProductRepository esProductRepository;
    @Resource
    private RestHighLevelClient elasticsearchClient;

    @Override
    public void importProductToEs(List<PmsProductDTO> pmsProductPOS) throws IOException {
        BulkRequest request = new BulkRequest();
        for (PmsProductDTO productPO : pmsProductPOS) {
            IndexRequest indexRequest = new IndexRequest(SearchEnums.ProductIndex.getIndexName());
            indexRequest.id(productPO.getId()).opType(DocWriteRequest.OpType.CREATE).source(JSON.toJSONString(productPO));
            request.add(indexRequest);
        }
        BulkResponse response = elasticsearchClient.bulk(request, RequestOptions.DEFAULT);

    }

    @Override
    public PageInfoDTO getProductInfoWithPage(Integer page, Integer row) {
        org.springframework.data.domain.Page<PmsProductDTO> pageInfo = esProductRepository.search(QueryBuilders.boolQuery(), PageRequest.of(page, row));
        return new PageInfoDTO(pageInfo);
    }

    @Override
    public PageInfoDTO findByNameOrDescription(String name, String description, Pageable page) {
        BoolQueryBuilder builder = QueryBuilders.boolQuery();
        builder.should(QueryBuilders.matchQuery("name", name)).should(QueryBuilders.matchQuery("description", description)).boost(0.95f);
        org.springframework.data.domain.Page<PmsProductDTO> pageInfo = esProductRepository.search(builder, page);
        org.springframework.data.domain.Page<PmsProductPO> rs = esProductRepository.findByNameOrDescription(name, description, page);
        return new PageInfoDTO(pageInfo);
    }

    @Override
    public void loadAllProductToEs() throws IOException {
        //分页 每页100条数据
        int pageNum = 1;
        int pageSize = 100;
        com.github.pagehelper.Page page = PageHelper.startPage(pageNum, pageSize);
        List<PmsProductDTO> productPOS = dbPmsService.searchProductWithPage(page);

        while (!CollectionUtils.isEmpty(productPOS)) {
            //导入数据
            importProductToEs(productPOS);
            //继续分页
            page = new com.github.pagehelper.Page(++pageNum, pageSize);
            productPOS = dbPmsService.searchProductWithPage(page);
        }
    }

    @Override
    public void insertPms(PmsProductDTO productDTO) throws IOException {
        IndexRequest indexRequest = new IndexRequest(SearchEnums.ProductIndex.getIndexName());
        indexRequest.id(productDTO.getId()).opType(DocWriteRequest.OpType.CREATE).source(JSON.toJSONString(productDTO));
        IndexResponse response = elasticsearchClient.index(indexRequest, RequestOptions.DEFAULT);
        log.info("插入结果：seq_No{}, primary_term:{},shardId:{}", response.getSeqNo(), response.getPrimaryTerm(), response.getShardId());
    }

    @Override
    public void deleteById(String id) throws IOException {
        DeleteRequest deleteRequest = new DeleteRequest(SearchEnums.ProductIndex.getIndexName(), id);
        elasticsearchClient.delete(deleteRequest, RequestOptions.DEFAULT);
    }

    @Override
    public void deleteByIds(Collection<String> ids) throws IOException {
        BulkRequest request = new BulkRequest(SearchEnums.ProductIndex.getIndexName());
        for (String id :ids){
            IndexRequest deleteRequest = new IndexRequest();
            deleteRequest.id(id).opType(DocWriteRequest.OpType.DELETE);
            request.add(deleteRequest);
        }
        elasticsearchClient.bulk(request,RequestOptions.DEFAULT);
    }

    @Override
    public void updatePms(PmsProductDTO productDTO) throws IOException {
        IndexRequest request = new IndexRequest(SearchEnums.ProductIndex.getIndexName());
        UpdateRequest updateRequest = new UpdateRequest(SearchEnums.ProductIndex.getIndexName(),productDTO.getId());
        UpdateResponse response =  elasticsearchClient.update(updateRequest,RequestOptions.DEFAULT);
        DocWriteResponse.Result result = response.getResult();
        log.info("id:{}, index:{}", response.getGetResult().getId(),response.getGetResult().getIndex());
    }

    @Override
    public PageInfoDTO selectByKeyWordsOrBrands(String keyWord) {
        return null;
    }
}
