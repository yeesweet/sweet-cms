package com.sweet.cms.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 商品表
 * </p>
 *
 * @author zhang.hp
 * @since 2018-08-06
 */
@TableName("tbl_cms_commodity")
public class Commodity extends Model<Commodity> {

    private static final long serialVersionUID = 1L;

	@TableId(value="id", type= IdType.AUTO)
	private Long id;
    /**
     * 商品编号
     */
	@TableField("commodity_no")
	private String commodityNo;
    /**
     * 商品名称
     */
	@TableField("commodity_name")
	private String commodityName;
    /**
     * 商品卖点
     */
	@TableField("sell_point")
	private String sellPoint;
    /**
     * 商品描述
     */
	@TableField("commodity_desc")
	private String commodityDesc;
	/**
	 * 商品默认展示图片
	 */
	@TableField("default_pic")
	private String defaultPic;
    /**
     * 品牌名称
     */
	@TableField("brand_name")
	private String brandName;
    /**
     * 货号
     */
	@TableField("item_no")
	private String itemNo;
    /**
     * 销售价
     */
	@TableField("sale_price")
	private Double salePrice;
    /**
     * 市场价
     */
	@TableField("market_price")
	private Double marketPrice;
    /**
     * 成本价
     */
	@TableField("cost_price")
	private Double costPrice;
    /**
     * 库存
     */
	private Integer stock;
    /**
     * 属性编码
     */
	@TableField("prop_no")
	private String propNo;
    /**
     * 1下架(停售),2上架(在售)，3停用,(启用重新变成1),4预售,5待进货,6待售
     */
	@TableField("commodity_status")
	private Integer commodityStatus;
    /**
     * 上架时间
     */
	@TableField("show_date")
	private Date showDate;
    /**
     * 下架时间
     */
	@TableField("down_date")
	private Date downDate;
    /**
     * 销量
     */
	@TableField("sales_quantity")
	private Integer salesQuantity;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;
    /**
     * 更新时间
     */
	@TableField("update_time")
	private Date updateTime;
    /**
     * 操作人
     */
	private String operator;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCommodityNo() {
		return commodityNo;
	}

	public void setCommodityNo(String commodityNo) {
		this.commodityNo = commodityNo;
	}

	public String getCommodityName() {
		return commodityName;
	}

	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}

	public String getSellPoint() {
		return sellPoint;
	}

	public void setSellPoint(String sellPoint) {
		this.sellPoint = sellPoint;
	}

	public String getCommodityDesc() {
		return commodityDesc;
	}

	public void setCommodityDesc(String commodityDesc) {
		this.commodityDesc = commodityDesc;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getItemNo() {
		return itemNo;
	}

	public void setItemNo(String itemNo) {
		this.itemNo = itemNo;
	}

	public Double getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(Double salePrice) {
		this.salePrice = salePrice;
	}

	public Double getMarketPrice() {
		return marketPrice;
	}

	public void setMarketPrice(Double marketPrice) {
		this.marketPrice = marketPrice;
	}

	public Double getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(Double costPrice) {
		this.costPrice = costPrice;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public String getPropNo() {
		return propNo;
	}

	public void setPropNo(String propNo) {
		this.propNo = propNo;
	}

	public Integer getCommodityStatus() {
		return commodityStatus;
	}

	public void setCommodityStatus(Integer commodityStatus) {
		this.commodityStatus = commodityStatus;
	}

	public Date getShowDate() {
		return showDate;
	}

	public void setShowDate(Date showDate) {
		this.showDate = showDate;
	}

	public Date getDownDate() {
		return downDate;
	}

	public void setDownDate(Date downDate) {
		this.downDate = downDate;
	}

	public Integer getSalesQuantity() {
		return salesQuantity;
	}

	public void setSalesQuantity(Integer salesQuantity) {
		this.salesQuantity = salesQuantity;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String getDefaultPic() {
		return defaultPic;
	}

	public void setDefaultPic(String defaultPic) {
		this.defaultPic = defaultPic;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

}
