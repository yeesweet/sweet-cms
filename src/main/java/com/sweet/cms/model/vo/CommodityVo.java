package com.sweet.cms.model.vo;

import com.sweet.cms.model.CategoryCommodity;
import com.sweet.cms.model.Commodity;
import com.sweet.cms.model.CommodityPics;

import java.io.Serializable;
import java.util.List;

/**
 * @author zhang.hp
 * @date 2018/8/12.
 */
public class CommodityVo extends Commodity implements Serializable {
    private List<CategoryCommodity> categories;
    private List<CommodityPics> pics;
    private List<CommodityPics> mainPice;
    private List<CommodityPics> descPics;

    public List<CategoryCommodity> getCategories() {
        return categories;
    }

    public void setCategories(List<CategoryCommodity> categories) {
        this.categories = categories;
    }

    public List<CommodityPics> getPics() {
        return pics;
    }

    public void setPics(List<CommodityPics> pics) {
        this.pics = pics;
    }

    public List<CommodityPics> getMainPice() {
        return mainPice;
    }

    public void setMainPice(List<CommodityPics> mainPice) {
        this.mainPice = mainPice;
    }

    public List<CommodityPics> getDescPics() {
        return descPics;
    }

    public void setDescPics(List<CommodityPics> descPics) {
        this.descPics = descPics;
    }
}
