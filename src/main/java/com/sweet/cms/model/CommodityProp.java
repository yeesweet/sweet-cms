package com.sweet.cms.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonIgnore;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 商品属性表
 * </p>
 *
 * @author zhang.hp
 * @since 2018-08-06
 */
@TableName("tbl_cms_commodity_prop")
public class CommodityProp extends Model<CommodityProp> {

    private static final long serialVersionUID = 1L;

	@TableId(value="id", type= IdType.AUTO)
	private Long id;
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
     * 类型  1：规格
     */
	@JsonIgnore
	private Integer type;
    /**
     * 创建时间
     */
	@JsonIgnore
	@TableField("create_time")
	private Date createTime;
    /**
     * 操作人
     */
	@JsonIgnore
	private String operator;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
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
