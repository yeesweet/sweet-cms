package com.sweet.cms.service;

import com.sweet.cms.model.TopicCommodity;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * <p>
 * 专题商品表 服务类
 * </p>
 *
 * @author wang.s2
 * @since 2018-09-07
 */
public interface ITopicCommodityService extends IService<TopicCommodity> {

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
