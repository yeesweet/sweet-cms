package com.sweet.cms.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.sweet.cms.commons.base.BaseController;
import com.sweet.cms.commons.result.PageInfo;
import com.sweet.cms.commons.utils.CharacterUtils;
import com.sweet.cms.model.CommodityProp;
import com.sweet.cms.service.ICommodityPropService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 商品属性表 前端控制器
 * </p>
 *
 * @author zhang.hp
 * @since 2018-08-06
 */
@Controller
@RequestMapping("/commodityProp")
public class CommodityPropController extends BaseController {

    @Autowired private ICommodityPropService commodityPropService;
    
    @GetMapping("/manager")
    public String manager() {
        return "admin/commodityProp/commodityPropList";
    }
    
    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(CommodityProp commodityProp, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        EntityWrapper<CommodityProp> ew = new EntityWrapper<CommodityProp>(commodityProp);
        Page<CommodityProp> pages = getPage(pageInfo);
        pages = commodityPropService.selectPage(pages, ew);
        pageInfo.setRows(pages.getRecords());
        pageInfo.setTotal(pages.getTotal());
        return pageInfo;
    }
    
    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "admin/commodityProp/commodityPropAdd";
    }
    
    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(@Valid CommodityProp commodityProp) {
        commodityProp.setCreateTime(new Date());
        commodityProp.setPropNo(CharacterUtils.getRandomString(4));
        commodityProp.setOperator(getStaffName());
        commodityProp.setType(1);
        boolean b = commodityPropService.insert(commodityProp);
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
        boolean b = commodityPropService.deleteById(id);
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
        CommodityProp commodityProp = commodityPropService.selectById(id);
        model.addAttribute("commodityProp", commodityProp);
        return "admin/commodityProp/commodityPropEdit";
    }
    
    /**
     * 编辑
     * @param 
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(@Valid CommodityProp commodityProp) {
        boolean b = commodityPropService.updateById(commodityProp);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
    @RequestMapping("propsJson")
    @ResponseBody
    public Object propsJson(){
        List<CommodityProp> list = commodityPropService.
                                            selectList(new EntityWrapper<CommodityProp>()
                                                                .eq("type", 1)
                                                                .orderBy("createTime", false));
        return list;
    }
}
