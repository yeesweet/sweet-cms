package com.sweet.cms.service;

import com.baomidou.mybatisplus.service.IService;
import com.sweet.cms.commons.result.PageInfo;
import com.sweet.cms.commons.result.Tree;
import com.sweet.cms.model.Category;

import java.util.List;

/**
 * <p>
 * 商品分类表 服务类
 * </p>
 *
 * @author wang.s
 * @since 2018-08-06
 */
public interface ICategoryService extends IService<Category> {

    /**
     * 根据条件查询分类列表
     * @param category
     * @return
     */
    public List<Category> selectCategoryList(Category category);

    /**
     * 查询分类列表
     * @param pageInfo
     * @param category
     */
    public void selectDataGrid(PageInfo pageInfo,Category category);

    /**
     * 查询分类树
     * @return
     */
    public List<Tree> selectTree();

    /**
     * 根据pid删除分类
     * @param pid
     */
    public void deleteByPid(Long pid);

    /**
     * 根据条件查询分类
     * @return
     */
    public List<Category> getCategoryList(int level, List<Long> pidList);

}
