package com.fairy.cloud.gateway.admin.entity.query;

import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Past;
import java.io.Serializable;
import java.util.Date;

/**
 * @author 鹿少年
 * @date 2022/10/30 14:56
 */
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class GatewayRouteQueryParam implements Serializable {


    @ApiModelProperty(value = "uri路径", required = true)
    private String uri;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    @Past(message = "查询开始时间必须小于当前日期")
    @ApiModelProperty(value = "查询开始时间")
    private Date createdTimeStart;

    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    @Past(message = "查询结束时间必须小于当前日期")
    @ApiModelProperty(value = "查询结束时间")
    private Date createdTimeEnd;
}
