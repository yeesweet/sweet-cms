package com.sweet.cms.service.impl;

import com.sweet.cms.model.TopicCommodity;
import com.sweet.cms.mapper.TopicCommodityMapper;
import com.sweet.cms.service.ITopicCommodityService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 专题商品表 服务实现类
 * </p>
 *
 * @author wang.s2
 * @since 2018-09-07
 */
@Service
public class TopicCommodityServiceImpl extends ServiceImpl<TopicCommodityMapper, TopicCommodity> implements ITopicCommodityService {

    @Autowired
    private TopicCommodityMapper topicCommodityMapper;


    @Override
    public int getCommodityCountByTopicId(long topicId) {
        return topicCommodityMapper.getCommodityCountByTopicId(topicId);
    }

    @Override
    public List<TopicCommodity> getCommodityListByTopicId(long topicId) {
        return topicCommodityMapper.getCommodityListByTopicId(topicId);
    }
}
