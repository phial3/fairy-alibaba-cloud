package com.fairy.cloud.gateway.exception;

import com.alibaba.csp.sentinel.adapter.gateway.sc.callback.DefaultBlockRequestHandler;
import com.alibaba.csp.sentinel.slots.block.degrade.DegradeException;
import com.alibaba.csp.sentinel.slots.block.flow.param.ParamFlowException;
import com.alibaba.fastjson.JSON;
import com.fairy.cloud.gateway.common.GateWayResult;
import com.fairy.common.enums.ResultEnums;
import org.springframework.http.HttpStatus;
import org.springframework.http.InvalidMediaTypeException;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.server.ServerResponse;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.List;

import static org.springframework.web.reactive.function.BodyInserters.fromObject;


@Component
public class GatewayBlockExceptionHandler extends DefaultBlockRequestHandler {

    @Override
    public Mono<ServerResponse> handleRequest(ServerWebExchange exchange, Throwable ex) {
        if (acceptsHtml(exchange)) {
            return htmlErrorResponse(ex);
        }
        // JSON result by default.
        return ServerResponse.status(HttpStatus.TOO_MANY_REQUESTS)
                .contentType(MediaType.APPLICATION_JSON_UTF8)
                .body(fromObject(buildErrorResult(ex)));
    }

    private Mono<ServerResponse> htmlErrorResponse(Throwable ex) {

        return ServerResponse.status(HttpStatus.TOO_MANY_REQUESTS)
                .contentType(MediaType.TEXT_PLAIN)
                .syncBody(JSON.toJSONString(buildErrorResult(ex)));
    }

    private GateWayResult buildErrorResult(Throwable ex) {
        if (ex instanceof ParamFlowException) {
            return GateWayResult.builder().code(ResultEnums.TOMANY_REQUEST_ERROR.getResultCode()).succuess(false)
                    .msg(ResultEnums.TOMANY_REQUEST_ERROR.getResultMsg()).build();
        } else if (ex instanceof DegradeException) {
            return GateWayResult.builder().code(ResultEnums.BACKGROUD_DEGRADE_ERROR.getResultCode()).succuess(false)
                    .msg(ResultEnums.BACKGROUD_DEGRADE_ERROR.getResultMsg()).build();
        } else {
            return GateWayResult.builder().code(ResultEnums.BAD_GATEWAY.getResultCode()).succuess(false)
                    .msg(ResultEnums.BAD_GATEWAY.getResultMsg()).build();
        }
    }

    /**
     * Reference from {@code DefaultErrorWebExceptionHandler} of Spring Boot.
     */
    private boolean acceptsHtml(ServerWebExchange exchange) {
        try {
            List<MediaType> acceptedMediaTypes = exchange.getRequest().getHeaders().getAccept();
            acceptedMediaTypes.remove(MediaType.ALL);
            MediaType.sortBySpecificityAndQuality(acceptedMediaTypes);
            return acceptedMediaTypes.stream()
                    .anyMatch(MediaType.TEXT_HTML::isCompatibleWith);
        } catch (InvalidMediaTypeException ex) {
            return false;
        }
    }

}
