package com.sweet.cms.service;

import com.sweet.cms.commons.result.PageInfo;
import com.sweet.cms.model.Order;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 * 订单表 服务类
 * </p>
 *
 * @author wang.sai
 * @since 2018-11-23
 */
public interface IOrderService extends IService<Order> {
    /**
     * 查询订单列表
     * @param pageInfo
     */
    void selectDataGrid(PageInfo pageInfo);
}
