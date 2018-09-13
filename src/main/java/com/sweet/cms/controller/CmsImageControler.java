package com.sweet.cms.controller;

import com.sweet.cms.commons.base.BaseController;
import com.sweet.cms.model.CmsImage;
import com.sweet.cms.service.ICmsImageService;
import com.sweet.cms.util.AccessFTP;
import com.sweet.cms.util.BASE64DecodedMultipartFile;
import net.sf.json.JSONObject;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.util.*;

/**
 * 图片管理
 */

@Controller
@RequestMapping("/cmsImageControler")
public class CmsImageControler extends BaseController {

	private static final Log logger = LogFactory.getLog(CmsImageControler.class);

	@Resource
	private ICmsImageService cmsImageService;

	//图片访问域名
	private static final String imageDomain = "http://47.95.213.244";

	/**
	 * 构建上传图片对象
	 * @return
	 */
	public AccessFTP buildUploadImage() {
		// 读取配置文件
		org.springframework.core.io.Resource resource = new ClassPathResource("/config/application.properties");
		Properties props = new Properties();
		AccessFTP uploadImage = new AccessFTP();
		try {
			props = PropertiesLoaderUtils.loadProperties(resource);
			uploadImage.setHost(props.getProperty("ftp.host"));
			uploadImage.setPort(props.getProperty("ftp.port"));
			uploadImage.setUserName(props.getProperty("ftp.user"));
			uploadImage.setPassword(props.getProperty("ftp.password"));
			uploadImage.setDirectory(props.getProperty("ftp.base.path"));
		} catch (IOException e) {
			logger.error("读取ftp配置文件错误",e);
		}
		return uploadImage;
	}

	/**
	 * 上传图片
	 * @param file
	 * @param path  上传目录
	 * @param type  0 上传原文件名称 1 修改文件名为当前时间戳后上传
	 * @param request
	 * @return
	 */
	@PostMapping("/uploadImage")
	@ResponseBody
	public String uploadImage(MultipartFile file, String path,Integer type, HttpServletRequest request){
		if(type == null){
			type = 1;
		}
		Map<String,String> map = new HashMap<String,String>();
		String result = "";
		try{
			if(StringUtils.isNotBlank(path)){
				path = URLDecoder.decode(path,"UTF-8");
			}
			String realPath = request.getSession().getServletContext().getRealPath("/upload/file");
			String fileName = "";
			String originalFilename = file.getOriginalFilename();
			int loc = originalFilename.lastIndexOf(".");
			//原文件名称上传
			if(type == 0){
				fileName = originalFilename;
			}
			//修改文件名称为当前时间戳后上传
			if(type == 1){
				Date date = new Date();
				fileName = date.getTime()+originalFilename.substring(loc);
			}
			String suffix = originalFilename.substring(loc+1);
			if(!suffix.equalsIgnoreCase("jpg")&&!suffix.equalsIgnoreCase("jpeg")&&!suffix.equalsIgnoreCase("gif")
					&&!suffix.equalsIgnoreCase("png")&&!suffix.equalsIgnoreCase("bmp")){
				map.put("status", "fail");
				map.put("errorDesc", "图片格式错误！");
				JSONObject jo = JSONObject.fromObject(map);
				return jo.toString();
			}
			File localFile = new File(realPath,fileName);
			//判断目标文件所在的目录是否存在
			if(!localFile.getParentFile().exists()) {
				localFile.getParentFile().mkdirs();
			}
			FileUtils.copyInputStreamToFile(file.getInputStream(), localFile);
			AccessFTP accessFTP = buildUploadImage();
			result = cmsImageService.uploadImage(localFile,path,accessFTP,imageDomain);
			map.put("status", "success");
			map.put("imageUrl", result);
			if (localFile.exists()) {
				localFile.delete();
			}
		}catch(Exception e){
			logger.error("图片上传失败",e);
			map.put("status", "fail");
			map.put("errorDesc", "图片上传失败！");
		}
		JSONObject jo = JSONObject.fromObject(map);
		return jo.toString();
	}

