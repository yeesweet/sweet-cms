package com.sweet.cms.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.sweet.cms.model.Commodity;
import com.sweet.cms.model.vo.CommodityVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
  * 商品表 Mapper 接口
 * </p>
 *
 * @author zhang.hp
 * @since 2018-08-06
 */
public interface CommodityMapper extends BaseMapper<Commodity> {

    List<Map<String,Object>> selectCommodityPage(Pagination page, Map<String, Object> condition);

    String getMaxCommodityNo();

    CommodityVo selectCommodityInfo(@Param("commodity") Commodity commodity);

    List<CommodityVo> getCommodityInfoList(@Param("nos") List<String> nos,
                                           @Param("shelv") boolean shelve,
                                           @Param("instock") boolean instock);

    List<CommodityVo> getCommodityList(@Param("nos") List<String> nos,
                                       @Param("shelv") boolean shelve,
                                       @Param("instock") boolean instock);
}