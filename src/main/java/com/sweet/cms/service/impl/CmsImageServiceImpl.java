package com.sweet.cms.service.impl;

import com.sweet.cms.model.CmsImage;
import com.sweet.cms.service.ICmsImageService;
import com.sweet.cms.util.AccessFTP;
import com.sweet.cms.util.FtpUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * @author: daixiaowei E-mail:dai.xw@yougou.com
 * @date:2011-12-13 上午9:21:58
 * @version: 类说明:
 */
@Service
public class CmsImageServiceImpl implements ICmsImageService {

	private static final Log logger = LogFactory.getLog(CmsImageServiceImpl.class);

	@Override
	public String uploadImage(File localFile, String path, AccessFTP accessFTP,String imageDomain) throws Exception {
		// IP
		String host = accessFTP.getHost();
		// 端口
		String port = accessFTP.getPort().toString();
		// 用户
		String userName = accessFTP.getUserName();
		// 密码
		String password = accessFTP.getPassword();
		String directory = accessFTP.getDirectory();//上传目录
		
		String fileName = localFile.getName();
		String uploadDirectory = directory + path + "/";
		String imagePath = "";
		FtpUtils ftpUtil = new FtpUtils();
		ftpUtil.connectServer(host, // ftp的ip地址
				Integer.parseInt(port), // ftp端口号
				userName, // ftp用户名
				password, // ftp密码
				uploadDirectory // ftp文件夹名称
		);
		boolean flag = ftpUtil.upload(localFile.getPath(),fileName);
		if(flag){
			imagePath = imageDomain+uploadDirectory.replace("/data/images","")+fileName;
		}else{
			logger.error("CmsImageServiceImpl uploadImage方法 图片上传失败！");
		}
		return imagePath;
	}

	@Override
	public List<CmsImage> getNameList(AccessFTP accessFTP, String imageDomain,String path) throws Exception {
		// IP
		String host = accessFTP.getHost();
		// 端口
		String port = accessFTP.getPort().toString();
		// 用户
		String userName = accessFTP.getUserName();
		// 密码
		String password = accessFTP.getPassword();
		String directory = accessFTP.getDirectory();//上传目录

		FtpUtils ftpUtil = new FtpUtils();
		ftpUtil.connectServer(host, // ftp的ip地址
				Integer.parseInt(port), // ftp端口号
				userName, // ftp用户名
				password, // ftp密码
				directory // ftp文件夹名称
		);
		if(StringUtils.isNotBlank(path)){
			directory = directory + "/" + path;
		}
		List<String> nameList = ftpUtil.nameList(directory);
		List<CmsImage> imageList = new ArrayList<>();
		List<CmsImage> dirList = new ArrayList<>();
		List<CmsImage> images = new ArrayList<>();
		if(nameList != null && nameList.size()>0){
			for(int i=0;i<nameList.size();i++){
				String name = nameList.get(i);
				CmsImage cmsImage = new CmsImage();
				if(name.contains(".")){
					cmsImage.setImgDir("");
					cmsImage.setType(2);
					if(StringUtils.isNotBlank(path)){
						cmsImage.setImgUrl(imageDomain+"/pics/"+path+"/"+name);
					}
					if(!StringUtils.isNotBlank(path)){
						cmsImage.setImgUrl(imageDomain+"/pics/"+name);
					}
					images.add(cmsImage);
				}
				if(!name.contains(".")){
					if(!StringUtils.isNotBlank(path)){
						cmsImage.setImgDir(name);
					}
					if(StringUtils.isNotBlank(path)){
						cmsImage.setImgDir(path + "/" + name);
					}
					cmsImage.setType(1);
					cmsImage.setImgUrl(name);
					dirList.add(cmsImage);
				}
			}
		}
		imageList.addAll(dirList);
		imageList.addAll(images);
		return imageList;
	}

	@Override
	public List<CmsImage> getDirList(AccessFTP accessFTP,String path) throws Exception {
		// IP
		String host = accessFTP.getHost();
		// 端口
		String port = accessFTP.getPort().toString();
		// 用户
		String userName = accessFTP.getUserName();
		// 密码
		String password = accessFTP.getPassword();
		String directory = accessFTP.getDirectory();//上传目录

		FtpUtils ftpUtil = new FtpUtils();
		ftpUtil.connectServer(host, // ftp的ip地址
				Integer.parseInt(port), // ftp端口号
				userName, // ftp用户名
				password, // ftp密码
				directory // ftp文件夹名称
		);
		if(StringUtils.isNotBlank(path)){
			directory = directory + "/" + path;
		}
		List<String> nameList = ftpUtil.nameList(directory);
		List<CmsImage> dirList = new ArrayList<>();
		if(nameList != null && nameList.size()>0){
			for(int i=0;i<nameList.size();i++){
				String name = nameList.get(i);
				if(!name.contains(".")){
					CmsImage cmsImage = new CmsImage();
					cmsImage.setImgUrl(name);
					cmsImage.setType(1);
					if(StringUtils.isNotBlank(path)){
						cmsImage.setImgDir(path + "/" + name);
					}
					if(!StringUtils.isNotBlank(path)){
						cmsImage.setImgDir(name);
					}
					dirList.add(cmsImage);
				}
			}
		}
		return dirList;
	}
}
