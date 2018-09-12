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
 * 分类商品关系表
 * </p>
 *
 * @author zhang.hp
 * @since 2018-08-18
 */
@TableName("tbl_cms_category_commodity")
public class CategoryCommodity extends Model<CategoryCommodity> {

    private static final long serialVersionUID = 1L;

	@TableId(value="id", type= IdType.AUTO)
	private Long id;
    /**
     * 分类id
     */
	@TableField("category_id")
	private Long categoryId;
    /**
     * 商品编码
     */
	@TableField("commodity_no")
	private String commodityNo;
    /**
     * 创建时间
     */
	@TableField("create_time")
	private Date createTime;
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

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getCommodityNo() {
		return commodityNo;
	}

	public void setCommodityNo(String commodityNo) {
		this.commodityNo = commodityNo;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
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
