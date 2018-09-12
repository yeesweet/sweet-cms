package com.sweet.cms.controller;

import com.sweet.cms.commons.base.BaseController;
import com.sweet.cms.constant.PageManagerConstant;
import com.sweet.cms.model.*;
import com.sweet.cms.model.vo.CommodityVo;
import com.sweet.cms.service.*;
import com.sweet.cms.util.DateUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("/cmsModuleController")
public class CmsModuleController extends BaseController {
	
	@Resource
	private ICmsModuleService cmsModuleService;
	@Resource
	private ICmsModuleDetailsService cmsModuleDetailsService;
	@Resource
	private ICmsModuleCommodityService cmsModuleCommodityService;
	@Resource
	private IPageManagerService pageManagerService;
	@Resource
	private ICommodityService commodityService;

	/**
	 * 添加模块页面
	 * @param id
	 * @param moduleStyle  模块样式
	 * @param moduleType   模块类型
	 * @param pageManagerId   活动页id
	 * @param model
	 * @return
	 */
	@RequestMapping("/toAddModule")
	public String toAddModule(Long id, int moduleStyle, int moduleType,
                                    Long pageManagerId, Model model){
		String viewName = "";
		model.addAttribute("moduleStyle",moduleStyle);
		model.addAttribute("moduleType",moduleType);
		model.addAttribute("pageManagerId",pageManagerId);
		try{
			//如果id不为空，跳转到编辑页面
			if(id != null && id != 0){
				CmsModule cmsModule = this.cmsModuleService.getCmsModuleById(id);
				model.addAttribute("cmsModule", cmsModule);
				List<CmsModuleDetails> moduleDetails = cmsModule.getModuleDetails();
				for (CmsModuleDetails moduleDetail : moduleDetails) {
					if(moduleDetail.getSubType()!=null){
//						//5促销专题
//						if(moduleDetail.getSubType() == PageManagerConstant.TOPICS_LIST){
//							List<CmsTopics> topicsList = cmsTopicsService.getActiveTopics(CmsConstant.GENERALL_TOPICS,CmsConstant.LINKPLACEMENT_ADVERT);
//							model.addAttribute("topicsList",topicsList);
//				   		}
						//1007商品详情 这里的commonId对应的是商品no
						if(moduleDetail.getSubType() == PageManagerConstant.COMMODITY_LIST){
							if(StringUtils.isNotBlank(moduleDetail.getCommonId())){
								Commodity commodity = new Commodity();
								commodity.setCommodityNo(moduleDetail.getCommonId());
								CommodityVo commodityVo = commodityService.selectCommodityInfo(commodity);
				   				if(commodityVo != null){
				   					moduleDetail.setCommodityName(commodityVo.getCommodityName());
				   				}
				   				model.addAttribute("commodityVo", commodityVo);
				   			}
						}
						//1026活动页页面列表
						if(moduleDetail.getSubType() == PageManagerConstant.ACTIVITY_LIST){
							if(StringUtils.isNotBlank(moduleDetail.getCommonId())){
								PageManager pageManager = new PageManager();
								pageManager.setType(PageManagerConstant.ACTIVITY_LIST);
								pageManager.setIsDelete(PageManagerConstant.NOT_DELETED);
								pageManager.setIsDisplay(PageManagerConstant.DISPLAYED);
								List<PageManager> pageManagerList = pageManagerService.getPageManagerList(pageManager);
								model.addAttribute("pageManagerList", pageManagerList);
							}
						}
					}
				}
				if(moduleType == PageManagerConstant.COMMON_MODULE){
					viewName = "admin/pageManager/module/edit_cms_module";
				}
				if(moduleType == PageManagerConstant.RECOMMEND_MODULE){
					viewName = "admin/pageManager/module/edit_cms_recommend";
				}
                if(moduleType == PageManagerConstant.RECOMMEND_TWO_MODULE){
                    viewName = "admin/pageManager/module/edit_cms_recommend2";
                }
				if(moduleType == PageManagerConstant.CAROUSEL_MODULE){
					viewName = "admin/pageManager/module/edit_cms_lunbo";
				}
				if(moduleType == PageManagerConstant.WEBVIEW_MODULE){
					viewName = "admin/pageManager/module/edit_cms_webview";
				}
			}
			//如果id为空,跳转到添加页面
			if(id == null){
				if(moduleType == PageManagerConstant.COMMON_MODULE){
					viewName = "admin/pageManager/module/add_cms_module";
				}
				if(moduleType == PageManagerConstant.RECOMMEND_MODULE){
					viewName = "admin/pageManager/module/add_cms_recommend";
				}
                if(moduleType == PageManagerConstant.RECOMMEND_TWO_MODULE){
                    viewName = "admin/pageManager/module/add_cms_recommend2";
                }
				if(moduleType == PageManagerConstant.CAROUSEL_MODULE){
					viewName = "admin/pageManager/module/add_cms_lunbo";
				}
				if(moduleType == PageManagerConstant.WEBVIEW_MODULE){
					viewName = "admin/pageManager/module/add_cms_webview";
				}
			}
		}catch(Exception e){
			logger.error("添加模块出错",e);
		}
		return viewName;
	}
	
