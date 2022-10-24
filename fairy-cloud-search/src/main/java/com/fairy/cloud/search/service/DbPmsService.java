package com.fairy.cloud.search.service;

import com.fairy.cloud.search.entity.PmsProductDTO;
import com.github.pagehelper.Page;
import com.fairy.cloud.mbg.model.pojo.PmsProductPO;
import com.fairy.common.page.PageInfoDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 数据库 Product操作接口
 */
public interface DbPmsService {
    /**
     * 一下子读取全部数据比较不友好 我们分页读取数据
     * @param pageInfo 分页信息
     * @return
     */
    List<PmsProductDTO> searchProductWithPage(Page pageInfo);

    /**
     * search product from DB
     * @param productName
     * @param productName1
     * @param of
     * @return
     */
    PageInfoDTO findProductByNameOrDescription(String productName, String productName1, Pageable of);

    /**
     * 分页查询
     * @param pageNum 页数
     * @param pageSize 每页条数
     * @return
     */
    PageInfoDTO selectPmsByPage(int pageNum, int pageSize);
}
