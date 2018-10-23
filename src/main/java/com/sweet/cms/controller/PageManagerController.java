package com.sweet.cms.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.sweet.cms.commons.base.BaseController;
import com.sweet.cms.commons.result.PageInfo;
import com.sweet.cms.commons.utils.StringUtils;
import com.sweet.cms.constant.PageManagerConstant;
import com.sweet.cms.model.CmsModule;
import com.sweet.cms.model.PageManager;
import com.sweet.cms.service.ICmsModuleService;
import com.sweet.cms.service.IPageManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.*;

/**
 * <p>
 * 页面表 前端控制器
 * </p>
 *
 * @author wang.s
 * @since 2018-08-21
 */
@Controller
@RequestMapping("/pageManager")
public class PageManagerController extends BaseController {

    @Autowired
    private IPageManagerService pageManagerService;

    @Autowired
    private ICmsModuleService cmsModuleService;
    
    @GetMapping("/manager")
    public String manager() {
        return "admin/pageManager/pageManagerList";
    }
    
    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(PageManager pageManager, Integer page, Integer rows, String sort,String order) {
        if(pageManager!=null){
            pageManager.setIsDelete(0);
        }
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        EntityWrapper<PageManager> ew = new EntityWrapper<PageManager>(pageManager);
        Page<PageManager> pages = getPage(pageInfo);
        pages = pageManagerService.selectPage(pages, ew);
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
        return "admin/pageManager/pageManagerAdd";
    }
    
    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(@Valid PageManager pageManager,HttpServletRequest request) {
        pageManager.setOperator(this.getStaffName());
        pageManager.setUpdateTime(new Date());
        boolean b = pageManagerService.insert(pageManager);
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
        PageManager pageManager = new PageManager();
        pageManager.setId(id);
        pageManager.setIsDelete(1);

        PageManager pageM = pageManagerService.selectById(id);
        if(pageM.getType() == 1){
            Map<String,Object> map = new HashMap<>();
            map.put("type",1);
            List<PageManager> pageManagerList = pageManagerService.selectByMap(map);
            if(!(pageManagerList != null && pageManagerList.size()>1)){
                return renderError("首页数量不能少于一条！");
            }
        }
        boolean b = pageManagerService.updateById(pageManager);
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
        PageManager pageManager = pageManagerService.selectById(id);

        //获取模块数据
        getModule(id,model);

        model.addAttribute("pageManager", pageManager);
        return "admin/pageManager/pageManagerEdit";
    }

    /**
     * 获取模块数据
     * @param pageManagerId
     * @param model
     */
    public void getModule(Long pageManagerId,Model model){
        //获取模块信息
        CmsModule cmsModule = new CmsModule();
        cmsModule.setPageManagerId(pageManagerId);
        cmsModule.setIsDelete(PageManagerConstant.NOT_DELETED);
        List<CmsModule> cmsModuleList = cmsModuleService.queryCmsModuleDCList(cmsModule);
        model.addAttribute("cmsModuleList", cmsModuleList);
    }

    /**
     * 编辑
     * @param 
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(@Valid PageManager pageManager,String moduleIds) {
        //修改模块排序
        String[] idArr = moduleIds.split(";");
        if(idArr != null){
            for(int i=0; i<idArr.length; i++){
                if(StringUtils.isNotBlank(idArr[i])){
                    CmsModule cmsModule = new CmsModule();
                    cmsModule.setId(Long.parseLong(idArr[i]));
                    cmsModule.setSortNo(i+1);
                    cmsModule.setUpdateTime(new Date());
                    cmsModule.setIsDisplay(PageManagerConstant.DISPLAYED);
                    cmsModuleService.updateById(cmsModule);
                }
            }
        }

        pageManager.setOperator(this.getStaffName());
        pageManager.setUpdateTime(new Date());
        boolean b = pageManagerService.updateById(pageManager);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
}
