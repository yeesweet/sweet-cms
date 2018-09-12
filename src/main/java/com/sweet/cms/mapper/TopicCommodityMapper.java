package com.sweet.cms.mapper;

import com.sweet.cms.model.TopicCommodity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
  * 专题商品表 Mapper 接口
 * </p>
 *
 * @author wang.s2
 * @since 2018-09-07
 */
public interface TopicCommodityMapper extends BaseMapper<TopicCommodity> {

    /**
     * 根据topicId查询专题商品数量
     * @param topicId
     * @return
     */
    public int getCommodityCountByTopicId(long topicId);

    /**
     * 根据专题id查询商品列表
     * @param topicId
     * @return
     */
    public List<TopicCommodity> getCommodityListByTopicId(long topicId);
}