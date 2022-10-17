package com.faity.auth.authorication.service;

import com.google.common.base.Objects;
import lombok.Getter;
import org.springframework.http.HttpMethod;
import org.springframework.security.web.servlet.util.matcher.MvcRequestMatcher;
import org.springframework.web.servlet.handler.HandlerMappingIntrospector;

@Getter
public class NewMvcRequestMatcher extends MvcRequestMatcher {

    private String url;
    private String method;

    public NewMvcRequestMatcher(HandlerMappingIntrospector introspector, String url, String method) {
        super(introspector, url);
        this.setMethod(HttpMethod.resolve(method));
        this.url = url;
        this.method = method;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        NewMvcRequestMatcher that = (NewMvcRequestMatcher) o;
        return Objects.equal(url, that.url) &&
                Objects.equal(method, that.method);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(url, method);
    }
}
