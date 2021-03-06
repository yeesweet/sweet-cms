package com.sweet.cms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.baomidou.mybatisplus.plugins.Page;
import com.sweet.cms.commons.constant.Consts;
import com.sweet.cms.commons.utils.StringUtils;
import com.sweet.cms.model.TopicCommodity;
import com.sweet.cms.model.vo.CommoditySearchVo;
import com.sweet.cms.model.vo.CommodityVo;
import com.sweet.cms.model.vo.TopicCommodityVo;
import com.sweet.cms.service.ICommodityService;
import com.sweet.cms.service.ITopicCommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.sweet.cms.commons.result.PageInfo;
import org.springframework.ui.Model;
import com.sweet.cms.model.Topic;
import com.sweet.cms.service.ITopicService;
import com.sweet.cms.commons.base.BaseController;

import java.util.*;

/**
 * <p>
 * 专题表 前端控制器
 * </p>
 *
 * @author wang.s2
 * @since 2018-09-07
 */
@Controller
@RequestMapping("/topic")
public class TopicController extends BaseController {

    @Autowired private ITopicService topicService;

    @Autowired
    private ITopicCommodityService topicCommodityService;

    @Autowired
    private ICommodityService commodityService;

    
    @GetMapping("/manager")
    public String manager() {
        return "admin/topic/topicList";
    }
    
    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(Topic topic, Integer page, Integer rows, String sort,String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        topic.setStatus(0);
        Page<Topic> pages = getPage(pageInfo);
        topicService.getCmsTopicByPage(pageInfo,topic);
        Date today = new Date();// 当前日期
        if (pageInfo.getRows() != null && pageInfo.getRows().size() > 0) {
            // 将查到的数据添加到list集合中
            for (int i = 0; i < pageInfo.getRows().size(); i++) {
                // 循环判断是否查询有数据
                Topic topics = (Topic) pageInfo.getRows().get(i);
                // 给当前循环得到的活动专题的商品数量赋值
                topics.setCommitityCount(topicCommodityService.getCommodityCountByTopicId(topics.getId()));
                // 判断活动有效期 有效期1，未开始 2,未过期3，已过期4，无有效期
                Date beginDates = topics.getStartTime();
                Date endDates = topics.getEndTime();
                if (beginDates != null && endDates != null) {
                    if (today.getTime() < beginDates.getTime()) {
                        topics.setEffectiveType(1);
                    }
                    if (today.getTime() < endDates.getTime() && today.getTime() > beginDates.getTime()) {
                        topics.setEffectiveType(2);
                    }
                    if (today.getTime() > endDates.getTime()) {
                        topics.setEffectiveType(3);
                    }
                } else {
                    topics.setEffectiveType(4);
                }
            }
        }
        return pageInfo;
    }

