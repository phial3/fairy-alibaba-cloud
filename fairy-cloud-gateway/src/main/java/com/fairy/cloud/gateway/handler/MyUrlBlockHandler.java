package com.fairy.cloud.gateway.handler;

import com.alibaba.csp.sentinel.adapter.servlet.callback.UrlBlockHandler;
import com.alibaba.csp.sentinel.slots.block.BlockException;
import com.alibaba.csp.sentinel.slots.block.authority.AuthorityException;
import com.alibaba.csp.sentinel.slots.block.degrade.DegradeException;
import com.alibaba.csp.sentinel.slots.block.flow.FlowException;
import com.alibaba.csp.sentinel.slots.block.flow.param.ParamFlowException;
import com.alibaba.csp.sentinel.slots.system.SystemBlockException;
import com.fairy.common.enums.SentinelErrorEnum;
import com.fairy.common.response.Result;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author huanglulu
 * @version 1.0
 * @createTime 2022/4/4 15:14
 */
@Slf4j
public class MyUrlBlockHandler implements UrlBlockHandler {
    @Override
    public void blocked(HttpServletRequest request, HttpServletResponse response, BlockException e) throws IOException {
        log.info("UrlBlockHandler BlockException================"+e.getRule());
        Result r = null;

        if (e instanceof FlowException) {
            r = Result.fail(SentinelErrorEnum.FLOW_RULE_ERR);

        } else if (e instanceof DegradeException) {
            r =  Result.fail(SentinelErrorEnum.DEGRADE_RULE_ERR);

        } else if (e instanceof ParamFlowException) {
            r = Result.fail(SentinelErrorEnum.HOT_PARAM_FLOW_RULE_ERR);
        } else if (e instanceof SystemBlockException) {
            r = Result.fail(SentinelErrorEnum.SYS_RULE_ERR);
        } else if (e instanceof AuthorityException) {
            r = Result.fail(SentinelErrorEnum.AUTH_RULE_ERR);
        }

        //返回json数据
        response.setStatus(500);
        response.setCharacterEncoding("utf-8");
        response.setContentType(MediaType.APPLICATION_JSON_VALUE);
        response.getWriter().write(    new ObjectMapper().writeValueAsString(r));
    }
}
