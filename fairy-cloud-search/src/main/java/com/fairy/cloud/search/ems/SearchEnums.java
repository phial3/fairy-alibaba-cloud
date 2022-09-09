package com.fairy.cloud.search.ems;

/**
 * @author 鹿少年
 * @date 2022/9/9 20:01
 */
public enum SearchEnums {
   ProductIndex("0001","product") ;


    private String code;
    private String indexName;

    SearchEnums(String code, String indexName) {
        this.code = code;
        this.indexName = indexName;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getIndexName() {
        return indexName;
    }

    public void setIndexName(String indexName) {
        this.indexName = indexName;
    }
}
