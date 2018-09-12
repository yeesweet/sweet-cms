package com.sweet.cms.commons.csrf;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Csrf过滤注解
 * @author zhang.hp
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface CsrfToken {
	boolean create() default false;
	boolean remove() default false;
}
