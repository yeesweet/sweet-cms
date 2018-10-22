package com.sweet.cms.controller;


import com.sweet.cms.commons.base.BaseController;
import com.sweet.cms.commons.constant.Consts;
import com.sweet.cms.commons.result.PageInfo;
import com.sweet.cms.commons.utils.StringUtils;
import com.sweet.cms.model.Commodity;
import com.sweet.cms.model.vo.CommoditySearchVo;
import com.sweet.cms.model.vo.CommodityVo;
import com.sweet.cms.service.ICommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * <p>
 * 商品表 前端控制器
 * </p>
 *
 * @author zhang.hp
 * @since 2018-08-06
 */
@Controller
@RequestMapping("/commodity")
public class CommodityController extends BaseController {

    @Autowired
    private ICommodityService commodityService;

    /**
     * 在售商品列表
     * @return
     */
    @GetMapping("/sale/manager")
    public String saleManager() {
        return "admin/commodity/commoditySaleList";
    }
    
    @PostMapping("/sale/dataGrid")
    @ResponseBody
    public PageInfo saleDataGrid(CommoditySearchVo searchVo, Integer page, Integer rows, String sort, String order) {
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
     * 待售商品列表
     * @return
     */
    @GetMapping("/waitSale/manager")
    public String waitSaleManager() {
        return "admin/commodity/commodityWaitSaleList";
    }

    @PostMapping("/waitSale/dataGrid")
    @ResponseBody
    public PageInfo waitSaleDataGrid(CommoditySearchVo searchVo, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        Map<String, Object> condition = new HashMap<String, Object>();

        if (StringUtils.isNotBlank(searchVo.getCommodityName())) {
            condition.put("commodityName", searchVo.getCommodityName());
        }
        if (StringUtils.isNotBlank(searchVo.getCommodityNo())) {
            condition.put("commodityNo", searchVo.getCommodityNo());
        }
        if (searchVo.getDownDateStart() != null) {
            condition.put("downStartTime", searchVo.getDownDateStart());
        }
        if (searchVo.getDownDateEnd() != null) {
            condition.put("downEndTime", searchVo.getDownDateEnd());
        }
        if(searchVo.getSecondCategoryId() != null){
            condition.put("categoryId", searchVo.getSecondCategoryId());
        }
        condition.put("commodityStatus", Consts.COMMODITY_DOWN_STATUS);
        pageInfo.setCondition(condition);
        commodityService.selectDataGrid(pageInfo);
        return pageInfo;
    }
    /**
     * 库存管理
     * @return
     */
    @GetMapping("/stock/manager")
    public String stockManager() {
        return "admin/commodity/commodityStockList";
    }

    @PostMapping("/stock/dataGrid")
    @ResponseBody
    public PageInfo stockDataGrid(CommoditySearchVo searchVo, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        Map<String, Object> condition = new HashMap<String, Object>();

        if (StringUtils.isNotBlank(searchVo.getCommodityName())) {
            condition.put("commodityName", searchVo.getCommodityName());
        }
        if (StringUtils.isNotBlank(searchVo.getCommodityNo())) {
            condition.put("commodityNo", searchVo.getCommodityNo());
        }
        if (StringUtils.isNotBlank(searchVo.getItemNo())) {
            condition.put("itemNo", searchVo.getItemNo());
        }
        pageInfo.setCondition(condition);
        commodityService.selectDataGrid(pageInfo);
        return pageInfo;
    }
    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage(Model model) {
        final String maxCommodityNo = commodityService.getMaxCommodityNo();
        model.addAttribute("maxCommodityNo",maxCommodityNo);
        return "admin/commodity/commodityAdd";
    }
    
    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(@RequestBody() List<CommodityVo> commodites) {
        boolean b = commodityService.saveCommodityInfo(commodites, getStaffName());
        if (b) {
            return renderSuccess("添加成功！");
        } else {
            return renderError("添加失败！");
        }
    }
    
    /**
     * 删除
     * @param id
     * @return
     */
    @PostMapping("/delete")
    @ResponseBody
    public Object delete(Long id) {
        Commodity commodity = new Commodity();
        commodity.setId(id);
        commodity.setUpdateTime(new Date());
        boolean b = commodityService.updateById(commodity);
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
        Commodity commodity = new Commodity();
        commodity.setId(id);
        CommodityVo commodityVo=commodityService.selectCommodityInfo(commodity);
        model.addAttribute("commodityVo", commodityVo);
        return "admin/commodity/commodityEdit";
    }
    
    /**
     * 编辑
     * @param 
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(@RequestBody() CommodityVo commodityVo) {
        if(commodityVo.getId() == null){
            return renderError("商品Id为空！");
        }
        final Commodity commodity = commodityService.selectById(commodityVo.getId());
        if(commodity == null){
            return renderError("该商品不存在！");
        }
        boolean b = commodityService.updateCommodityInfo(commodityVo, getStaffName());
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
    /**
     * 下架
     * @param id
     * @return
     */
    @PostMapping("/unshelve")
    @ResponseBody
    public Object unshelve(@RequestBody() List<Long> ids) {
        if(ids == null){
            return renderError("商品为空！");
        }
        if(ids.size() <= 0){
            return renderError("商品为空！");
        }
        List<Commodity> list = new ArrayList<>(ids.size());
        for(Long id : ids){
            Commodity commodity=new Commodity();
            commodity.setId(id);
            commodity.setCommodityStatus(Consts.COMMODITY_DOWN_STATUS);
            commodity.setDownDate(new Date());
            commodity.setUpdateTime(new Date());
            commodity.setOperator(getStaffName());
            list.add(commodity);
        }
        boolean b = commodityService.updateBatchById(list);
        if (b) {
            return renderSuccess("下架成功！");
        } else {
            return renderError("下架失败！");
        }
    }
    /**
     * 上架
     * @param id
     * @return
     */
    @PostMapping("/shelve")
    @ResponseBody
    public Object shelve(@RequestBody() List<Long> ids) {
        if(ids == null){
            return renderError("商品为空！");
        }
        if(ids.size() <= 0){
            return renderError("商品为空！");
        }
        List<Commodity> list = new ArrayList<>(ids.size());
        for(Long id : ids){
            Commodity commodity=new Commodity();
            commodity.setId(id);
            commodity.setCommodityStatus(Consts.COMMODITY_SHOW_STATUS);
            commodity.setShowDate(new Date());
            commodity.setUpdateTime(new Date());
            commodity.setOperator(getStaffName());
        }
        boolean b = commodityService.updateBatchById(list);
        if (b) {
            return renderSuccess("上架成功！");
        } else {
            return renderError("上架失败！");
        }
    }
    /**
     * 修改库存
     * @param id
     * @return
     */
    @PostMapping("/stock")
    @ResponseBody
    public Object stock(Long id, Integer stockNum) {
        Commodity commodity=new Commodity();
        commodity.setId(id);
        commodity.setStock(stockNum);
        commodity.setUpdateTime(new Date());
        commodity.setOperator(getStaffName());
        boolean b = commodityService.updateById(commodity);
        if (b) {
            return renderSuccess("修改库存成功！");
        } else {
            return renderError("修改库存失败！");
        }
    }

    /**
     * 点击按条件添加商品弹出商品选择框列表
     * @return
     */
    @GetMapping("/getCommodityList")
    public String getCommodityList() {
        return "admin/commodity/commoditySalePageList";
    }
}
