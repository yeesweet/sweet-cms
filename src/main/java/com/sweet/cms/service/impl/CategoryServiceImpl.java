package com.sweet.cms.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.sweet.cms.commons.result.PageInfo;
import com.sweet.cms.commons.result.Tree;
import com.sweet.cms.mapper.CategoryMapper;
import com.sweet.cms.model.Category;
import com.sweet.cms.model.Organization;
import com.sweet.cms.service.ICategoryCommodityService;
import com.sweet.cms.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 商品分类表 服务实现类
 * </p>
 *
 * @author wang.s
 * @since 2018-08-06
 */
@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements ICategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    @Autowired
    private ICategoryCommodityService categoryCommodityService;


    @Override
    public List<Category> selectCategoryList(Category category) {
        return categoryMapper.selectCategoryList(category);
    }

    @Override
    public void selectDataGrid(PageInfo pageInfo,Category category) {
        Page<Map<String, Object>> page = new Page<Map<String, Object>>(pageInfo.getNowpage(), pageInfo.getSize());
        List<Category> list = categoryMapper.selectCategoryList(page,category);
        if(category.getLevel()==2 && list != null && list.size()>0){
            for(int i=0;i<list.size();i++){
                Category categoryC = list.get(i);
                int skuNum = categoryCommodityService.getCategorySkuNum(categoryC.getId());
                categoryC.setSkuNum(skuNum);
            }
        }
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }

    @Override
    public List<Tree> selectTree() {
        EntityWrapper<Category> wrapper = new EntityWrapper<Category>();
        wrapper.orderBy("display",false);
        wrapper.orderBy("sortNo",true);
        List<Category> categoryList = categoryMapper.selectList(wrapper);

        List<Tree> trees = new ArrayList<Tree>();
        Tree treeA = new Tree();
        treeA.setId(0L);
        treeA.setText("全部分类");
        treeA.setPid(0L);
        trees.add(treeA);
        if (categoryList != null) {
            for (Category category : categoryList) {
                Tree tree = new Tree();
                tree.setId(category.getId());
                tree.setText(category.getName());
                tree.setPid(category.getPid());
                trees.add(tree);
            }
        }
        return trees;
    }

    @Override
    public void deleteByPid(Long pid) {
        categoryMapper.deleteByPid(pid);
    }

    @Override
    public List<Category> getCategoryList(int level, List<Long> pidList) {
        Map<String,Object> map = new HashMap<>();
        map.put("level",level);
        map.put("pidList",pidList);
        return categoryMapper.getCategoryList(map);
    }
}
