package com.sweet.cms.model;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import com.sweet.cms.model.vo.TopicCommodityVo;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 * 专题表
 * </p>
 *
 * @author wang.s2
 * @since 2018-09-07
 */
@TableName("tbl_cms_topic")
public class Topic extends Model<Topic> {

    private static final long serialVersionUID = 1L;

	@TableId(value="id", type= IdType.AUTO)
	private Long id;
    /**
     * 专题名称
     */
	private String name;
    /**
     * 标题
     */
	private String title;
    /**
     * 排序
     */
	@TableField("sort_no")
	private Integer sortNo;
    /**
     * 列表排序
     */
	@TableField("list_sort")
	private Integer listSort;
    /**
     * 专题开始时间
     */
	@TableField("start_time")
	private Date startTime;
    /**
     * 专题结束时间
     */
	@TableField("end_time")
	private Date endTime;
    /**
     * 是否启用  1 启用 0 停用
     */
	@TableField("is_display")
	private Integer isDisplay;
    /**
     * 是否删除  1 删除  0 未删除
     */
	private Integer status;
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

	/**
	 * 有效期1，未开始 2,未过期3，已过期4，无有效期
	 *
	 * @return
	 */
	private Integer effectiveType;

	/**
	 * 商品数量
	 */
	private Integer commitityCount;

	//专题商品列表
	private List<TopicCommodityVo> commodityList;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getSortNo() {
		return sortNo;
	}

	public void setSortNo(Integer sortNo) {
		this.sortNo = sortNo;
	}

	public Integer getListSort() {
		return listSort;
	}

	public void setListSort(Integer listSort) {
		this.listSort = listSort;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Integer getIsDisplay() {
		return isDisplay;
	}

	public void setIsDisplay(Integer isDisplay) {
		this.isDisplay = isDisplay;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
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

	public Integer getEffectiveType() {
		return effectiveType;
	}

	public void setEffectiveType(Integer effectiveType) {
		this.effectiveType = effectiveType;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	public Integer getCommitityCount() {
		return commitityCount;
	}

	public void setCommitityCount(Integer commitityCount) {
		this.commitityCount = commitityCount;
	}

	public List<TopicCommodityVo> getCommodityList() {
		return commodityList;
	}

	public void setCommodityList(List<TopicCommodityVo> commodityList) {
		this.commodityList = commodityList;
	}
}
