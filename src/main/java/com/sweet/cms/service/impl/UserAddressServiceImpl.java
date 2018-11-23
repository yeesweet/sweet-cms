package com.sweet.cms.service.impl;

import com.sweet.cms.model.UserAddress;
import com.sweet.cms.mapper.UserAddressMapper;
import com.sweet.cms.service.IUserAddressService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 小程序用户收货地址表 服务实现类
 * </p>
 *
 * @author wang.sai
 * @since 2018-11-23
 */
@Service
public class UserAddressServiceImpl extends ServiceImpl<UserAddressMapper, UserAddress> implements IUserAddressService {
	
}
