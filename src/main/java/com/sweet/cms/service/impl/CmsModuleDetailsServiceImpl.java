package com.sweet.cms.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.sweet.cms.mapper.CmsModuleDetailsMapper;
import com.sweet.cms.model.CmsModuleDetails;
import com.sweet.cms.service.ICmsModuleDetailsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CmsModuleDetailsServiceImpl extends ServiceImpl<CmsModuleDetailsMapper, CmsModuleDetails> implements ICmsModuleDetailsService {
	
	@Resource
	private CmsModuleDetailsMapper cmsModuleDetailsMapper;

	@Override
	@Transactional
	public void insertCmsModuleDetails(CmsModuleDetails details) {
		this.cmsModuleDetailsMapper.insertCmsModuleDetails(details);
	}
	
	@Override
	@Transactional
	public void insertCmsDetailBatch(List<CmsModuleDetails> cmsDetailsList) {
		this.cmsModuleDetailsMapper.insertCmsDetailBatch(cmsDetailsList);
	}

	@Override
	@Transactional
	public void delModuleDetailsById(Long id) {
		this.cmsModuleDetailsMapper.delModuleDetailsById(id);
	}

	@Override
	@Transactional
	public void delModuleDetailsByPid(Long moduleId) {
		this.cmsModuleDetailsMapper.delModuleDetailsByPid(moduleId);
	}
}
