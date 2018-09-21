package com.sweet.cms.service.impl;

import com.sweet.cms.mapper.CategoryMapper;
import com.sweet.cms.model.CategoryCommodity;
import com.sweet.cms.mapper.CategoryCommodityMapper;
import com.sweet.cms.service.ICategoryCommodityService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 分类商品关系表 服务实现类
 * </p>
 *
 * @author zhang.hp
 * @since 2018-08-18
 */
@Service
public class CategoryCommodityServiceImpl extends ServiceImpl<CategoryCommodityMapper, CategoryCommodity> implements ICategoryCommodityService {

    @Autowired
    private CategoryCommodityMapper categoryCommodityMapper;

    @Override
    public int getCategorySkuNum(Long categoryId) {
        return categoryCommodityMapper.getCategorySkuNum(categoryId);
    }
}