	/**
	 * 保存模块
	 * @param cmsModule
	 * @param pageManagerId  活动页id
	 * @param commodity   商品编号
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveModule")
	public String saveModule(CmsModule cmsModule, Long pageManagerId, String commodity,
                                   Model model, HttpServletRequest request){
		try{
			//新增模块
			cmsModule.setIsDisplay(PageManagerConstant.NOT_DISPLAYED);
			cmsModule.setIsDelete(PageManagerConstant.NOT_DELETED);
			cmsModule.setOperator(this.getStaffName());
			String starttime = cmsModule.getStarttime();
			if(starttime!=null && starttime!=""){
				cmsModule.setStartTime(DateUtil.getdate1(starttime));
			}
			String endtime = cmsModule.getEndtime();
			if(endtime!=null && endtime!=""){
				cmsModule.setEndTime(DateUtil.getdate1(endtime));
			}
			cmsModuleService.insert(cmsModule);
			Long id = cmsModule.getId();
			//保存子模块及模块商品
			saveModuleDetailAndCommodity(cmsModule, id,commodity);
			
		}catch(Exception e){
			logger.error("保存模块异常",e);
		}
		String url = "";
		if(pageManagerId != null){
			url = "redirect:/pageManager/editPage?id="+cmsModule.getPageManagerId();
		}
		return url;
	}
	
	/**
	 * 更新模块
	 * @param cmsModule
	 * @param pageManagerId  活动页id
	 * @param commodity   商品编号
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/updateModule")
	public String updateModule(CmsModule cmsModule, Long pageManagerId, String commodity,
                                     Model model, HttpServletRequest request){
		try{
			//更新模块
			cmsModuleDetailsService.delModuleDetailsByPid(cmsModule.getId());
			cmsModule.setOperator(this.getStaffName());
			String starttime = cmsModule.getStarttime();
			if(starttime!=null && starttime!=""){
				cmsModule.setStartTime(DateUtil.getdate1(starttime));
			}
			String endtime = cmsModule.getEndtime();
			if(endtime!=null && endtime!=""){
				cmsModule.setEndTime(DateUtil.getdate1(endtime));
			}
			cmsModuleService.updateCmsModule(cmsModule);
			//保存子模块及模块商品
			saveModuleDetailAndCommodity(cmsModule, cmsModule.getId() ,commodity);
			
		}catch(Exception e){
			logger.error("保存模块异常",e);
		}
		String url = "";
		if(pageManagerId != null){
			url = "redirect:/pageManager/editPage?id="+cmsModule.getPageManagerId();
		}
		return url;
	}
	
	/**
	 * 保存子模块及模块商品
	 * @param cmsModule
	 * @param id
	 * @param commodity  商品编号
	 * @throws Exception
	 */
	public void saveModuleDetailAndCommodity(CmsModule cmsModule,long id,String commodity) throws Exception{
		//子模块保存
		List<CmsModuleDetails> moduleDetailsList = cmsModule.getModuleDetails();
		cmsModuleDetailsService.delModuleDetailsByPid(id);
		if(moduleDetailsList !=null && moduleDetailsList.size()>0 && cmsModule.getModuleStyle() != 12 && cmsModule.getModuleStyle() != 15){
			for (int i = 0; i < moduleDetailsList.size(); i++) {
				CmsModuleDetails moduleDetail = moduleDetailsList.get(i);
				if(moduleDetail.getSubType() == null){
					moduleDetail.setSubType(0);
				}
				moduleDetail.setModuleId(id);
				moduleDetail.setOperator(this.getStaffName());
				
				String subStarttime = moduleDetail.getSubStarttime();
				if(subStarttime!=null && subStarttime!=""){
					moduleDetail.setSubStartTime(DateUtil.getdate1(subStarttime));
				}
				String subEndtime = moduleDetail.getSubEndtime();
				if(subEndtime!=null && subEndtime!=""){
					moduleDetail.setSubEndTime(DateUtil.getdate1(subEndtime));
				}
				cmsModuleDetailsService.insert(moduleDetail);
			}
		}
		if(cmsModule.getModuleStyle() == 12 || cmsModule.getModuleStyle() == 15){
			CmsModuleDetails detail = new CmsModuleDetails();
			detail.setModuleId(id);
			detail.setOperator(this.getStaffName());
			detail.setSubType(PageManagerConstant.COMMODITY_LIST);
			cmsModuleDetailsService.insert(detail);
		}
		//模块商品保存
		if(commodity != null && !commodity.isEmpty()){
			cmsModuleCommodityService.delModuleCommodityByPid(cmsModule.getId());
			String[] commodityArr = commodity.split(",");
			if(commodityArr != null && commodityArr.length>0){
				for(int j=0;j<commodityArr.length;j++){
					if(!commodityArr[j].isEmpty()){
						CmsModuleCommodity moduleCommodity = new CmsModuleCommodity();
						moduleCommodity.setModuleId(id);
						moduleCommodity.setSortNo(j+1);
						moduleCommodity.setCommodityCode(commodityArr[j]);
						moduleCommodity.setOperator(this.getStaffName());
						this.cmsModuleCommodityService.insert(moduleCommodity);
					}
				}
			}
		}
	}
	
