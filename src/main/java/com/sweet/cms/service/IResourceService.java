package com.sweet.cms.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.sweet.cms.commons.result.Tree;
import com.sweet.cms.commons.shiro.ShiroUser;
import com.sweet.cms.model.Resource;

/**
 *
 * Resource 表数据服务层接口
 *
 */
public interface IResourceService extends IService<Resource> {

    List<Resource> selectAll();

    List<Tree> selectAllMenu();

    List<Tree> selectAllTree();

    List<Tree> selectTree(ShiroUser shiroUser);

}