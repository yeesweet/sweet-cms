package com.sweet.cms.controller;

import com.sweet.cms.commons.base.BaseController;
import com.sweet.cms.commons.result.PageInfo;
import com.sweet.cms.model.Category;
import com.sweet.cms.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 商品分类表 前端控制器
 * </p>
 *
 * @author wang.s
 * @since 2018-08-06
 */
@Controller
@RequestMapping("/category")
public class CategoryController extends BaseController {

    @Autowired
    private ICategoryService categoryService;

    //一级分类
    private static final int ONE_CATEGORY = 1;
    //二级分类
    private static final int TWO_CATEGORY = 2;

    @GetMapping("/manager")
    public String manager() {
        return "admin/category/categoryList";
    }

    /**
     * 分类页树状图展示
     * @return
     */
    @PostMapping(value = "/tree")
    @ResponseBody
    public Object tree() {
        return categoryService.selectTree();
    }

    /**
     * 分页查询分类列表
     * @param category
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @param model
     * @return
     */
    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(Category category, Integer page, Integer rows, String sort, String order,Model model) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        if (category.getLevel() == null) {
            category.setLevel(ONE_CATEGORY);
        }
        categoryService.selectDataGrid(pageInfo,category);
        return pageInfo;
    }
    
    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage(int level, Long pid,Model model) {
        if(pid == null){
            pid = 0l;
        }
        model.addAttribute("level", level);
        model.addAttribute("pid", pid);
        return "admin/category/categoryAdd";
    }
    
    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(@Valid Category category,HttpServletRequest request) {
        category.setOperator(this.getStaffName());
        category.setUpdateTime(new Date());
        boolean b = categoryService.insert(category);
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
    public Object delete(Long id,int level) {
       categoryService.deleteById(id);
       if(level == 2){
           categoryService.deleteByPid(id);
       }
       return renderSuccess("删除成功！");
    }
    
    /**
     * 编辑
     * @param model
     * @param id
     * @return
     */
    @GetMapping("/editPage")
    public String editPage(Model model, Long id) {
        Category category = categoryService.selectById(id);
        model.addAttribute("category", category);
        return "admin/category/categoryEdit";
    }
    
    /**
     * 编辑
     * @param 
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(@Valid Category category) {
        category.setOperator(this.getStaffName());
        category.setUpdateTime(new Date());
        boolean b = categoryService.updateById(category);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }

    /**
     *  分类查询
     * @param level  分类级别
     * @param pid   父id
     * @param model
     * @return
     */
    @GetMapping("/getCategoryList")
    @ResponseBody
    public Object getCategoryList(int level, Long[] pid,Model model) {
        List<Long> pidList = null;
        if(pid != null && pid.length>0){
            pidList = Arrays.asList(pid);
        }
        List<Category> categoryList = categoryService.getCategoryList(level,pidList);
        return categoryList;
    }
}