	/**
	 * 删除模块
	 * @param moduleId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/deleteModule")
	public String deleteModule(Long moduleId,HttpServletRequest request){
		String result = "";
		try{
			cmsModuleService.delCmsModuleById(moduleId);
			result = "success";
		}catch(Exception e){
			logger.error("删除模块异常",e);
			result = "fail";
		}
		return result;
	}
	
	/**
	 * 启用停用功能
	 * @param moduleId
	 * @param status
	 * @param pageManagerId
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/toChangeStatus")
	public String toChangeStatus(Long moduleId, Integer status, Long pageManagerId, Model model, HttpServletRequest request){
		CmsModule cmsModule = cmsModuleService.getCmsModuleById(moduleId);
		try{
			cmsModule.setIsDisplay(status);
			cmsModuleService.updateCmsModule(cmsModule);
		}catch(Exception e){
			logger.error("修改状态失败",e);
		}
		return this.toAddModule(cmsModule.getId(), cmsModule.getModuleStyle(), cmsModule.getModuleType(),pageManagerId, model);
	}
	
	/**
	 * 选择链接位置
	 * @param linkType
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getLinkTypeDate")
	public String getLinkTypeDate(int linkType){
		JSONArray json = new JSONArray();
		try{
			//促销专题
			if(linkType == PageManagerConstant.TOPICS_LIST){
//	    		List<CmsTopics> list = null;
//	    		if(effectRange == 3){
//	    			list = cmsTopicsService.getActiveTopics(CmsConstant.GENERALL_TOPICS,CmsConstant.LINKPLACEMENT_SMALL_ADS);
//	   			} else {
//	   				list = cmsTopicsService.getActiveTopics(CmsConstant.GENERALL_TOPICS,CmsConstant.LINKPLACEMENT_ADVERT);
//	   			}
//	   			json = JSONArray.fromObject(list);
	   		}else if(linkType == PageManagerConstant.ACTIVITY_LIST){//活动列表页
				PageManager pageManager = new PageManager();
				pageManager.setType(PageManagerConstant.ACTIVITY_LIST);
				pageManager.setIsDelete(PageManagerConstant.NOT_DELETED);
				pageManager.setIsDisplay(PageManagerConstant.DISPLAYED);
				List<PageManager> pageManagerList = pageManagerService.getPageManagerList(pageManager);
				if(pageManagerList != null){
					json = JSONArray.fromObject(pageManagerList);
				}
	   		}
		}catch(Exception e){
			logger.error("选择链接位置错误",e);
		}
		return json.toString();
	}
	
	/**
	 * 按商品编号查询商品
	 * @param ids 格式 2321321,34321432,543515125
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "getCommodityByIds")
	public String getCommodityByIds(String ids, Model map) throws Exception {
		if (StringUtils.isNotBlank(ids) && ids.length() > 1) {
			JSONObject object = new JSONObject();
			//返回按照导入的商品集合排序
			List<CmsModuleCommodity> commListSort = new ArrayList<CmsModuleCommodity>();
			//商品编号list
			List<String> commIdsList = new ArrayList<String>();
			String[] commoIds = ids.split(","); // 参数商品编号
			for (int i = 0; i < commoIds.length; i++) {
				commIdsList.add(commoIds[i]);
			}
			if (commIdsList!=null && commIdsList.size() > 0) {
				//售罄
				List<String> soldOutList = new ArrayList<String>();
				//下架
				List<String> shelveList = new ArrayList<String>();
				// 获取商品列表
				List<CommodityVo> commodityVos = commodityService.getCommodityList(commIdsList,true,false);
				Map<String,Object> commdityMap = new HashMap<>();
				if(commodityVos != null && commodityVos.size()>0){
					for(int i=0;i<commodityVos.size();i++){
						CommodityVo commodityVo = commodityVos.get(i);
						commdityMap.put(commodityVo.getCommodityNo(),commodityVo);
					}
				}
				//-------------对商品进行排序 start
				for (String commodityNo : commIdsList) {
					CommodityVo commodityVo = (CommodityVo) commdityMap.get(commodityNo);
					if (commodityVo!=null) {
						int inventoryNumber = commodityVo.getStock();
						if(inventoryNumber > 0){
							CmsModuleCommodity cmsModuleCommodity = new CmsModuleCommodity();
							cmsModuleCommodity.setCommodityCode(commodityNo);
							cmsModuleCommodity.setDefaultPic(commodityVo.getDefaultPic());
							cmsModuleCommodity.setInventoryNumber(inventoryNumber);
							cmsModuleCommodity.setMarketPrice(commodityVo.getMarketPrice());
							cmsModuleCommodity.setSalePrice(commodityVo.getSalePrice());
							commListSort.add(cmsModuleCommodity);
						}else{
							soldOutList.add(commodityNo);
						}
					}
					//如果没有查到该商品，则已经下架
					if(commodityVo == null){
						shelveList.add(commodityNo);
					}
				}
				//已经下架商品编号
				JSONArray arrayIds = new JSONArray();
				arrayIds.addAll(shelveList);
				object.put("errorid", arrayIds);
				//售罄编号list
				JSONArray arraySoldOut = new JSONArray();
				arraySoldOut.addAll(soldOutList);
				object.put("soldOutList", arraySoldOut);
				//排序结束
				JSONArray array = new JSONArray();
				array.addAll(commListSort);
				object.put("result", array);
			}
			return object.toString();
		} else {
			return null;
		}
	}
	
//	/**
//	 * 异步查询促销专题商品数据
//	 * @param topicId
//	 * @param page
//	 * @param map
//	 * @return
//	 * @throws Exception
//	 */
//	@ResponseBody
//	@RequestMapping(value = "getTopicCommodityMore")
//	public String getTopicCommodityMore(String topicId,int page, Model map) throws Exception {
//		List<CmsModuleCommodity> moList = new ArrayList<CmsModuleCommodity>();
//		Query query = new Query();
//		query.setPage(page);
//		query.setPageSize(PageManagerConstant.MODULE16_PAGESIZE);
//		int count = 0;
//		try {
//			count = cmsTopicsCommodityService.queryTopicCommodityByTopicIdCount(topicId);
//			List<CmsTopicsCommodity> commodityList = cmsTopicsCommodityService.getTopicCommodityByTopicIdOfPage(
//					topicId, query);
//			if(commodityList != null && commodityList.size()>0){
//				List<String> nos = new ArrayList<String>();
//				String[] nosArr=new String[commodityList.size()];
//				for(int i=0;i<commodityList.size();i++){
//					nos.add(commodityList.get(i).getCommodityCode());
//					nosArr[i]=commodityList.get(i).getCommodityCode();
//				}
//				List<CommodityStyle> commList = commodityStyleService.getCommodityByNoList(nos);
//				Map<String,Integer> inventoryMap = inventoryService.queryCommodityInventoryWithCache(nosArr);
//
//				//由CommodityStyle实体类的list转化为包含MixCommodity的map,目的为了获取促销价格
//				Map<String, MixCommodity> mixMap = cmsModuleService.changeListToMap(commList);
//				//对商品进行排序 start
//				for (CmsTopicsCommodity commodity : commodityList) {
//					MixCommodity mixCommodity = mixMap.get(commodity.getCommodityCode());
//					if (mixCommodity!=null) {
//						CmsModuleCommodity cmsModuleCommodity = new CmsModuleCommodity();
//						cmsModuleCommodity.setCommodityCode(commodity.getCommodityCode());
//						cmsModuleCommodity.setDefaultPic(mixCommodity.getDefaultPic());
//						cmsModuleCommodity.setInventoryNumber(inventoryMap.get(commodity.getCommodityCode()));
//						cmsModuleCommodity.setPublicPrice(mixCommodity.getPublicPrice());
//						cmsModuleCommodity.setSalePriceN(cmsModuleService.packageSalePriceN(mixCommodity));
//						moList.add(cmsModuleCommodity);
//					}
//				}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		JSONArray moduleCommodityList = new JSONArray();
//		moduleCommodityList.addAll(moList);
//		JSONObject object = new JSONObject();
//		object.put("moduleCommodityList", moduleCommodityList);
//		PageFinder<CmsModuleCommodity> pageFinder = new PageFinder<CmsModuleCommodity>(query.getPage(),query.getPageSize(),count);
//		object.put("hasNext", pageFinder.isHasNext());
//		return object.toString();
//	}

}
