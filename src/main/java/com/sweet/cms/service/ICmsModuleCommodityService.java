package com.sweet.cms.service;


import com.baomidou.mybatisplus.service.IService;
import com.sweet.cms.model.CmsModuleCommodity;

import java.util.List;

/**
 * 模块商品service
 * @author wang.s2
 *
 */
public interface ICmsModuleCommodityService  extends IService<CmsModuleCommodity> {
	/**
	 * 添加模块商品
	 * @param commodity
	 */
	public void insertCmsModuleCommodity(CmsModuleCommodity commodity);
	
	/**
	 * 批量添加模块商品
	 * @param cmsCommodityList
	 */
	public void insertCmsCommodityBatch(List<CmsModuleCommodity> cmsCommodityList);
	
	/**
	 * 根据主键id删除模块子表数据
	 * @param id
	 */
	public void delModuleCommodityById(Long id);
	
	/**
	 * 根据模块id删除模块商品
	 * @param moduleId
	 */
	public void delModuleCommodityByPid(Long moduleId);
	
	/**
	 * 查询模块商品列表
	 * @param cmsModuleCommodity
	 * @return
	 */
	public List<CmsModuleCommodity> queryCmsCommodityList(CmsModuleCommodity cmsModuleCommodity);
}
