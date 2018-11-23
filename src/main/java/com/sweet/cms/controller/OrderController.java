package com.sweet.cms.controller;

import javax.validation.Valid;

import com.sweet.cms.commons.utils.StringUtils;
import com.sweet.cms.model.vo.OrderReq;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.sweet.cms.commons.result.PageInfo;
import org.springframework.ui.Model;
import com.sweet.cms.model.Order;
import com.sweet.cms.service.IOrderService;
import com.sweet.cms.commons.base.BaseController;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * 订单表 前端控制器
 * </p>
 *
 * @author wang.sai
 * @since 2018-11-23
 */
@Controller
@RequestMapping("/order")
public class OrderController extends BaseController {

    @Autowired private IOrderService orderService;
    
    @GetMapping("/manager")
    public String manager() {
        return "admin/order/orderList";
    }
    
    @PostMapping("/dataGrid")
    @ResponseBody
    public PageInfo dataGrid(OrderReq orderReq, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = new PageInfo(page, rows, sort, order);
        Map<String, Object> condition = new HashMap<String, Object>();
        if (StringUtils.isNotBlank(orderReq.getOrderNo())) {
            condition.put("orderNo", orderReq.getOrderNo());
        }
        if (StringUtils.isNotBlank(orderReq.getExpressNo())) {
            condition.put("expressNo", orderReq.getExpressNo());
        }
        if (StringUtils.isNotBlank(orderReq.getName())) {
            condition.put("name", orderReq.getName());
        }
        if (StringUtils.isNotBlank(orderReq.getPhone())) {
            condition.put("phone", orderReq.getPhone());
        }
        if (orderReq.getOrderStatus() != null) {
            condition.put("orderStatus", orderReq.getPhone());
        }
        if (orderReq.getPayStatus() != null) {
            condition.put("payStatus", orderReq.getPayStatus());
        }
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String beginDate = orderReq.getStartTime();
        String endDate = orderReq.getEndTime();
        if (beginDate != null && endDate != null &&  beginDate.length() == 21 && endDate.length() == 21) {
            Date beginDates = new Date();
            Date endDates = new Date();
            try {
                beginDates = df.parse(beginDate);
                endDates = df.parse(endDate);
                condition.put("startTime", beginDates);
                condition.put("endTime", endDates);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        pageInfo.setCondition(condition);
        orderService.selectDataGrid(pageInfo);
        return pageInfo;
    }
    
    /**
     * 添加页面
     * @return
     */
    @GetMapping("/addPage")
    public String addPage() {
        return "admin/order/orderAdd";
    }
    
    /**
     * 添加
     * @param 
     * @return
     */
    @PostMapping("/add")
    @ResponseBody
    public Object add(@Valid Order order) {
        boolean b = orderService.insert(order);
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
        Order order = new Order();
        order.setId(id);
        boolean b = orderService.updateById(order);
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
        Order order = orderService.selectById(id);
        model.addAttribute("order", order);
        return "admin/order/orderEdit";
    }
    
    /**
     * 编辑
     * @param 
     * @return
     */
    @PostMapping("/edit")
    @ResponseBody
    public Object edit(@Valid Order order) {
        boolean b = orderService.updateById(order);
        if (b) {
            return renderSuccess("编辑成功！");
        } else {
            return renderError("编辑失败！");
        }
    }
}
