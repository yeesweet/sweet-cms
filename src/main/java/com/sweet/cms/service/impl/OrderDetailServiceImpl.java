package com.sweet.cms.service.impl;

import com.sweet.cms.model.OrderDetail;
import com.sweet.cms.mapper.OrderDetailMapper;
import com.sweet.cms.service.IOrderDetailService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 订单详情 服务实现类
 * </p>
 *
 * @author wang.sai
 * @since 2018-11-16
 */
@Service
public class OrderDetailServiceImpl extends ServiceImpl<OrderDetailMapper, OrderDetail> implements IOrderDetailService {
	
}
