package com.sweet.cms.model;

import java.io.Serializable;

/**
 * CMS图片返回对象
 * @author
 * @date
 */
public class CmsImage implements Serializable {
    
	private static final long serialVersionUID = 1L;

    /**
     * 图片url地址、目录名称
     */
    private String imgUrl;
    
    /**
     * 点击目录进入下一级路径
     */
    private String imgDir;
    
    /**
     * 类型（1.目录 2 图片）
     */
    private Integer type;

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String getImgDir() {
        return imgDir;
    }

    public void setImgDir(String imgDir) {
        this.imgDir = imgDir;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
