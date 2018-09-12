package com.sweet.cms.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * 页面模块商品表
 * @author wang.s2
 *
 */
@TableName("tbl_cms_module_commodity")
public class CmsModuleCommodity extends Model<CmsModuleCommodity> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//主键id
	@TableId(value="commodity_id", type= IdType.AUTO)
	private Long commodityId;
	//商品编号
	@TableField("commodity_code")
	private String commodityCode;
	//排序编号
	@TableField("sort_no")
	private Integer sortNo;
	//创建时间
	@TableField("create_time")
	private Date createTime;
	//更新时间
	@TableField("update_time")
	private Date updateTime;
	//模块id
	@TableField("module_id")
	private Long moduleId;
	//操作人
	private String operator;
	//商品图片
	@TableField(value = "defaultPic",exist = false)
	private String defaultPic;
	//库存数量
	@TableField(value = "inventoryNumber",exist = false)
	private Integer inventoryNumber = 0;
	/**
	 * 市场价
	 */
	@TableField(value = "marketPrice",exist = false)
	private Double marketPrice;
	/**
	 * 销售价
	 */
	@TableField(value = "salePrice",exist = false)
	private Double salePrice;


	public Long getCommodityId() {
		return commodityId;
	}

	public void setCommodityId(Long commodityId) {
		this.commodityId = commodityId;
	}

	public Long getModuleId() {
		return moduleId;
	}

	public void setModuleId(Long moduleId) {
		this.moduleId = moduleId;
	}

	public String getCommodityCode() {
		return commodityCode;
	}
	public void setCommodityCode(String commodityCode) {
		this.commodityCode = commodityCode;
	}
	public Integer getSortNo() {
		return sortNo;
	}
	public void setSortNo(Integer sortNo) {
		this.sortNo = sortNo;
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
	public Integer getInventoryNumber() {
		return inventoryNumber;
	}
	public void setInventoryNumber(Integer inventoryNumber) {
		this.inventoryNumber = inventoryNumber;
	}

	public Double getMarketPrice() {
		return marketPrice;
	}

	public void setMarketPrice(Double marketPrice) {
		this.marketPrice = marketPrice;
	}

	public Double getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(Double salePrice) {
		this.salePrice = salePrice;
	}

	@Override
	protected Serializable pkVal() {
		return this.commodityId;
	}
}
