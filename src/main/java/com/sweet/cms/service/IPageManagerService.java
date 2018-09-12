package com.sweet.cms.service;

import com.sweet.cms.model.PageManager;
import com.baomidou.mybatisplus.service.IService;
import org.springframework.data.domain.Page;

import java.util.List;

/**
 * <p>
 * 页面表 服务类
 * </p>
 *
 * @author wang.s
 * @since 2018-08-21
 */
public interface IPageManagerService extends IService<PageManager> {

    /**
     * 根据条件查询页面列表
     * @param pageManager
     * @return
     */
    public List<PageManager> getPageManagerList(PageManager pageManager);
	
}
