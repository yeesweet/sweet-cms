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
 * 页面表
 * </p>
 *
 * @author wang.s
 * @since 2018-08-21
 */
@TableName("tbl_cms_page_manager")
public class PageManager extends Model<PageManager> {

    private static final long serialVersionUID = 1L;

    /**
     * 页面id
     */
	@TableId(value="id", type= IdType.AUTO)
	private Long id;
    /**
     * 页面名称
     */
	private String name;
    /**
     * 顶部标题
     */
	@TableField("top_name")
	private String topName;
    /**
     * 落地页类型(1 首页 1026 二级页)
     */
	private Integer type;
    /**
     * 背景类型(1:背景图片;2:背景颜色)
     */
	@TableField("type_bg")
	private Integer typeBg;
    /**
     * 背景图片链接或者颜色值
     */
	private String bg;
    /**
     * 是否启用(0：停用  1：启用)
     */
	@TableField("is_display")
	private Integer isDisplay;
    /**
     * 是否删除(0：未删除  1：删除)
     */
	@TableField("is_delete")
	private Integer isDelete;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;
    /**
     * 修改时间
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTopName() {
		return topName;
	}

	public void setTopName(String topName) {
		this.topName = topName;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getTypeBg() {
		return typeBg;
	}

	public void setTypeBg(Integer typeBg) {
		this.typeBg = typeBg;
	}

	public String getBg() {
		return bg;
	}

	public void setBg(String bg) {
		this.bg = bg;
	}

	public Integer getIsDisplay() {
		return isDisplay;
	}

	public void setIsDisplay(Integer isDisplay) {
		this.isDisplay = isDisplay;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
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

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

}
