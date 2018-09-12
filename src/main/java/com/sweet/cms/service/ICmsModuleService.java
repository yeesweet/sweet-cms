package com.sweet.cms.service;

import com.baomidou.mybatisplus.service.IService;
import com.sweet.cms.model.CmsModule;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 页面管理模块service
 * @author wang.s2
 *
 */
public interface ICmsModuleService extends IService<CmsModule> {

	/**
	 * 根据条件查询模块列表
	 * @param cmsModule
	 * @return
	 */
	public List<CmsModule>  queryCmsModuleDCList(CmsModule cmsModule);

	/**
	 * 添加模块
	 * @param cmsModule
	 */
	public Long insertCmsModule(CmsModule cmsModule);

	/**
	 * 更新模块
	 * @param cmsModule
	 */
	public int updateCmsModule(CmsModule cmsModule);

	/**
	 * 根据主键id删除模块
	 * @param moduleId
	 */
	public void delCmsModuleById(Long moduleId);

	/**
	 * 根据频道id物理删除模块
	 */
	public void delModuleByNavigationId(Long navigationId);

	/**
	 * 根据id查询模块详情
	 * @param moduleId
	 * @return
	 */
	public CmsModule getCmsModuleById(Long moduleId);

	/**
	 * 批量更新状态
	 * @param idArr
	 * @param isDisplay
	 */
	public void batchChangeStatus(@Param(value = "idArr") Long[] idArr, @Param(value = "isDisplay") int isDisplay);

	/**
	 * 模块排序
	 * @param moduleList
	 */
	public void updateSort(List<CmsModule> moduleList);

	/**
	 * 查询模块列表详情（为mall和touch提供）
	 * @param cmsModule
	 * @param productLineCode
	 * @return
	 */
	public List<CmsModule> queryCmsModuleDetailsForClient(CmsModule cmsModule, String productLineCode);

	/**
	 * 根据条件查询模块列表
	 * @param cmsModule
	 * @return
	 */
	public List<CmsModule>  queryCmsModuleList(CmsModule cmsModule);
}
