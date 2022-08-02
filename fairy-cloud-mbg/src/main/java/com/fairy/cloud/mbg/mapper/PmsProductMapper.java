package com.fairy.cloud.mbg.mapper;

import com.fairy.cloud.mbg.model.pojo.PmsProductPO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 商品信息
 * 
 * @author é¹¿å°å¹´
 * @email 
 * @date 2022-08-02 21:00:44
 */
@Mapper
public interface PmsProductMapper extends BaseMapper<PmsProductPO> {

    List<Integer> getAllProductId();
}
