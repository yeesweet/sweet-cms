package com.sweet.cms.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.sweet.cms.mapper.CmsModuleCommodityMapper;
import com.sweet.cms.model.CmsModuleCommodity;
import com.sweet.cms.service.ICmsModuleCommodityService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CmsModuleCommodityServiceImpl extends ServiceImpl<CmsModuleCommodityMapper, CmsModuleCommodity> implements
		ICmsModuleCommodityService {

	@Resource
	private CmsModuleCommodityMapper cmsModuleCommodityMapper;
	
	@Override
	@Transactional
	public void insertCmsModuleCommodity(CmsModuleCommodity commodity) {
		this.cmsModuleCommodityMapper.insertCmsModuleCommodity(commodity);
	}
	
	@Override
	@Transactional
	public void insertCmsCommodityBatch(
			List<CmsModuleCommodity> cmsCommodityList) {
		this.cmsModuleCommodityMapper.insertCmsCommodityBatch(cmsCommodityList);
	}

	@Override
	@Transactional
	public void delModuleCommodityById(Long id) {
		this.cmsModuleCommodityMapper.delModuleCommodityById(id);
	}

	@Override
	@Transactional
	public void delModuleCommodityByPid(Long moduleId) {
		this.cmsModuleCommodityMapper.delModuleCommodityByPid(moduleId);
	}

	@Override
	public List<CmsModuleCommodity> queryCmsCommodityList(
			CmsModuleCommodity cmsModuleCommodity) {
		return this.cmsModuleCommodityMapper.queryCmsCommodityList(cmsModuleCommodity);
	}
}
