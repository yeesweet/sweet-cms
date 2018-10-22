package com.sweet.cms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.baomidou.mybatisplus.plugins.Page;
import com.sweet.cms.commons.constant.Consts;
import com.sweet.cms.commons.utils.StringUtils;
import com.sweet.cms.model.Commodity;
import com.sweet.cms.model.TopicCommodity;
import com.sweet.cms.model.vo.CommoditySearchVo;
import com.sweet.cms.model.vo.CommodityVo;
import com.sweet.cms.model.vo.TopicCommodityVo;
import com.sweet.cms.service.ICommodityService;
import com.sweet.cms.service.ITopicCommodityService;
import com.sweet.cms.util.DateUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
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

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
                String beginDate = topics.getStartTime();
                String endDate = topics.getEndTime();
                if (beginDate != null && endDate != null &&  beginDate.length() == 21 && endDate.length() == 21) {
                    Date beginDates = new Date();
                    Date endDates = new Date();
                    try {
                        beginDates = df.parse(beginDate);
                        endDates = df.parse(endDate);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
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
    public Object add(Topic topic, String[] commodityNoArr,Integer[] sortNoComm) {
        topic.setStatus(0);
        topic.setOperator(this.getStaffName());
        topic.setCreateTime(new Date());
        topic.setUpdateTime(new Date());
        topicService.insert(topic);
        Long id = topic.getId();

        if(commodityNoArr != null && commodityNoArr.length>0){
            List<TopicCommodity> commodityList = new ArrayList<>();
            for(int i=0;i<commodityNoArr.length;i++){
                String commodityNo = commodityNoArr[i];
                TopicCommodity topicCommodity = new TopicCommodity();
                topicCommodity.setTopicId(id);
                topicCommodity.setCommodityNo(commodityNo);
                topicCommodity.setSortNo(sortNoComm[i]);
                topicCommodity.setStatus(1);
                topicCommodity.setOperator(this.getStaffName());
                topicCommodity.setCreateTime(new Date());
                topicCommodity.setUpdateTime(new Date());
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
            topic.setCommitityCount(topicCommodityList.size());
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
        topic.setOperator(this.getStaffName());
        topic.setUpdateTime(new Date());
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
     * @return
     */
    @GetMapping("/getCommodityList")
    public String getCommodityList() {
        return "admin/topic/commoditySaleList";
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

    /**
     * 添加专题添加商品编号
     * @param commodityCodes
     * @return
     */
    @GetMapping("/getCommodityByNo")
    @ResponseBody
    public String getCommodityByNo(String[] commodityCodes) {
        List<String> commodityNoList = new ArrayList<>();
        List<String> sellIdList = new ArrayList<>();
        List<TopicCommodityVo> commodityVoList = new ArrayList<>();
        if(commodityCodes != null && commodityCodes.length>0){
            for(int i=0;i<commodityCodes.length;i++) {
                if(StringUtils.isNotBlank(commodityCodes[i])){
                    commodityNoList.add(commodityCodes[i]);
                }
            }
            List<CommodityVo> commodityVos = commodityService.getCommodityList(commodityNoList,false,false);
            if(commodityVos != null && commodityVos.size()>0) {
                for (int i = 0; i < commodityVos.size(); i++) {
                    CommodityVo commodityVo = commodityVos.get(i);
                    if(commodityVo.getStock() >0){
                        TopicCommodityVo topicCommodityVo = new TopicCommodityVo();
                        topicCommodityVo.setDefaultPic(commodityVo.getDefaultPic());
                        topicCommodityVo.setCommodityName(commodityVo.getCommodityName());
                        topicCommodityVo.setCommodityNo(commodityVo.getCommodityNo());
                        topicCommodityVo.setStock(commodityVo.getStock());
                        topicCommodityVo.setMarketPrice(commodityVo.getMarketPrice());
                        topicCommodityVo.setSalePrice(commodityVo.getSalePrice());
                        topicCommodityVo.setPropNo(commodityVo.getPropNo());
                        topicCommodityVo.setStatus(commodityVo.getCommodityStatus());
                        commodityVoList.add(topicCommodityVo);
                    }
                    if(commodityVo.getStock() == 0){
                        sellIdList.add(commodityVo.getCommodityNo());
                    }
                }
            }
        }
        JSONObject object = new JSONObject();
        JSONArray sellIds = new JSONArray();
        sellIds.addAll(sellIdList);
        object.put("sellIds", sellIds);
        JSONArray result = new JSONArray();
        result.addAll(commodityVoList);
        object.put("result", result);
        return object.toString();
    }

    /**
     * 添加活动商品 活动编辑里面
     *
     * @param commodityCodes 要添加的商品编号
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "addCommodityByIds")
    public String addCommodityByIds(String[] commodityCodes, Long id, Integer sortNum, final HttpServletRequest request) throws Exception {
        if (commodityCodes == null) {
            logger.error("添加活动专题失败,commodityCodes为空.");
            return "error";
        }
        List<String> commodityNoList = new ArrayList<>();
        List<TopicCommodityVo> commodityVoList = new ArrayList<>();
        if(commodityCodes != null && commodityCodes.length>0) {
            for (int i = 0; i < commodityCodes.length; i++) {
                if(StringUtils.isNotBlank(commodityCodes[i])){
                    commodityNoList.add(commodityCodes[i]);
                }
            }
        }
        Map<String,CommodityVo> commodityVoMap = new HashMap<>();
        List<CommodityVo> commodityVos = commodityService.getCommodityList(commodityNoList,false,false);
        if(commodityVos != null && commodityVos.size()>0) {
            for (int i = 0; i < commodityVos.size(); i++) {
                CommodityVo commodityVo = commodityVos.get(i);
                commodityVoMap.put(commodityVo.getCommodityNo(),commodityVo);
            }
        }
        // 循环将这些商品添加到活动商品表
        for (int i = 0; i < commodityCodes.length; i++) {
            CommodityVo commodityVo = commodityVoMap.get(commodityCodes[i]);
            TopicCommodity topicC = new TopicCommodity();
            topicC.setCommodityNo(commodityCodes[i]);
            topicC.setTopicId(id);
            List<TopicCommodity> topicCommodityList = topicCommodityService.getCommodityList(topicC);
            if(commodityVo != null && !(topicCommodityList != null && topicCommodityList.size()>0)){
                TopicCommodity topicCommodity = new TopicCommodity();
                topicCommodity.setCommodityNo(commodityCodes[i]);// 活动商品编号
                topicCommodity.setTopicId(id);// 活动编号
                topicCommodity.setStatus(commodityVo.getCommodityStatus());// 默认显示
                topicCommodity.setSortNo(sortNum + (i + 1));// 默认排序都是当前最大的排序号加1
                topicCommodity.setCreateTime(new Date());
                topicCommodity.setUpdateTime(new Date());
                topicCommodity.setOperator(this.getStaffName());
                // 添加活动商品
                topicCommodityService.insert(topicCommodity);
            }
        }
        Topic topic = new Topic();
        topic.setId(id);
        topic.setUpdateTime(new Date());
        topicService.updateById(topic);
        return "success";
    }

    /**
     * 删除专题商品
     * @param id
     * @return
     */
    @RequestMapping("/deleteTopicCommodity")
    @ResponseBody
    public Object deleteTopicCommodity(Long id) {
        boolean b = topicCommodityService.deleteById(id);
        if (b) {
            return "success";
        }else{
            return "fail";
        }
    }

    /**
     * 批量删除专题商品
     * @param ids
     * @return
     */
    @PostMapping("/deleteTopicCommodityBatch")
    @ResponseBody
    public Object deleteTopicCommodityBatch(Long[] ids) {
        List<Long> idList = new ArrayList<>();
        if(ids != null && ids.length>0){
            idList = Arrays.asList(ids);
        }
        boolean b = topicCommodityService.deleteBatchIds(idList);
        if (b) {
            return "success";
        }else{
            return "fail";
        }
    }

    /**
     * 修改活动商品的排序号
     * @param sortNo 排序号
     * @param id  活动ID
     * @author  li.sk
     * @history 2012-4-23
     */
    @ResponseBody
    @RequestMapping(value = "updateTopicCommoditySortNo")
    public String updateTopicCommoditySortNo(Integer sortNo, Long id) {
        TopicCommodity topicCommodity = new TopicCommodity();
        topicCommodity.setId(id);
        topicCommodity.setSortNo(sortNo);
        topicCommodity.setUpdateTime(new Date());
        boolean result = topicCommodityService.updateById(topicCommodity);
        if(result){
            return "success";
        }else{
            return "fail";
        }
    }

    /**
     * 修改活动商品的状态
     * @param status 状态
     * @param id  活动ID
     * @author  li.sk
     * @history 2012-4-23
     */
    @ResponseBody
    @RequestMapping(value = "updateTopicCommodityStatus")
    public String updateTopicCommodityStatus(Integer status, Long id) {
        TopicCommodity topicCommodity = new TopicCommodity();
        topicCommodity.setId(id);
        topicCommodity.setStatus(status);
        topicCommodity.setUpdateTime(new Date());
        boolean result = topicCommodityService.updateById(topicCommodity);
        if(result){
            return "success";
        }else{
            return "fail";
        }
    }
}
