package com.sweet.cms.service;

import com.baomidou.mybatisplus.service.IService;
import com.sweet.cms.commons.result.PageInfo;
import com.sweet.cms.model.SysLog;

/**
 *
 * SysLog 表数据服务层接口
 *
 */
public interface ISysLogService extends IService<SysLog> {

    void selectDataGrid(PageInfo pageInfo);

}