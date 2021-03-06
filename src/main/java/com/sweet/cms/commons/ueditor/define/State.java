package com.sweet.cms.commons.ueditor.define;

import java.util.Map;

/**
 * 处理状态接口
 * 
 * @author zhang.hp
 * 
 */
public interface State {

	public boolean isSuccess();

	public void putInfo(String name, String val);

	public void putInfo(String name, long val);

	public String toJSONString();
	
	public Map<String, Object> toJSONObject();

}
