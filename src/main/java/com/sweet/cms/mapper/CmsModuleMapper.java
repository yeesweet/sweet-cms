package com.sweet.cms.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.sweet.cms.model.CmsModule;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface CmsModuleMapper extends BaseMapper<CmsModule> {

	/**
	 * 根据条件查询模块列表
	 * @param cmsModule
	 * @return
	 */
	public List<CmsModule>  queryCmsModuleList(CmsModule cmsModule);
	
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
	public void delModuleByPageManagerId(Long pageManagerId);
	
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
	 * @return
	 */
	public List<CmsModule> queryCmsModuleDetailsForClient(CmsModule cmsModule);

}
