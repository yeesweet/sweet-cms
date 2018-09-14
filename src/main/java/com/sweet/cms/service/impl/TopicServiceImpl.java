package com.sweet.cms.service.impl;

import com.baomidou.mybatisplus.plugins.Page;
import com.sweet.cms.commons.result.PageInfo;
import com.sweet.cms.model.Topic;
import com.sweet.cms.mapper.TopicMapper;
import com.sweet.cms.service.ITopicService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 专题表 服务实现类
 * </p>
 *
 * @author wang.s2
 * @since 2018-09-07
 */
@Service
public class TopicServiceImpl extends ServiceImpl<TopicMapper, Topic> implements ITopicService {

    @Autowired
    private TopicMapper topicMapper;

    @Override
    public void getCmsTopicByPage(PageInfo pageInfo, Topic topic) {
        Page<Map<String, Object>> page = new Page<Map<String, Object>>(pageInfo.getNowpage(), pageInfo.getSize());
        List<Topic> list = topicMapper.getCmsTopicByPage(page,topic);
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }

    @Override
    public int batchChangeStatus(Long[] ids, int isDisplay) {
        return topicMapper.batchChangeStatus(ids, isDisplay);
    }

    @Override
    public int checkTopicName(Long id, String name) {
        return topicMapper.checkTopicName(id, name);
    }

    @Override
    public Topic getTopicById(Long id) {
        return topicMapper.getTopicById(id);
    }

    @Override
    public List<Topic> getEffectiveTopicList() {
        return topicMapper.getEffectiveTopicList();
    }

}
