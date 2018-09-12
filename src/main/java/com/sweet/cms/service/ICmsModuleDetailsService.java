package com.sweet.cms.service;


import com.baomidou.mybatisplus.service.IService;
import com.sweet.cms.model.CmsModuleDetails;

import java.util.List;

/**
 * 子模块service
 * @author wang.s2
 *
 */
public interface ICmsModuleDetailsService extends IService<CmsModuleDetails> {

	/**
	 * 添加模块子表
	 * @param details
	 */
	public void insertCmsModuleDetails(CmsModuleDetails details);
	
	/**
	 * 批量添加子模块
	 * @param cmsDetailsList
	 */
	public void insertCmsDetailBatch(List<CmsModuleDetails> cmsDetailsList);
	
	/**
	 * 根据主键id删除模块子表
	 * @param id
	 */
	public void delModuleDetailsById(Long id);
	
	/**
	 * 根据模块id删除模块子表
	 * @param moduleId
	 */
	public void delModuleDetailsByPid(Long moduleId);
}
