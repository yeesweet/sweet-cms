package com.sweet.cms.mapper;

import com.sweet.cms.model.PageManager;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
  * 页面表 Mapper 接口
 * </p>
 *
 * @author wang.s
 * @since 2018-08-21
 */
public interface PageManagerMapper extends BaseMapper<PageManager> {
    /**
     * 根据条件查询页面列表
     * @param pageManager
     * @return
     */
    public List<PageManager> getPageManagerList(PageManager pageManager);
}