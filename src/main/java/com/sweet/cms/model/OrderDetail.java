package com.sweet.cms.model;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 订单详情
 * </p>
 *
 * @author wang.sai
 * @since 2018-11-16
 */
@TableName("tbl_order_detail")
public class OrderDetail extends Model<OrderDetail> {

    private static final long serialVersionUID = 1L;

	private String id;
    /**
     * 订单号
     */
	@TableField("order_no")
	private String orderNo;
    /**
     * 货品总数量
     */
	@TableField("product_total_num")
	private Integer productTotalNum;
    /**
     * 货品总金额
     */
	@TableField("product_total_amt")
	private Double productTotalAmt;
    /**
     * 优惠总金额
     */
	@TableField("product_promotion_total_amt")
	private Double productPromotionTotalAmt;
    /**
     * 商品编码
     */
	@TableField("commodity_no")
	private String commodityNo;
    /**
     * 商品价格
     */
	@TableField("sale_price")
	private Double salePrice;
    /**
     * 市场价
     */
	@TableField("mark_price")
	private Double markPrice;
    /**
     * 商品名称
     */
	@TableField("commodity_name")
	private String commodityName;
    /**
     * 商品图片
     */
	@TableField("commodity_pic")
	private String commodityPic;
    /**
     * 品牌名称
     */
	@TableField("brand_name")
	private String brandName;
    /**
     * 属性编码
     */
	@TableField("prop_no")
	private String propNo;
    /**
     * 属性名称
     */
	@TableField("prop_name")
	private String propName;
    /**
     * 货号
     */
	@TableField("item_no")
	private String itemNo;
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
     * 是否有效  1 是 0 否
     */
	@TableField("delete_flag")
	private Integer deleteFlag;


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public Integer getProductTotalNum() {
		return productTotalNum;
	}

	public void setProductTotalNum(Integer productTotalNum) {
		this.productTotalNum = productTotalNum;
	}

	public Double getProductTotalAmt() {
		return productTotalAmt;
	}

	public void setProductTotalAmt(Double productTotalAmt) {
		this.productTotalAmt = productTotalAmt;
	}

	public Double getProductPromotionTotalAmt() {
		return productPromotionTotalAmt;
	}

	public void setProductPromotionTotalAmt(Double productPromotionTotalAmt) {
		this.productPromotionTotalAmt = productPromotionTotalAmt;
	}

	public String getCommodityNo() {
		return commodityNo;
	}

	public void setCommodityNo(String commodityNo) {
		this.commodityNo = commodityNo;
	}

	public Double getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(Double salePrice) {
		this.salePrice = salePrice;
	}

	public Double getMarkPrice() {
		return markPrice;
	}

	public void setMarkPrice(Double markPrice) {
		this.markPrice = markPrice;
	}

	public String getCommodityName() {
		return commodityName;
	}

	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}

	public String getCommodityPic() {
		return commodityPic;
	}

	public void setCommodityPic(String commodityPic) {
		this.commodityPic = commodityPic;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getPropNo() {
		return propNo;
	}

	public void setPropNo(String propNo) {
		this.propNo = propNo;
	}

	public String getPropName() {
		return propName;
	}

	public void setPropName(String propName) {
		this.propName = propName;
	}

	public String getItemNo() {
		return itemNo;
	}

	public void setItemNo(String itemNo) {
		this.itemNo = itemNo;
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

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

}
