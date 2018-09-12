package com.sweet.cms.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.sweet.cms.model.Category;

import java.util.List;
import java.util.Map;

/**
 * <p>
  * 商品分类表 Mapper 接口
 * </p>
 *
 * @author wang.s
 * @since 2018-08-06
 */
public interface CategoryMapper extends BaseMapper<Category> {

    public List<Category> selectCategoryList(Category category);

    public List<Category> selectCategoryList(Pagination page, Category category);

    public void deleteByPid(Long pid);

    public List<Category> getCategoryList(Map<String,Object> map);
}