package com.sweet.cms.service;

import com.sweet.cms.commons.result.PageInfo;
import com.sweet.cms.model.Topic;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * <p>
 * 专题表 服务类
 * </p>
 *
 * @author wang.s2
 * @since 2018-09-07
 */
public interface ITopicService extends IService<Topic> {

    /**
     * 分页查询专题
     * @param pageInfo
     * @param topic
     * @return
     */
    public void getCmsTopicByPage(PageInfo pageInfo, Topic topic);

    /**
     * 批量修改状态
     * @param ids
     * @param isDisplay
     * @return
     */
    public int batchChangeStatus(Long[] ids,int isDisplay);

    /**
     * 查询名称是否存在，排除当前专题
     * @param id
     * @param name
     * @return
     */
    public int checkTopicName(Long id, String name);

    /**
     * 根据id查询专题
     * @param id
     * @return
     */
    public Topic getTopicById(Long id);

    /**
     * 获取未删除、已启用、有效期未开始或有效期内专题
     * @return
     */
    public List<Topic> getEffectiveTopicList();

}
