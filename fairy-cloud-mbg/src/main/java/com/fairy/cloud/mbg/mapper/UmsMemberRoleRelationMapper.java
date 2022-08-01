package com.fairy.cloud.mbg.mapper;

import com.fairy.cloud.mbg.model.UmsMemberRoleRelation;
import com.fairy.cloud.mbg.model.UmsMemberRoleRelationExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UmsMemberRoleRelationMapper {
    long countByExample(UmsMemberRoleRelationExample example);

    int deleteByExample(UmsMemberRoleRelationExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(UmsMemberRoleRelation record);

    int insertSelective(UmsMemberRoleRelation record);

    List<UmsMemberRoleRelation> selectByExample(UmsMemberRoleRelationExample example);

    UmsMemberRoleRelation selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") UmsMemberRoleRelation record, @Param("example") UmsMemberRoleRelationExample example);

    int updateByExample(@Param("record") UmsMemberRoleRelation record, @Param("example") UmsMemberRoleRelationExample example);

    int updateByPrimaryKeySelective(UmsMemberRoleRelation record);

    int updateByPrimaryKey(UmsMemberRoleRelation record);
}