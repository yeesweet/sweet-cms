package com.sweet.cms.model.vo;

import com.baomidou.mybatisplus.annotations.TableField;

import java.util.Date;

/**
 * <p>
 * 订单表
 * </p>
 *
 * @author wang.sai
 * @since 2018-11-23
 */
public class OrderResp {

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
     * 发货状态 1 备货中 2 已发货 3 已收货 4 拒收
     */
	private Integer deliveryStatus;
    /**
     * 订单总金额
     */
	private Double prodTotalAmt;
    /**
     * 优惠总金额
     */
	private Double promotionTotalAmt;
    /**
     * 运费
     */
	private Double postageAmt;
    /**
     * 订单总数量
     */
	private Integer prodTotalNum;
    /**
     * 配送方式 1 普通快递 2 自提
     */
	private Integer deliveryWay;
    /**
     * 收货人地址ID
     */
	private String addressId;
    /**
     * 支付方式 1 微信支付
     */
	private Integer payment;
    /**
     * 寄件快递单号
     */
	private String expressNo;
    /**
     * 快递名称
     */
	private String expressName;
    /**
     * 订单备注
     */
	private String remark;
    /**
     * 取消订单原因
     */
	private String refundReason;
    /**
     * 订单渠道 1 小程序
     */
	private Integer source;
	/**
	 * 创建时间
	 */
	private Date createTime;
	/**
	 * 更新时间
	 */
	private Date updateTime;

	/**
	 * 收货人姓名
	 */
	private String name;
	/**
	 * 手机号
	 */
	private String phone;

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

	public Integer getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(Integer deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	public Double getProdTotalAmt() {
		return prodTotalAmt;
	}

	public void setProdTotalAmt(Double prodTotalAmt) {
		this.prodTotalAmt = prodTotalAmt;
	}

	public Double getPromotionTotalAmt() {
		return promotionTotalAmt;
	}

	public void setPromotionTotalAmt(Double promotionTotalAmt) {
		this.promotionTotalAmt = promotionTotalAmt;
	}

	public Double getPostageAmt() {
		return postageAmt;
	}

	public void setPostageAmt(Double postageAmt) {
		this.postageAmt = postageAmt;
	}

	public Integer getProdTotalNum() {
		return prodTotalNum;
	}

	public void setProdTotalNum(Integer prodTotalNum) {
		this.prodTotalNum = prodTotalNum;
	}

	public Integer getDeliveryWay() {
		return deliveryWay;
	}

	public void setDeliveryWay(Integer deliveryWay) {
		this.deliveryWay = deliveryWay;
	}

	public String getAddressId() {
		return addressId;
	}

	public void setAddressId(String addressId) {
		this.addressId = addressId;
	}

	public Integer getPayment() {
		return payment;
	}

	public void setPayment(Integer payment) {
		this.payment = payment;
	}

	public String getExpressNo() {
		return expressNo;
	}

	public void setExpressNo(String expressNo) {
		this.expressNo = expressNo;
	}

	public String getExpressName() {
		return expressName;
	}

	public void setExpressName(String expressName) {
		this.expressName = expressName;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getRefundReason() {
		return refundReason;
	}

	public void setRefundReason(String refundReason) {
		this.refundReason = refundReason;
	}

	public Integer getSource() {
		return source;
	}

	public void setSource(Integer source) {
		this.source = source;
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
}
