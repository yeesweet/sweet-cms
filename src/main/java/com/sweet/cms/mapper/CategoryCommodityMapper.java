package com.sweet.cms.mapper;

import com.sweet.cms.model.CategoryCommodity;
import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * <p>
  * 分类商品关系表 Mapper 接口
 * </p>
 *
 * @author zhang.hp
 * @since 2018-08-18
 */
public interface CategoryCommodityMapper extends BaseMapper<CategoryCommodity> {

    /**
     * 获取分类下商品数量
     * @param categoryId
     * @return
     */
    public int getCategorySkuNum(Long categoryId);
}