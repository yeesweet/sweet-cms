package com.sweet.cms.controller;

import javax.validation.Valid;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.sweet.cms.commons.result.PageInfo;
import org.springframework.ui.Model;
import com.sweet.cms.model.UserAddress;
import com.sweet.cms.service.IUserAddressService;
import com.sweet.cms.commons.base.BaseController;

/**
 * <p>
 * 小程序用户收货地址表 前端控制器
 * </p>
 *
 * @author wang.sai
 * @since 2018-11-23
 */
@Controller
@RequestMapping("/userAddress")
public class UserAddressController extends BaseController {

    @Autowired private IUserAddressService userAddressService;
    
    @GetMapping("/manager")
    public String manager() {
        return "admin/userAddress/userAddressList";
    }
    
    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(UserAddress userAddress, Integer page, Integer rows, String sort,String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        EntityWrapper<UserAddress> ew = new EntityWrapper<UserAddress>(userAddress);
        Page<UserAddress> pages = getPage(pageInfo);
        pages = userAddressService.selectPage(pages, ew);
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
        return "admin/userAddress/userAddressAdd";
    }
    
    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(@Valid UserAddress userAddress) {
        boolean b = userAddressService.insert(userAddress);
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
    public Object delete(String id) {
        UserAddress userAddress = new UserAddress();
        userAddress.setId(id);
        boolean b = userAddressService.updateById(userAddress);
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
        UserAddress userAddress = userAddressService.selectById(id);
        model.addAttribute("userAddress", userAddress);
        return "admin/userAddress/userAddressEdit";
    }
    
    /**
     * 编辑
     * @param 
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(@Valid UserAddress userAddress) {
        boolean b = userAddressService.updateById(userAddress);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
}
