package com.fairy.cloud.search.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fairy.cloud.mbg.mapper.PmsProductMapper;
import com.fairy.cloud.mbg.model.pojo.PmsProductPO;
import com.fairy.cloud.search.entity.PmsProductDTO;
import com.fairy.cloud.search.service.DbPmsService;
import com.fairy.common.page.PageInfoDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class DbPmsServiceImpl implements DbPmsService {
    @Autowired
    private PmsProductMapper productMapper;

    @Override
    public List<PmsProductDTO> searchProductWithPage(com.github.pagehelper.Page pageInfo) {
        List<PmsProductPO> list = productMapper.selectPmsByPage(pageInfo);
        log.info("查询页数：{}，查询条数:{},查询到数量", pageInfo.size(), pageInfo.getTotal(), list.size());
        List<PmsProductDTO> pmsProductDTOS = new ArrayList<>();
        list.stream().forEach(productPO -> pmsProductDTOS.add(PmsProductDTO.builder()
                .id(productPO.getId() + "")
                .productSn(productPO.getProductSn())
                .sale(productPO.getSale())
                .price(productPO.getPrice())
                .name(productPO.getName())
                .brandId(productPO.getBrandId())
                .keywords(productPO.getKeywords())
                .build()));
        return pmsProductDTOS;
    }

    @Override
    public PageInfoDTO findProductByNameOrDescription(String productName, String productName1, Pageable pageable) {
        Page page = new Page(pageable.getPageNumber(), pageable.getPageSize());
        LambdaQueryWrapper<PmsProductPO> queryWrapper = new LambdaQueryWrapper();
        queryWrapper.like(PmsProductPO::getName, productName).or().like(PmsProductPO::getDescription, productName);
        Page<PmsProductPO> poPage = productMapper.selectPage(page, queryWrapper);
        return new PageInfoDTO(poPage);
    }

    @Override
    public PageInfoDTO selectPmsByPage(int pageNum, int pageSize) {
        Page page = new Page(pageNum, pageSize);
        Page<PmsProductPO> poPage = productMapper.selectPage(page, new LambdaQueryWrapper<PmsProductPO>());
        return new PageInfoDTO(poPage);
    }

}
