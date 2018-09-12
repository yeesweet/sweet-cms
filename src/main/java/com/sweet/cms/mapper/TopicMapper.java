package com.sweet.cms.mapper;

import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.sweet.cms.model.Topic;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
  * 专题表 Mapper 接口
 * </p>
 *
 * @author wang.s2
 * @since 2018-09-07
 */
public interface TopicMapper extends BaseMapper<Topic> {

    /**
     * 分页查询专题
     * @param page
     * @param topic
     * @return
     */
    public List<Topic> getCmsTopicByPage(Pagination page,Topic topic);

    /**
     * 批量修改状态
     * @param ids
     * @param isDisplay
     * @return
     */
    public int batchChangeStatus(@Param(value = "ids") Long[] ids,@Param(value = "isDisplay") int isDisplay);

    /**
     * 查询名称是否存在，排除当前专题
     * @param id
     * @param name
     * @return
     */
    public int checkTopicName(@Param(value = "id") Long id,@Param(value = "name") String name);

    /**
     * 根据id查询专题
     * @param id
     * @return
     */
    public Topic getTopicById(@Param(value = "id") Long id);

}