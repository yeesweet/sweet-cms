package com.sweet.cms.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 页面管理模块
 * @author wang.s2
 *
 */
@TableName("tbl_cms_module")
public class CmsModule extends Model<CmsModule>  implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	//模块id
	@TableId(value="id", type= IdType.AUTO)
	private Long id;
	//模块名称
	@TableField("module_name")
	private String moduleName;
	//模块样式
	@TableField("module_style")
	private Integer moduleStyle;
	//模块类型(1：普通模块 2：推荐功能模块3：轮播图4：优购快报8：推荐功能模块二)
	@TableField("module_type")
	private Integer moduleType;
	//排序编号
	@TableField("sort_no")
	private Integer sortNo;
	//模块间距
	private Integer space;
	//模块左右间距
	@TableField("space_lr")
	private Integer spaceLr;
	//模块宽度
	private Integer width;
	//模块高度
	private Integer height;
	//开始时间
	@TableField("start_time")
	private Date startTime;
	//结束时间
	@TableField("end_time")
	private Date endTime;
	//开始时间(页面使用)
	private String starttime;
	//结束时间(页面使用)
	private String endtime;
	//创建时间
	@TableField("create_time")
	private Date createTime;
	//更新时间
	@TableField("update_time")
	private Date updateTime;
	//是否启用(0：未启用  1：启用)
	@TableField("is_display")
	private Integer isDisplay;
	//是否删除(0：未删除  1：删除)
	@TableField("is_delete")
	private Integer isDelete;
	//频道id
	@TableField("page_manager_id")
	private Long pageManagerId;
	//操作人
	private String operator;
	//上线状态：1.已上线(活动中) 2.待上线 (未开始) 3.未上线(未启用)
	@TableField(value = "onlineState",exist = false)
	private Integer onlineState;
	//模块子表集合
	@TableField(value = "moduleDetails",exist = false)
	private List<CmsModuleDetails> moduleDetails;
	//模块商品集合
	@TableField(value = "moduleCommoditys",exist = false)
	private List<CmsModuleCommodity> moduleCommoditys;

	/**
	 * 行
	 */
	private Integer rows = 0;
	/**
	 * 列
	 */
	private Integer cols = 0;

	/**
	 * 页数
	 */
	@TableField(value = "moduleDetailPages",exist = false)
	private Integer moduleDetailPages=0;

	/**
	 * 背景类型(1:背景图片;2:背景颜色)
	 */
	@TableField("type_bg")
	private Integer typeBg;

	/**
	 * 背景图片链接或者颜色值
	 */
	private String bg;


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

    public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getCols() {
		return cols;
	}

	public void setCols(Integer cols) {
		this.cols = cols;
	}

	public Integer getModuleDetailPages() {
		if(moduleStyle == 108){
			if(moduleDetails!=null && moduleDetails.size()>0){
				if(rows == 0 || cols == 0){
					moduleDetailPages=0;
				}else{
					int count=moduleDetails.size();
					int mod=count%(rows*cols);
					if(mod==0){
						moduleDetailPages=count/(rows*cols);
					}else{
						moduleDetailPages=count/(rows*cols)+1;
					}
				}
			}
		}
		return moduleDetailPages;
	}

	public void setModuleDetailPages(Integer moduleDetailPages) {
		this.moduleDetailPages = moduleDetailPages;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getModuleName() {
		return moduleName;
	}
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
	public Integer getModuleStyle() {
		return moduleStyle;
	}
	public void setModuleStyle(Integer moduleStyle) {
		this.moduleStyle = moduleStyle;
	}
	public Integer getModuleType() {
		return moduleType;
	}
	public void setModuleType(Integer moduleType) {
		this.moduleType = moduleType;
	}
	public Integer getSortNo() {
		return sortNo;
	}
	public void setSortNo(Integer sortNo) {
		this.sortNo = sortNo;
	}
	public Integer getSpace() {
		return space;
	}
	public void setSpace(Integer space) {
		this.space = space;
	}
	public Integer getWidth() {
		return width;
	}
	public void setWidth(Integer width) {
		this.width = width;
	}
	public Integer getHeight() {
		return height;
	}
	public void setHeight(Integer height) {
		this.height = height;
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
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
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
    public Integer getSpaceLr() {
        return spaceLr;
    }
    public void setSpaceLr(Integer spaceLr) {
        this.spaceLr = spaceLr;
    }

	public Long getPageManagerId() {
		return pageManagerId;
	}

	public void setPageManagerId(Long pageManagerId) {
		this.pageManagerId = pageManagerId;
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
	public List<CmsModuleDetails> getModuleDetails() {
		return moduleDetails;
	}
	public void setModuleDetails(List<CmsModuleDetails> moduleDetails) {
		this.moduleDetails = moduleDetails;
	}
	public List<CmsModuleCommodity> getModuleCommoditys() {
		return moduleCommoditys;
	}
	public void setModuleCommoditys(List<CmsModuleCommodity> moduleCommoditys) {
		this.moduleCommoditys = moduleCommoditys;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}
}
