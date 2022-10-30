package com.fairy.cloud.mbg.mapper;

import com.fairy.cloud.mbg.model.pojo.OmsOrderItemPO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

/**
 * 订单中所包含的商品
 * 
 * @author é¹¿å°å¹´
 * @email 
 * @date 2022-08-02 21:00:43
 */
@Mapper
@Repository
public interface OmsOrderItemMapper extends BaseMapper<OmsOrderItemPO> {
	
}