	/**
	 * 批量上传图片
	 * @param fileList
	 * @param path
	 * @param type
	 * @param request
	 * @return
	 */
	@PostMapping("/uploadImageBatch")
	@ResponseBody
	public String uploadImageBatch(@RequestParam("fileList") MultipartFile[] fileList, String path, Integer type, HttpServletRequest request){
		if(type == null){
			type = 1;
		}
		Map<String,Object> map = new HashMap<>();
		List<String> imageUrlList = new ArrayList<>();
		try{
			if(StringUtils.isNotBlank(path)){
				path = URLDecoder.decode(path,"UTF-8");
			}
			if(fileList != null && fileList.length>0){
				for(int i=0;i<fileList.length;i++){
					MultipartFile file = fileList[i];
					String imageUrl = "";
					String realPath = request.getSession().getServletContext().getRealPath("/upload/file");
					String fileName = "";
					String originalFilename = file.getOriginalFilename();
					int loc = originalFilename.lastIndexOf(".");
					//原文件名称上传
					if(type == 0){
						fileName = originalFilename;
					}
					//修改文件名称为当前时间戳后上传
					if(type == 1){
						Date date = new Date();
						fileName = date.getTime()+originalFilename.substring(loc);
					}
					String suffix = originalFilename.substring(loc+1);
					if(!suffix.equalsIgnoreCase("jpg")&&!suffix.equalsIgnoreCase("jpeg")&&!suffix.equalsIgnoreCase("gif")
							&&!suffix.equalsIgnoreCase("png")&&!suffix.equalsIgnoreCase("bmp")){
						map.put("status", "fail");
						map.put("errorDesc", "图片格式错误！");
						JSONObject jo = JSONObject.fromObject(map);
						return jo.toString();
					}
					File localFile = new File(realPath,fileName);
					//判断目标文件所在的目录是否存在
					if(!localFile.getParentFile().exists()) {
						localFile.getParentFile().mkdirs();
					}
					FileUtils.copyInputStreamToFile(file.getInputStream(), localFile);
					AccessFTP accessFTP = buildUploadImage();
					imageUrl = cmsImageService.uploadImage(localFile,path,accessFTP,imageDomain);
					if (localFile.exists()) {
						localFile.delete();
					}
					imageUrlList.add(imageUrl);
				}
			}

			map.put("status", "success");
			map.put("imageUrlList", imageUrlList);
		}catch(Exception e){
			logger.error("图片上传失败",e);
			map.put("status", "fail");
			map.put("errorDesc", "图片上传失败！");
		}
		JSONObject jo = JSONObject.fromObject(map);
		return jo.toString();
	}

	/**
	 * 上传图片
	 * @param image
	 * @param path  上传目录
	 * @param type  0 上传原文件名称 1 修改文件名为当前时间戳后上传
	 * @param request
	 * @return
	 */
	@PostMapping("/uploadImageBase64")
	@ResponseBody
	public String uploadImageBase64(String image, String path, Integer type, HttpServletRequest request){
		if(type == null){
			type = 1;
		}
		Map<String,Object> map = new HashMap<>();
		try{
			if(StringUtils.isNotBlank(path)){
				path = URLDecoder.decode(path,"UTF-8");
			}
			//base64转化为MultipartFile
			MultipartFile file = BASE64DecodedMultipartFile.base64ToMultipart(image);
			String imageUrl = "";
			String realPath = request.getSession().getServletContext().getRealPath("/upload/file");
			String fileName = "";
			String originalFilename = file.getOriginalFilename();
			int loc = originalFilename.lastIndexOf(".");
			//原文件名称上传
			if(type == 0){
				fileName = originalFilename;
			}
			//修改文件名称为当前时间戳后上传
			if(type == 1){
				Date date = new Date();
				fileName = date.getTime()+originalFilename.substring(loc);
			}
			String suffix = originalFilename.substring(loc+1);
			if(!suffix.equalsIgnoreCase("jpg")&&!suffix.equalsIgnoreCase("jpeg")&&!suffix.equalsIgnoreCase("gif")
					&&!suffix.equalsIgnoreCase("png")&&!suffix.equalsIgnoreCase("bmp")){
				map.put("status", "fail");
				map.put("errorDesc", "图片格式错误！");
				JSONObject jo = JSONObject.fromObject(map);
				return jo.toString();
			}
			File localFile = new File(realPath,fileName);
			//判断目标文件所在的目录是否存在
			if(!localFile.getParentFile().exists()) {
				localFile.getParentFile().mkdirs();
			}
			FileUtils.copyInputStreamToFile(file.getInputStream(), localFile);
			AccessFTP accessFTP = buildUploadImage();
			imageUrl = cmsImageService.uploadImage(localFile,path,accessFTP,imageDomain);
			if (localFile.exists()) {
				localFile.delete();
			}
			map.put("status", "success");
			map.put("imageUrl", imageUrl);
		}catch(Exception e){
			logger.error("图片上传失败",e);
			map.put("status", "fail");
			map.put("errorDesc", "图片上传失败！");
		}
		JSONObject jo = JSONObject.fromObject(map);
		return jo.toString();
	}

	/**
	 * 获取文件及目录名称
	 * @return
	 */
	@RequestMapping("/getNameList")
	@ResponseBody
	public List<CmsImage> getNameList(String path){
		if(path == null){
			path = "";
		}
		AccessFTP accessFTP = buildUploadImage();
		List<CmsImage> dirList = new ArrayList<>();
		try {
			if(StringUtils.isNotBlank(path)){
				path = URLDecoder.decode(path,"UTF-8");
			}
			dirList = cmsImageService.getNameList(accessFTP,imageDomain,path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  dirList;
	}

	/**
	 * 获取目录名称
	 * @param path
	 * @return
	 */
	@RequestMapping("/getDirList")
	@ResponseBody
	public List<CmsImage> getDirList(String path){
		if(path == null){
			path = "";
		}
		AccessFTP accessFTP = buildUploadImage();
		List<CmsImage> dirList = new ArrayList<>();
		try {
			if(StringUtils.isNotBlank(path)){
				path = URLDecoder.decode(path,"UTF-8");
			}
			dirList = cmsImageService.getDirList(accessFTP,path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return  dirList;
	}

}
