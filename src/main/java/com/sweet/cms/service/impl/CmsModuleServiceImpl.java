package com.sweet.cms.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.sweet.cms.commons.base.Query;
import com.sweet.cms.constant.PageManagerConstant;
import com.sweet.cms.mapper.CmsModuleCommodityMapper;
import com.sweet.cms.mapper.CmsModuleDetailsMapper;
import com.sweet.cms.mapper.CmsModuleMapper;
import com.sweet.cms.model.CmsModule;
import com.sweet.cms.model.CmsModuleCommodity;
import com.sweet.cms.model.CmsModuleDetails;
import com.sweet.cms.model.TopicCommodity;
import com.sweet.cms.model.vo.CommodityVo;
import com.sweet.cms.service.ICmsModuleService;
import com.sweet.cms.service.ICommodityService;
import com.sweet.cms.service.ITopicCommodityService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;

@Service
public class CmsModuleServiceImpl extends ServiceImpl<CmsModuleMapper, CmsModule>  implements ICmsModuleService {

	@Resource
	private CmsModuleMapper cmsModuleMapper;
	@Resource
	private CmsModuleDetailsMapper cmsModuleDetailsMapper;
	@Resource
	private CmsModuleCommodityMapper cmsModuleCommodityMapper;
	@Resource
	private ICommodityService commodityService;
	@Resource
	private ITopicCommodityService topicCommodityService;


	@Override
	public List<CmsModule> queryCmsModuleDCList(CmsModule cmsModule) {
		List<CmsModule> cmsModules = this.cmsModuleMapper.queryCmsModuleList(cmsModule);
		Date today = new Date();
		if(cmsModules!=null && cmsModules.size()>0){
			for(int i=0;i<cmsModules.size();i++){
				CmsModule module = cmsModules.get(i);
				//模块对应商品列表查询
				if(module.getModuleStyle() == 16){
					setGoodsModule(module,PageManagerConstant.MODULE16_PAGESIZE);
				}else if(module.getModuleStyle() == 15 || module.getModuleStyle() == 12){
					setModuleCommodity(module);
				}
				//未启用判断
				if(module.getIsDisplay() == PageManagerConstant.NOT_DISPLAYED){
					module.setOnlineState(PageManagerConstant.NOT_ONLINED);
				}
				//已启用判断
				if(module.getIsDisplay() == PageManagerConstant.DISPLAYED){
					List<CmsModuleDetails> cmsDetails = module.getModuleDetails();
					if(cmsDetails!=null && cmsDetails.size()>0){
						//轮播图判断
						if(module.getModuleType() == PageManagerConstant.CAROUSEL_MODULE){
							for(int j=0;j<cmsDetails.size();j++){
								Date subStartTime = cmsDetails.get(j).getSubStartTime();
								//如果时间不为空，判断待上线和已上线状态
								if(subStartTime != null){
									if(subStartTime.compareTo(today)>0){
										cmsDetails.get(j).setOnlineState(PageManagerConstant.TO_BE_ONLINE);
									}else{
										cmsDetails.get(j).setOnlineState(PageManagerConstant.ONLINED);
									}
								}
								//如果时间为空，则为已上线状态
								if(subStartTime == null){
									cmsDetails.get(j).setOnlineState(PageManagerConstant.ONLINED);
								}
							}
						}
						//非轮播图判断
						if(module.getModuleType() != PageManagerConstant.CAROUSEL_MODULE){
							Date startTime = module.getStartTime();
							//如果时间不为空，判断待上线和已上线状态
							if(startTime!=null){
								if(startTime.compareTo(today)>0){
									module.setOnlineState(PageManagerConstant.TO_BE_ONLINE);
								}else{
									module.setOnlineState(PageManagerConstant.ONLINED);
								}
							}
							//如果时间为空，则为已上线状态
							if(startTime==null){
								module.setOnlineState(PageManagerConstant.ONLINED);
							}
						}
					}
				}
			}
		}
		return cmsModules;
	}

	@Override
	@Transactional
	public Long insertCmsModule(CmsModule cmsModule) {
		return this.cmsModuleMapper.insertCmsModule(cmsModule);
	}

	@Override
	@Transactional
	public int updateCmsModule(CmsModule cmsModule) {
		return this.cmsModuleMapper.updateCmsModule(cmsModule);
	}

	@Override
	@Transactional
	public void delCmsModuleById(Long moduleId) {
		this.cmsModuleMapper.delCmsModuleById(moduleId);
	}

