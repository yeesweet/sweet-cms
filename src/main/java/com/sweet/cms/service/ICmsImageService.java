package com.sweet.cms.service;

import com.sweet.cms.model.CmsImage;
import com.sweet.cms.util.AccessFTP;

import java.io.File;
import java.util.List;

/**
 * @author: daixiaowei E-mail:dai.xw@yougou.com
 * @date:2011-12-13 上午9:21:58
 * @version: 类说明:
 */
public interface ICmsImageService {
	
	/**
	 * 
	 * 功能：上传图片
	 * @param localFile
	 * @param path
	 * @param accessFTP
	 * @param imageDomain
	 * @return
	 */
	public String uploadImage(File localFile, String path, AccessFTP accessFTP,String imageDomain) throws Exception;

	/**
	 * 获取目录、图片
	 * @param accessFTP
	 * @param imageDomain
	 * @param path
	 * @return
	 * @throws Exception
	 */
	public List<CmsImage> getNameList(AccessFTP accessFTP, String imageDomain,String path) throws Exception;


	/**
	 * 获取目录
	 * @param accessFTP
	 * @param path
	 * @return
	 * @throws Exception
	 */
	public List<CmsImage> getDirList(AccessFTP accessFTP, String path) throws Exception;
}
