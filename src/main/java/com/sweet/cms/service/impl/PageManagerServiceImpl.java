package com.sweet.cms.service.impl;

import com.sweet.cms.model.PageManager;
import com.sweet.cms.mapper.PageManagerMapper;
import com.sweet.cms.service.IPageManagerService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 页面表 服务实现类
 * </p>
 *
 * @author wang.s
 * @since 2018-08-21
 */
@Service
public class PageManagerServiceImpl extends ServiceImpl<PageManagerMapper, PageManager> implements IPageManagerService {

    @Autowired
    private PageManagerMapper pageManagerMapper;

    @Override
    public List<PageManager> getPageManagerList(PageManager pageManager) {
        return pageManagerMapper.getPageManagerList(pageManager);
    }
}