	@Override
	@Transactional
	public void delModuleByNavigationId(Long pageManagerId) {
		CmsModule cmsModule = new CmsModule();
		cmsModule.setPageManagerId(pageManagerId);
		List<CmsModule> cmsModules = cmsModuleMapper.queryCmsModuleList(cmsModule);
		if(cmsModules!=null && cmsModules.size()>0){
			for(int i=0;i<cmsModules.size();i++){
				CmsModule module = cmsModules.get(i);
				if(module!=null){
					this.cmsModuleDetailsMapper.delModuleDetailsByPid(module.getId());
					this.cmsModuleCommodityMapper.delModuleCommodityByPid(module.getId());
				}
			}
		}
		this.cmsModuleMapper.delModuleByPageManagerId(pageManagerId);
	}

	@Override
	public CmsModule getCmsModuleById(Long moduleId) {
		CmsModule cmsModule = this.cmsModuleMapper.getCmsModuleById(moduleId);
		if(cmsModule!=null){
			//模块对应商品列表查询
			if(cmsModule.getModuleStyle() == 16){
				setGoodsModule(cmsModule,PageManagerConstant.MODULE16_PAGESIZE);
			}else if(cmsModule.getModuleStyle() == 15 || cmsModule.getModuleStyle() == 12){
				setModuleCommodity(cmsModule);
			}
		}
		return cmsModule;
	}
	
	/**
	 * 模块对应商品列表查询
	 * @param cmsModule
	 */
	private void setModuleCommodity(CmsModule cmsModule){
		CmsModuleCommodity cmsCommodity = new CmsModuleCommodity();
		cmsCommodity.setModuleId(cmsModule.getId());
		List<CmsModuleCommodity> cmsCommodities = cmsModuleCommodityMapper.queryCmsCommodityList(cmsCommodity);
		
		if(cmsCommodities != null && cmsCommodities.size()>0){
			List<String> nos = new ArrayList<String>();
			for(int i=0;i<cmsCommodities.size();i++){
				nos.add(cmsCommodities.get(i).getCommodityCode());
			}
			List<CommodityVo> commodityVos = commodityService.getCommodityList(nos,false,false);
			Map<String,Object> commdityMap = new HashMap<>();
			if(commodityVos != null && commodityVos.size()>0){
				for(int i=0;i<commodityVos.size();i++){
					CommodityVo commodityVo = commodityVos.get(i);
					commdityMap.put(commodityVo.getCommodityNo(),commodityVo);
				}
			}
			for (CmsModuleCommodity commodity : cmsCommodities) {
				CommodityVo commodityVo = (CommodityVo) commdityMap.get(commodity.getCommodityCode());
				if (commodityVo!=null) {
					commodity.setDefaultPic(commodityVo.getDefaultPic());
					commodity.setInventoryNumber(commodityVo.getStock());
					commodity.setMarketPrice(commodityVo.getMarketPrice());
					commodity.setSalePrice(commodityVo.getSalePrice());
				}
			}
		}
		cmsModule.setModuleCommoditys(cmsCommodities);
	}
	
