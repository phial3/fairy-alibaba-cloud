package com.fairy.common.page;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 分页工具类
 *
 * @author hll
 * @version 1.0
 * @date 2022/6/26 17:49
 */
@Data
@NoArgsConstructor
public class PageInfoDTO {
    /**
     * 总记录数
     */
    private Integer totalCount;
    /**
     * 每页记录数
     */
    private Integer pageSize;
    /**
     * 总页数
     */
    private Integer totalPage;
    /**
     * 开始页数默认从1  分页插件默认从0
     */
    private Integer startPage;
    /**
     * 列表数据
     */
    private List list;

    /**
     * 分页
     *
     * @param list      列表数据
     * @param pageSize  每页记录数
     * @param startPage 当前页数
     */
    public PageInfoDTO(List list, Integer pageSize, Integer startPage) {
        this.list = list;
        this.totalCount = list.size();
        this.pageSize = pageSize;
        this.startPage = startPage;
        this.totalPage = (int) Math.ceil((double) totalCount / pageSize);
    }


    /**
     * baomidou  mybatis-plus
     *
     * @param page 分页信息
     */
    public PageInfoDTO(IPage page) {
        this.list = page.getRecords();
        this.totalCount = (int) page.getTotal();
        this.pageSize = (int) page.getSize();
        this.startPage = (int) page.getCurrent();
        this.totalPage = (int) page.getPages();
    }

    /**
     * pagehelper
     *
     * @param pageInfo 分页信息
     */
    public PageInfoDTO(PageInfo pageInfo) {
        this.list = pageInfo.getList();
        this.totalCount = (int) pageInfo.getTotal();
        this.pageSize = pageInfo.getPageSize();
        this.startPage = pageInfo.getPageNum();
        this.totalPage = pageInfo.getPages();
    }

    public PageInfoDTO(List list) {
        PageInfo page = new PageInfo(list);
        this.list = page.getList();
        this.totalCount = (int) page.getTotal();
        this.pageSize = (int) page.getPageSize();
        this.startPage = (int) page.getPageNum();
        this.totalPage = (int) page.getPages();
    }

    public PageInfoDTO(org.springframework.data.domain.Page page) {
        this.list = page.getContent();
        this.totalCount = (int) page.getTotalElements();
        this.pageSize = (int) page.getSize();
        this.startPage = (int) page.getNumber();
        this.totalPage = (int) page.getTotalPages();
    }

    /**
     * github pagehelper 分页插件
     *
     * @param page 分页信息
     * @param data 数据
     */
    public PageInfoDTO(Page page, List data) {
        this.list = data;
        if (page != null) {
            this.totalCount = (int) page.getTotal();
            this.pageSize = page.getPageSize();
            this.startPage = page.getPageNum();
            this.totalPage = page.getPages();
        } else {
            this.totalCount = data.size();
            this.pageSize = data.size();
            this.startPage = 1;
            this.totalPage = data.size() > 0 ? 1 : 0;
        }

    }
}
