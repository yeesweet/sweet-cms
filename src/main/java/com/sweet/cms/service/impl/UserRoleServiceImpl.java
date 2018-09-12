package com.sweet.cms.service.impl;

import com.sweet.cms.mapper.UserRoleMapper;
import com.sweet.cms.model.UserRole;
import com.sweet.cms.service.IUserRoleService;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;

/**
 *
 * UserRole 表数据服务层接口实现类
 *
 */
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements IUserRoleService {

}