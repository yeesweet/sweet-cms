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
import com.sweet.cms.model.OrderDetail;
import com.sweet.cms.service.IOrderDetailService;
import com.sweet.cms.commons.base.BaseController;

/**
 * <p>
 * 订单详情 前端控制器
 * </p>
 *
 * @author wang.sai
 * @since 2018-11-16
 */
@Controller
@RequestMapping("/orderDetail")
public class OrderDetailController extends BaseController {

    @Autowired private IOrderDetailService orderDetailService;
    
    @GetMapping("/manager")
    public String manager() {
        return "admin/orderDetail/orderDetailList";
    }
    
    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(OrderDetail orderDetail, Integer page, Integer rows, String sort,String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        EntityWrapper<OrderDetail> ew = new EntityWrapper<OrderDetail>(orderDetail);
        Page<OrderDetail> pages = getPage(pageInfo);
        pages = orderDetailService.selectPage(pages, ew);
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
        return "admin/orderDetail/orderDetailAdd";
    }
    
    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(@Valid OrderDetail orderDetail) {
        boolean b = orderDetailService.insert(orderDetail);
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
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setId(id);
        boolean b = orderDetailService.updateById(orderDetail);
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
        OrderDetail orderDetail = orderDetailService.selectById(id);
        model.addAttribute("orderDetail", orderDetail);
        return "admin/orderDetail/orderDetailEdit";
    }
    
    /**
     * 编辑
     * @param 
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(@Valid OrderDetail orderDetail) {
        boolean b = orderDetailService.updateById(orderDetail);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
}
