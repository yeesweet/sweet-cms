package com.sweet.cms.service;

import com.sweet.cms.commons.result.PageInfo;
import com.sweet.cms.model.Commodity;
import com.baomidou.mybatisplus.service.IService;
import com.sweet.cms.model.vo.CommodityVo;

import java.util.List;

/**
 * <p>
 * 商品表 服务类
 * </p>
 *
 * @author zhang.hp
 * @since 2018-08-06
 */
public interface ICommodityService extends IService<Commodity> {

    void selectDataGrid(PageInfo pageInfo);

    /**
     * 获取当前最大商品编码
     * @return
     */
    String getMaxCommodityNo();

    /**
     * 保存商品信息 支持批量
     * @param commodites
     * @param operator
     * @return
     */
    boolean saveCommodityInfo(List<CommodityVo> commodites, String operator);

    /**
     * 查询商品信息
     * @param commodity
     * @return
     */
    CommodityVo selectCommodityInfo(Commodity commodity);

    /**
     * 更新商品信息
     * @param commodityVo
     * @param operator
     * @return
     */
    boolean updateCommodityInfo(CommodityVo commodityVo, String operator);

    /**
     * 批量查询商品信息 包含商品主图、详情图、分类信息
     * @param nos 商品编号
     * @param shelve 是否只查询上架商品 默认true
     * @param instock 是否只查询有库存商品 默认true
     * @return
     */
    List<CommodityVo> getCommodityInfoList(List<String> nos, boolean shelve, boolean instock);

    /**
     * 批量查询商品信息 不包含商品主图、详情图、分类信息
     * @param nos 商品编号
     * @param shelve 是否只查询上架商品 默认true
     * @param instock 是否只查询有库存商品 默认true
     * @return
     */
    List<CommodityVo> getCommodityList(List<String> nos, boolean shelve, boolean instock);
}
