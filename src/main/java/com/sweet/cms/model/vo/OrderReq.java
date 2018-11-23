package com.sweet.cms.model.vo;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 订单表
 * </p>
 *
 * @author wang.sai
 * @since 2018-11-23
 */
public class OrderReq {

    private static final long serialVersionUID = 1L;

	private String id;
    /**
     * 订单号
     */
	private String orderNo;
    /**
     * 用户id
     */
	private String userId;
    /**
     * 订单状态 1 待支付  2 已支付 3 已取消 4 已发货 5 已完成
     */
	private Integer orderStatus;
	/**
	 * 支付状态 1 未支付 2 已支付 3 申请退款中 4 已同意退款 5 退款成功 6 退款失败 7 拒接退款
	 */
	private Integer payStatus;
    /**
     * 寄件快递单号
     */
	private String expressNo;

	/**
	 * 收货人姓名
	 */
	private String name;
	/**
	 * 手机号
	 */
	private String phone;

	private String startTime;
	private String endTime;

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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Integer getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(Integer payStatus) {
		this.payStatus = payStatus;
	}

	public String getExpressNo() {
		return expressNo;
	}

	public void setExpressNo(String expressNo) {
		this.expressNo = expressNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
}
