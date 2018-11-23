package com.sweet.cms.mapper;

import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.sweet.cms.model.Order;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.sweet.cms.model.vo.OrderResp;

import java.util.List;
import java.util.Map;

/**
 * <p>
  * 订单表 Mapper 接口
 * </p>
 *
 * @author wang.sai
 * @since 2018-11-23
 */
public interface OrderMapper extends BaseMapper<Order> {

    List<OrderResp> selectOrderPage(Pagination page, Map<String, Object> condition);

}