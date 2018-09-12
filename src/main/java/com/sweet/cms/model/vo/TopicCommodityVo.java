package com.sweet.cms.model.vo;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 专题商品表
 * </p>
 *
 * @author wang.s2
 * @since 2018-09-07
 */
public class TopicCommodityVo{

    private static final long serialVersionUID = 1L;

	private Long id;
    /**
     * 专题id
     */
	private Long topicId;
    /**
     * 商品编码
     */
	private String commodityNo;
    /**
     * 状态  1 上架  0 下架
     */
	private Integer status;
    /**
     * 编号
     */
	private Integer sortNo;

	/**
	 * 商品默认展示图片
	 */
	private String defaultPic;
	/**
	 * 商品名称
	 */
	private String commodityName;

	/**
	 * 销售价
	 */
	private Double salePrice;
	/**
	 * 市场价
	 */
	private Double marketPrice;
	/**
	 * 库存
	 */
	private Integer stock;

	/**
	 * 属性编码
	 */
	private String propNo;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getTopicId() {
		return topicId;
	}

	public void setTopicId(Long topicId) {
		this.topicId = topicId;
	}

	public String getCommodityNo() {
		return commodityNo;
	}

	public void setCommodityNo(String commodityNo) {
		this.commodityNo = commodityNo;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getSortNo() {
		return sortNo;
	}

	public void setSortNo(Integer sortNo) {
		this.sortNo = sortNo;
	}

	public String getDefaultPic() {
		return defaultPic;
	}

	public void setDefaultPic(String defaultPic) {
		this.defaultPic = defaultPic;
	}

	public String getCommodityName() {
		return commodityName;
	}

	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
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
}