    /**
     * 修改活动的排序号
     * @param sortNo 排序号
     * @param id  活动ID
     * @author  li.sk
     * @history 2012-4-23
     */
    @ResponseBody
    @RequestMapping(value = "updateCmsTopicSortNo")
    public String updateCmsTopicSortNo(Integer sortNo, Long id) {
        Topic topic = new Topic();
        topic.setId(id);
        topic.setSortNo(sortNo);
        topic.setUpdateTime(new Date());
        boolean result = topicService.updateById(topic);
        if(result){
            return "success";
        }else{
            return "fail";
        }
    }
    
    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "admin/topic/topicAdd";
    }
    
    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(Topic topic, String[] commodityNoArr) {
        topic.setIsDisplay(0);
        topic.setStatus(0);
        topic.setOperator(this.getStaffName());
        topicService.insert(topic);
        Long id = topic.getId();

        if(commodityNoArr != null && commodityNoArr.length>0){
            List<TopicCommodity> commodityList = new ArrayList<>();
            for(int i=0;i<commodityNoArr.length;i++){
                String commodityNo = commodityNoArr[i];
                TopicCommodity topicCommodity = new TopicCommodity();
                topicCommodity.setTopicId(id);
                topicCommodity.setCommodityNo(commodityNo);
                topicCommodity.setSortNo(i);
                topicCommodity.setStatus(1);
                topicCommodity.setOperator(this.getStaffName());
                commodityList.add(topicCommodity);
            }
            if(commodityList != null && commodityList.size()>0){
                topicCommodityService.insertBatch(commodityList);
            }
        }
        return renderSuccess("添加成功！");
    }
    
    /**
     * 删除
     * @param id
     * @return
     */
    @PostMapping("/delete")
    @ResponseBody
    public Object delete(Long id) {
        Topic topic = new Topic();
        topic.setId(id);
        boolean b = topicService.updateById(topic);
        if (b) {
            return renderSuccess("删除成功！");
        } else {
            return renderError("删除失败！");
        }
    }
    
    /**
     * 编辑
     * @param model
     * @param id
     * @return
     */
    @GetMapping("/editPage")
    public String editPage(Model model, Long id) {
        Topic topic = topicService.getTopicById(id);
        List<TopicCommodity> topicCommodityList = topicCommodityService.getCommodityListByTopicId(id);
        List<String> commodityNoList = new ArrayList<>();
        List<TopicCommodityVo> commodityVoList = new ArrayList<>();
        if(topicCommodityList != null && topicCommodityList.size()>0){
            for(int i=0;i<topicCommodityList.size();i++){
                TopicCommodity topicCommodity = topicCommodityList.get(i);
                if(topicCommodity != null){
                    commodityNoList.add(topicCommodity.getCommodityNo());
                }
            }
            List<CommodityVo> commodityVos = commodityService.getCommodityList(commodityNoList,false,false);
            Map<String,Object> commdityMap = new HashMap<>();
            if(commodityVos != null && commodityVos.size()>0){
                for(int i=0;i<commodityVos.size();i++){
                    CommodityVo commodityVo = commodityVos.get(i);
                    commdityMap.put(commodityVo.getCommodityNo(),commodityVo);
                }
            }
            for(int i=0;i<topicCommodityList.size();i++){
                TopicCommodity topicCommodity = topicCommodityList.get(i);
                if(topicCommodity != null){
                    CommodityVo commodityVo = (CommodityVo) commdityMap.get(topicCommodity.getCommodityNo());
                    TopicCommodityVo topicCommodityVo = new TopicCommodityVo();
                    topicCommodityVo.setId(topicCommodity.getId());
                    topicCommodityVo.setDefaultPic(commodityVo.getDefaultPic());
                    topicCommodityVo.setCommodityName(commodityVo.getCommodityName());
                    topicCommodityVo.setCommodityNo(commodityVo.getCommodityNo());
                    topicCommodityVo.setStock(commodityVo.getStock());
                    topicCommodityVo.setMarketPrice(commodityVo.getMarketPrice());
                    topicCommodityVo.setSalePrice(commodityVo.getSalePrice());
                    topicCommodityVo.setPropNo(commodityVo.getPropNo());
                    topicCommodityVo.setStatus(topicCommodity.getStatus());
                    topicCommodityVo.setSortNo(topicCommodity.getSortNo());
                    topicCommodityVo.setTopicId(topicCommodity.getTopicId());
                    commodityVoList.add(topicCommodityVo);
                }
            }
        }
        topic.setCommodityList(commodityVoList);
        model.addAttribute("topic", topic);
        return "admin/topic/topicEdit";
    }
    
    /**
     * 编辑
     * @param 
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(@Valid Topic topic) {
        boolean b = topicService.updateById(topic);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }

    /**
     * 批量修改状态
     * @param ids
     * @param isDisplay
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "batchChangeStatus")
    public String batchChangeStatus(Long[] ids, int isDisplay, final HttpServletRequest request) {
        try {
            topicService.batchChangeStatus(ids,isDisplay);
        } catch (Exception e) {
            logger.error("批量修改状态失败！", e);
            return "error";
        }
        return "success";
    }

    /**
     * 点击按条件添加商品弹出商品选择框列表
     * @param searchVo
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    @PostMapping("/commodityList")
    @ResponseBody
    public PageInfo commodityList(CommoditySearchVo searchVo, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        Map<String, Object> condition = new HashMap<String, Object>();

        if (StringUtils.isNotBlank(searchVo.getCommodityName())) {
            condition.put("commodityName", searchVo.getCommodityName());
        }
        if (StringUtils.isNotBlank(searchVo.getCommodityNo())) {
            condition.put("commodityNo", searchVo.getCommodityNo());
        }
        if (searchVo.getShowDateStart() != null) {
            condition.put("startTime", searchVo.getShowDateStart());
        }
        if (searchVo.getShowDateEnd() != null) {
            condition.put("endTime", searchVo.getShowDateEnd());
        }
        if(searchVo.getSecondCategoryId() != null){
            condition.put("categoryId", searchVo.getSecondCategoryId());
        }
        condition.put("commodityStatus", Consts.COMMODITY_SHOW_STATUS);

        pageInfo.setCondition(condition);
        commodityService.selectDataGrid(pageInfo);
        return pageInfo;
    }


    /**
     * 判断活动专题名称是否重复.
     * @param name
     * @param id
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "checkTopicName")
    public String checkTopicName(String name,Long id) throws Exception {
        if(StringUtils.isNotBlank(name)){
            int countTopicsName = topicService.checkTopicName(id, name);
            return countTopicsName >0?"1":"0";
        }
        return "1";
    }
}