	/**
	 * 模块16对应商品列表查询,从促销专题查询商品
	 * @param cmsModule
	 */
	private void setGoodsModule(CmsModule cmsModule,int pageSize){
		List<CmsModuleCommodity> cmsCommodities = new ArrayList<CmsModuleCommodity>();
		try {
			Query query = new Query();
			query.setPageSize(pageSize);
			List<TopicCommodity> commodityList = topicCommodityService.getTopicCommodityByTopicIdOfPage(
					cmsModule.getModuleDetails().get(0).getCommonId(), query);
			if(commodityList != null && commodityList.size()>0){
				List<String> nos = new ArrayList<String>();
				String[] nosArr=new String[commodityList.size()];
				for(int i=0;i<commodityList.size();i++){
					nos.add(commodityList.get(i).getCommodityNo());
				}
				List<CommodityVo> commodityVos = commodityService.getCommodityList(nos,false,false);
				Map<String,Object> commdityMap = new HashMap<>();
				if(commodityVos != null && commodityVos.size()>0){
					for(int i=0;i<commodityVos.size();i++){
						CommodityVo commodityVo = commodityVos.get(i);
						commdityMap.put(commodityVo.getCommodityNo(),commodityVo);
					}
				}
				//对商品进行排序 start
				for (TopicCommodity commodity : commodityList) {
					CommodityVo commodityVo = (CommodityVo) commdityMap.get(commodity.getCommodityNo());
					if (commodityVo!=null) {
						CmsModuleCommodity cmsModuleCommodity = new CmsModuleCommodity();
						cmsModuleCommodity.setCommodityCode(commodity.getCommodityNo());
						cmsModuleCommodity.setDefaultPic(commodityVo.getDefaultPic());
						cmsModuleCommodity.setInventoryNumber(commodityVo.getStock());
						cmsModuleCommodity.setMarketPrice(commodityVo.getMarketPrice());
						cmsModuleCommodity.setSalePrice(commodityVo.getSalePrice());
						cmsCommodities.add(cmsModuleCommodity);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		cmsModule.setModuleCommoditys(cmsCommodities);
	}

	@Override
	@Transactional
	public void batchChangeStatus(Long[] strArray, int isDisplay) {
		this.cmsModuleMapper.batchChangeStatus(strArray, isDisplay);
	}

	@Override
	@Transactional
	public void updateSort(List<CmsModule> moduleList) {
		this.cmsModuleMapper.updateSort(moduleList);
	}

	@Override
	public List<CmsModule> queryCmsModuleDetailsForClient(CmsModule cmsModule,String productLineCode) {
		Date nowDate = new Date();
		List<CmsModule> cmsModules = this.cmsModuleMapper.queryCmsModuleDetailsForClient(cmsModule);
		if(cmsModules!=null && cmsModules.size()>0){
			for(int i=0;i<cmsModules.size();i++){
				CmsModule module = cmsModules.get(i);
				//模块对应商品列表查询
				if(module.getModuleStyle() == 16){
//					setGoodsModuleForClient(module);
				}else if(module.getModuleStyle() == 15 || module.getModuleStyle() == 12){
					setModuleCommodityForClient(module);
				}
			}
		}
		return cmsModules;
	}
	
	/**
	 * 模块对应商品列表查询
	 * @param cmsModule
	 */
	private void setModuleCommodityForClient(CmsModule cmsModule){
		CmsModuleCommodity cmsCommodity = new CmsModuleCommodity();
		cmsCommodity.setModuleId(cmsModule.getId());
		List<CmsModuleCommodity> cmsCommodities = cmsModuleCommodityMapper.queryCmsCommodityList(cmsCommodity);
		List<CmsModuleDetails> moduleDetails = new ArrayList<CmsModuleDetails>();
		if(cmsCommodities != null && cmsCommodities.size()>0){
			List<String> nos = new ArrayList<String>();
			for(int i=0;i<cmsCommodities.size();i++){
				nos.add(cmsCommodities.get(i).getCommodityCode());
			}
			List<CommodityVo> commodityVos = commodityService.getCommodityList(nos,true,false);
			Map<String,Object> commdityMap = new HashMap<>();
			if(commodityVos != null && commodityVos.size()>0){
				for(int i=0;i<commodityVos.size();i++){
					CommodityVo commodityVo = commodityVos.get(i);
					commdityMap.put(commodityVo.getCommodityNo(),commodityVo);
				}
			}
			//对商品进行排序 start     
			for (CmsModuleCommodity commodity : cmsCommodities) {
				CommodityVo commodityVo = (CommodityVo) commdityMap.get(commodity.getCommodityCode());
				if (commodityVo!=null) {
					CmsModuleDetails cmsDetails = new CmsModuleDetails();
					cmsDetails.setModuleId(cmsModule.getId());
					cmsDetails.setImgUrl(commodityVo.getDefaultPic());
					cmsDetails.setCommodityName(commodityVo.getCommodityName());
					cmsDetails.setMarketPrice(commodityVo.getMarketPrice());
					cmsDetails.setSalePrice(commodityVo.getSalePrice());
					cmsDetails.setCommonId(commodity.getCommodityCode());
					cmsDetails.setSubType(PageManagerConstant.COMMODITY_LIST);
					moduleDetails.add(cmsDetails);
				}
			}
		}
		cmsModule.setModuleDetails(moduleDetails);
	}
	
//	/**
//	 * 模块16对应商品列表查询,从促销专题查询商品
//	 * @param cmsModule
//	 */
//	private void setGoodsModuleForClient(CmsModule cmsModule){
//		List<CmsModuleDetails> moduleDetails = new ArrayList<CmsModuleDetails>();
//		Map<String,String> params = new HashMap<String, String>();
//		try {
//			if(cmsModule != null && cmsModule.getModuleDetails() != null && cmsModule.getModuleDetails().size()>0){
//				CmsModuleDetails details = cmsModule.getModuleDetails().get(0);
//				if(details != null){
//					String topicId = details.getCommonId();
//					CmsTopics cmsTopics = cmsTopicsService.getCmsTopicsById(topicId);
//					int listsortType = 1;
//					if(cmsTopics != null && cmsTopics.getListsortType() != null){
//						listsortType = cmsTopics.getListsortType();
//					}
//					//按搜索排序
//					if(listsortType==1){
//						params.put("topicId", topicId);
//						params.put("orderBy", "num");
//						params.put("pageSize","500");
//						TSearchResult searchResult = this.wapSearch.getSearchResult(params);
//						List<MixCommodity> mixList = commoditySearchService.getCommodityList(searchResult, 0);
//						if(mixList != null && mixList.size()>0){
//							for(int i=0;i<mixList.size();i++){
//								MixCommodity mixCommodity = mixList.get(i);
//								if(mixCommodity != null){
//									CmsModuleDetails cmsModuleDetails = new CmsModuleDetails();
//									cmsModuleDetails.setCommodityName(mixCommodity.getCommodityName());
//									cmsModuleDetails.setModuleId(cmsModule.getId());
//									cmsModuleDetails.setSubType(PageManagerConstant.COMMODITY_LIST);
//									cmsModuleDetails.setSkipType(PageManagerConstant.COMMODITY_LIST);
//									String defaultPic = mixCommodity.getDefaultPic();
//									if(StringUtils.isNotBlank(defaultPic)){
//										defaultPic=defaultPic.replace("s.jpg","m.jpg");
//									}
//									cmsModuleDetails.setImgUrl(defaultPic);
//									cmsModuleDetails.setCommonId(mixCommodity.getCommodityNo());
//									cmsModuleDetails.setPublicPrice(mixCommodity.getPublicPrice());
//									cmsModuleDetails.setSalePriceN(packageSalePriceN(mixCommodity));
//									moduleDetails.add(cmsModuleDetails);
//								}
//							}
//						}
//					}
//
//					//按自定义排序
//					if(listsortType==2){
//						Query query = new Query();
//						query.setPageSize(300);
//						List<CmsTopicsCommodity> commodityList = cmsTopicsCommodityService.getTopicCommodityByTopicIdOfPage(
//								cmsModule.getModuleDetails().get(0).getCommonId(), query);
//						if(commodityList != null && commodityList.size()>0){
//							List<String> nos = new ArrayList<String>();
//							String[] nosArr=new String[commodityList.size()];
//							for(int i=0;i<commodityList.size();i++){
//								nos.add(commodityList.get(i).getCommodityCode());
//								nosArr[i]=commodityList.get(i).getCommodityCode();
//							}
//							List<CommodityStyle> commList = commodityStyleService.getCommodityByNoList(nos);
//							//由CommodityStyle实体类的list转化为包含MixCommodity的map,目的为了获取促销价格
//							Map<String, MixCommodity> mixMap = changeListToMap(commList);
//							//对商品进行排序 start
//							for (CmsTopicsCommodity commodity : commodityList) {
//								MixCommodity mixCommodity = mixMap.get(commodity.getCommodityCode());
//								if (mixCommodity!=null) {
//									CmsModuleDetails cmsModuleDetails = new CmsModuleDetails();
//									cmsModuleDetails.setCommodityName(mixCommodity.getCommodityName());
//									cmsModuleDetails.setModuleId(cmsModule.getId());
//									cmsModuleDetails.setSubType(PageManagerConstant.COMMODITY_LIST);
//									cmsModuleDetails.setSkipType(PageManagerConstant.COMMODITY_LIST);
//									String defaultPic = mixCommodity.getDefaultPic();
//									if(StringUtils.isNotBlank(defaultPic)){
//										defaultPic=defaultPic.replace("s.jpg","m.jpg");
//									}
//									cmsModuleDetails.setImgUrl(defaultPic);
//									cmsModuleDetails.setCommonId(mixCommodity.getCommodityNo());
//									cmsModuleDetails.setPublicPrice(mixCommodity.getPublicPrice());
//									cmsModuleDetails.setSalePriceN(packageSalePriceN(mixCommodity));
//									moduleDetails.add(cmsModuleDetails);
//								}
//							}
//						}
//					}
//				}
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		cmsModule.setModuleDetails(moduleDetails);
//	}

	@Override
	public List<CmsModule> queryCmsModuleList(CmsModule cmsModule) {
		return cmsModuleMapper.queryCmsModuleList(cmsModule);
	}
}
