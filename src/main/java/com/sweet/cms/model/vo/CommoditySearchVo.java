package com.sweet.cms.model.vo;

import java.util.Date;

/**
 * 商品列表搜索vo
 * @author zhang.hp
 * @date 2018/8/6.
 */
public class CommoditySearchVo {
    /**
     * 商品名称
     */
    private String commodityName;
    /**
     * 商品编码
     */
    private String commodityNo;
    /**
     * 一级分类id
     */
    private Long firstCategoryId;
    /**
     * 二级分类id
     */
    private Long secondCategoryId;
    /**
     * 上架查询起始时间
     */
    private Date showDateStart;
    /**
     * 上架查询结束时间
     */
    private Date showDateEnd;
    /**
     * 查询类型  2：在售商品  1：待售商品
     */
    private Long searchType=1L;
    /**
     * 货号
     */
    private String itemNo;

    /**
     * 下架查询起始时间
     */
    private Date downDateStart;
    /**
     * 下架查询结束时间
     */
    private Date downDateEnd;

    public Date getDownDateStart() {
        return downDateStart;
    }

    public void setDownDateStart(Date downDateStart) {
        this.downDateStart = downDateStart;
    }

    public Date getDownDateEnd() {
        return downDateEnd;
    }

    public void setDownDateEnd(Date downDateEnd) {
        this.downDateEnd = downDateEnd;
    }

    public String getItemNo() {
        return itemNo;
    }

    public void setItemNo(String itemNo) {
        this.itemNo = itemNo;
    }

    public String getCommodityName() {
        return commodityName;
    }

    public void setCommodityName(String commodityName) {
        this.commodityName = commodityName;
    }

    public String getCommodityNo() {
        return commodityNo;
    }

    public void setCommodityNo(String commodityNo) {
        this.commodityNo = commodityNo;
    }

    public Date getShowDateStart() {
        return showDateStart;
    }

    public Long getFirstCategoryId() {
        return firstCategoryId;
    }

    public void setFirstCategoryId(Long firstCategoryId) {
        this.firstCategoryId = firstCategoryId;
    }

    public Long getSecondCategoryId() {
        return secondCategoryId;
    }

    public void setSecondCategoryId(Long secondCategoryId) {
        this.secondCategoryId = secondCategoryId;
    }

    public Long getSearchType() {
        return searchType;
    }

    public void setSearchType(Long searchType) {
        this.searchType = searchType;
    }

    public void setShowDateStart(Date showDateStart) {
        this.showDateStart = showDateStart;
    }

    public Date getShowDateEnd() {
        return showDateEnd;
    }

    public void setShowDateEnd(Date showDateEnd) {
        this.showDateEnd = showDateEnd;
    }
}
