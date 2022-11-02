package com.fairy.cloud.gateway.api.enums;

/**
 * @author 鹿少年
 * @date 2022/10/31 19:06
 */
public enum RoteTypeEnums {

    PREDICT("predict", 0),
    FILTER("filter", 1),
    ELSE("else", -1);

    RoteTypeEnums(String type, Integer id) {
        this.type = type;
        this.id = id;
    }

    private String type;
    private Integer id;

    public Integer getId() {
        return id;
    }

    public String getType() {
        return type;
    }

    public RoteTypeEnums getRoute(Integer routId) {
        for (RoteTypeEnums enums : RoteTypeEnums.values()) {
            if (enums.id.equals(routId)) {
                return enums;
            }
        }
        return ELSE;
    }
}