package com.sweet.cms.model;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 小程序用户收货地址表
 * </p>
 *
 * @author wang.sai
 * @since 2018-11-23
 */
@TableName("tbl_user_address")
public class UserAddress extends Model<UserAddress> {

    private static final long serialVersionUID = 1L;

	private String id;
    /**
     * 用户id
     */
	@TableField("user_id")
	private String userId;
    /**
     * 收货人姓名
     */
	private String name;
    /**
     * 手机号
     */
	private String phone;
    /**
     * 省名称
     */
	@TableField("province_name")
	private String provinceName;
    /**
     * 省
     */
	private String province;
    /**
     * 市名称
     */
	@TableField("city_name")
	private String cityName;
    /**
     * 市
     */
	private String city;
    /**
     * 区名称
     */
	@TableField("district_name")
	private String districtName;
    /**
     * 区
     */
	private String district;
    /**
     * 详细地址
     */
	private String address;
    /**
     * 0 非默认地址 1 默认地址
     */
	@TableField("default_address")
	private Integer defaultAddress;
    /**
     * 邮政编码
     */
	@TableField("zip_code")
	private String zipCode;
    /**
     * 0 未删除 1 删除
     */
	private Integer deleted;
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


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
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

	public String getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getDistrictName() {
		return districtName;
	}

	public void setDistrictName(String districtName) {
		this.districtName = districtName;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getDefaultAddress() {
		return defaultAddress;
	}

	public void setDefaultAddress(Integer defaultAddress) {
		this.defaultAddress = defaultAddress;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public Integer getDeleted() {
		return deleted;
	}

	public void setDeleted(Integer deleted) {
		this.deleted = deleted;
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

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

}
