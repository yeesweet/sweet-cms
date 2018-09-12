package com.sweet.cms.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.sweet.cms.commons.constant.Consts;
import com.sweet.cms.commons.result.PageInfo;
import com.sweet.cms.commons.utils.StringUtils;
import com.sweet.cms.mapper.CommodityMapper;
import com.sweet.cms.model.CategoryCommodity;
import com.sweet.cms.model.Commodity;
import com.sweet.cms.model.CommodityPics;
import com.sweet.cms.model.vo.CommodityVo;
import com.sweet.cms.service.ICategoryCommodityService;
import com.sweet.cms.service.ICommodityPicsService;
import com.sweet.cms.service.ICommodityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.util.Assert;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 商品表 服务实现类
 * </p>
 *
 * @author zhang.hp
 * @since 2018-08-06
 */
@Service
public class CommodityServiceImpl extends ServiceImpl<CommodityMapper, Commodity> implements ICommodityService {

    @Autowired
    private CommodityMapper commodityMapper;

    @Autowired
    private ICommodityPicsService commodityPicsService;

    @Autowired
    private ICategoryCommodityService categoryCommodityService;

    @Override
    public void selectDataGrid(PageInfo pageInfo) {
        Page<Map<String, Object>> page = new Page<Map<String, Object>>(pageInfo.getNowpage(), pageInfo.getSize());
        page.setOrderByField(pageInfo.getSort());
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = commodityMapper.selectCommodityPage(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }

    @Override
    public String getMaxCommodityNo() {
        String maxCommodityNo = commodityMapper.getMaxCommodityNo();
        if(StringUtils.isBlank(maxCommodityNo)){
            maxCommodityNo="10002895";
        }
        return maxCommodityNo;
    }

    @Override
    @Transactional
    public boolean saveCommodityInfo(List<CommodityVo> commodites, String operator) {
        Assert.notNull(commodites, "商品信息为空");
        Assert.notEmpty(commodites, "商品信息为空");
        try {
            List<CommodityPics> picList= new ArrayList<>();
            List<CategoryCommodity> categoryList= new ArrayList<>();
            List<Commodity> commodityList=new ArrayList<>(commodites.size());
            for (CommodityVo vo : commodites) {
                //保存商品信息
                final String commodityNo = vo.getCommodityNo();
                Commodity commodity= transformerCommodity(vo);
                commodity.setOperator(operator);
                commodityList.add(commodity);
                //保存商品图片信息
                List<CommodityPics> pics = vo.getPics();
                for(CommodityPics pic : pics){
                    pic.setStatus(Consts.VALID_STATE);
                    pic.setOperator(operator);
                    pic.setCreateTime(new Date());
                    pic.setUpdateTime(new Date());
                    picList.add(pic);
                }
                //保存商品分类信息
                List<CategoryCommodity> categories = vo.getCategories();
                for(CategoryCommodity cc : categories){
                    cc.setCreateTime(new Date());
                    cc.setOperator(operator);
                    categoryList.add(cc);
                }
            }
            boolean success = insertBatch(commodityList);
            success=commodityPicsService.insertBatch(picList);
            success=categoryCommodityService.insertBatch(categoryList);
            return success;
        } catch (Exception e) {
            //事务回滚
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public CommodityVo selectCommodityInfo(Commodity commodity) {
        return commodityMapper.selectCommodityInfo(commodity);
    }

    @Override
    @Transactional
    public boolean updateCommodityInfo(CommodityVo commodityVo, String operator) {
        Assert.notNull(commodityVo, "商品信息为空");
        Assert.notNull(commodityVo.getId(), "商品信息为空");
        try {
            //修改商品基本信息
            Commodity commodity = selectById(commodityVo.getId());
            if(StringUtils.isNotBlank(commodityVo.getCommodityName())){
                commodity.setCommodityName(commodityVo.getCommodityName());
            }
            if(StringUtils.isNotBlank(commodityVo.getSellPoint())){
                commodity.setSellPoint(commodityVo.getSellPoint());
            }
            if(StringUtils.isNotBlank(commodityVo.getCommodityDesc())){
                commodity.setCommodityDesc(commodityVo.getCommodityDesc());
            }
            if(StringUtils.isNotBlank(commodityVo.getBrandName())){
                commodity.setBrandName(commodity.getBrandName());
            }
            if(StringUtils.isNotBlank(commodityVo.getItemNo())){
                commodity.setItemNo(commodityVo.getItemNo());
            }
            if(commodityVo.getSalePrice() != null){
                commodity.setSalePrice(commodityVo.getSalePrice());
            }
            if(commodityVo.getCostPrice() != null){
                commodity.setCostPrice(commodityVo.getCostPrice());
            }
            if(commodity.getMarketPrice() != null){
                commodity.setMarketPrice(commodityVo.getMarketPrice());
            }
            if(commodityVo.getStock() != null){
                commodity.setStock(commodityVo.getStock());
            }
            if(StringUtils.isNotBlank(commodityVo.getPropNo())){
                commodity.setPropNo(commodityVo.getPropNo());
            }
            if(commodityVo.getCommodityStatus() != null) {
                if(commodityVo.getCommodityStatus() == Consts.COMMODITY_DOWN_STATUS){
                    commodity.setDownDate(new Date());
                    commodity.setCommodityStatus(Consts.COMMODITY_DOWN_STATUS);
                }
                if(commodityVo.getCommodityStatus() == Consts.COMMODITY_SHOW_STATUS){
                    commodity.setShowDate(new Date());
                    commodity.setCommodityStatus(Consts.COMMODITY_SHOW_STATUS);
                }
            }
            if(StringUtils.isNotBlank(commodityVo.getDefaultPic())){
                commodity.setDefaultPic(commodityVo.getDefaultPic());
            }
            commodity.setUpdateTime(new Date());
            commodity.setOperator(operator);
            boolean success = updateById(commodity);
            //修改商品分类信息  先删除后保存
            List<CategoryCommodity> categories = commodityVo.getCategories();
            if(categories != null  && categories.size() > 0){
                success = categoryCommodityService.delete(new EntityWrapper<CategoryCommodity>()
                                                    .eq("commodity_no",commodityVo.getCommodityNo()));
                List<CategoryCommodity> categoryList= new ArrayList<>();
                for(CategoryCommodity cc : categories){
                    cc.setCreateTime(new Date());
                    cc.setOperator(operator);
                    categoryList.add(cc);
                }
                success = categoryCommodityService.insertBatch(categoryList);
            }
            //修改商品图片信息 先删除后保存
            List<CommodityPics> pics = commodityVo.getPics();
            if(pics != null && pics.size() > 0){
                success = commodityPicsService.delete(new EntityWrapper<CommodityPics>()
                                                .eq("commodity_no",commodityVo.getCommodityNo())
                                            );
                List<CommodityPics> picList= new ArrayList<>(pics.size());
                for(CommodityPics pic : pics){
                    pic.setStatus(Consts.VALID_STATE);
                    pic.setOperator(operator);
                    pic.setCreateTime(new Date());
                    pic.setUpdateTime(new Date());
                    picList.add(pic);
                }
                success = commodityPicsService.insertBatch(picList);
            }
            return success;
        } catch (Exception e) {
            //事务回滚
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            e.printStackTrace();
            return false;
        }
    }
    @Override
    public List<CommodityVo> getCommodityInfoList(List<String> nos, boolean shelve, boolean instock) {
        if(nos == null){
            return null;
        }
        if(nos.size() == 0){
            return null;
        }
        return commodityMapper.getCommodityInfoList(nos, shelve, instock);
    }

    @Override
    public List<CommodityVo> getCommodityList(List<String> nos, boolean shelve, boolean instock) {
        if(nos == null){
            return null;
        }
        if(nos.size() == 0){
            return null;
        }
        return commodityMapper.getCommodityList(nos, shelve, instock);
    }

    private Commodity transformerCommodity(CommodityVo vo) {
        Commodity  commodity=new Commodity();
        commodity.setCommodityNo(vo.getCommodityNo());
        commodity.setCommodityName(vo.getCommodityName());
        commodity.setSellPoint(vo.getSellPoint());
        commodity.setCommodityDesc(vo.getCommodityDesc());
        commodity.setBrandName(vo.getBrandName());
        commodity.setItemNo(vo.getItemNo());
        commodity.setSalePrice(vo.getSalePrice());
        commodity.setCostPrice(vo.getCostPrice());
        commodity.setMarketPrice(vo.getMarketPrice());
        commodity.setStock(vo.getStock());
        commodity.setPropNo(vo.getPropNo());
        commodity.setDefaultPic(vo.getDefaultPic());
        if(vo.getCommodityStatus() == Consts.COMMODITY_DOWN_STATUS){
            commodity.setDownDate(new Date());
            commodity.setCommodityStatus(Consts.COMMODITY_DOWN_STATUS);
        }
        if(vo.getCommodityStatus() == Consts.COMMODITY_SHOW_STATUS){
            commodity.setShowDate(new Date());
            commodity.setCommodityStatus(Consts.COMMODITY_SHOW_STATUS);
        }
        commodity.setCreateTime(new Date());
        commodity.setUpdateTime(new Date());
        commodity.setOperator(vo.getOperator());
        return commodity;
    }
}
