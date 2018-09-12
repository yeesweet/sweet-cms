package com.sweet.cms.test.commodity;

import com.sweet.cms.model.vo.CommodityVo;
import com.sweet.cms.service.ICommodityService;
import com.sweet.cms.test.base.BaseTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

import java.util.ArrayList;
import java.util.List;

/**
 * @author zhang.hp
 * @date 2018/8/26.
 */
public class CommodityTest extends BaseTest {

    @Autowired
    private ICommodityService commodityService;

    @Test
    public void getCommodityListTest(){
        List<String> nos = new ArrayList<>();
        nos.add("10002895");
        nos.add("10002896");
        final List<CommodityVo> commodityList = commodityService.getCommodityList(nos, false, true);
        Assert.notNull(commodityList,"为空");
        Assert.notEmpty(commodityList,"为空");
    }
}
