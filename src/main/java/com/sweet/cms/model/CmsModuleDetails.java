package com.sweet.cms.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
import java.util.Date;

/**
 * 页面模块子表
 * @author wang.s2
 *
 */
@TableName("tbl_cms_module_details")
public class CmsModuleDetails extends Model<CmsModuleDetails> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//主键id
	@TableId(value="detail_id", type= IdType.AUTO)
	private Long detailId;
	//标题名称
	private String title;
	//子标题名称
	@TableField("subtitle")
	private String subTitle;
	//图片地址
	@TableField("imgurl")
	private String imgUrl;
	//排序编号
	@TableField("sort_no")
	private Integer sortNo;
	//链接类型
	@TableField("subtype")
	private Integer subType;
	//基础数据id
	@TableField("common_id")
	private String commonId;
	//子模块开始时间（为轮播图设计）
	@TableField("sub_start_time")
	private Date subStartTime;
	//子模块结束时间（为轮播图设计）
	@TableField("sub_end_time")
	private Date subEndTime;
	//子模块开始时间（为轮播图设计页面使用）
	@TableField(value = "subStarttime",exist = false)
	private String subStarttime;
	//子模块结束时间（为轮播图设计页面使用）
	@TableField(value = "subEndtime",exist = false)
	private String subEndtime;
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
	//上线状态：1.已上线(活动中) 2.待上线 (未开始) 3.未上线(未启用)
	@TableField(value = "onlineState",exist = false)
	private Integer onlineState;
	
	//商品名称
	@TableField(value = "commodityName",exist = false)
	private String commodityName;
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

	public Long getDetailId() {
		return detailId;
	}

	public void setDetailId(Long detailId) {
		this.detailId = detailId;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubTitle() {
		return subTitle;
	}
	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public Integer getSortNo() {
		return sortNo;
	}
	public void setSortNo(Integer sortNo) {
		this.sortNo = sortNo;
	}
	public Integer getSubType() {
		return subType;
	}
	public void setSubType(Integer subType) {
		this.subType = subType;
	}
	public Date getSubStartTime() {
		return subStartTime;
	}
	public void setSubStartTime(Date subStartTime) {
		this.subStartTime = subStartTime;
	}
	public Date getSubEndTime() {
		return subEndTime;
	}
	public void setSubEndTime(Date subEndTime) {
		this.subEndTime = subEndTime;
	}
	public String getSubStarttime() {
		return subStarttime;
	}
	public void setSubStarttime(String subStarttime) {
		this.subStarttime = subStarttime;
	}
	public String getSubEndtime() {
		return subEndtime;
	}
	public void setSubEndtime(String subEndtime) {
		this.subEndtime = subEndtime;
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
	public Integer getOnlineState() {
		return onlineState;
	}
	public void setOnlineState(Integer onlineState) {
		this.onlineState = onlineState;
	}
	public String getCommodityName() {
		return commodityName;
	}
	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}

	public String getCommonId() {
		return commonId;
	}

	public void setCommonId(String commonId) {
		this.commonId = commonId;
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

	public Long getModuleId() {
		return moduleId;
	}

	public void setModuleId(Long moduleId) {
		this.moduleId = moduleId;
	}

	@Override
	protected Serializable pkVal() {
		return this.detailId;
	}
}
