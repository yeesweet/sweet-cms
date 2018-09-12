package com.sweet.cms.util;

import com.jcraft.jsch.*;

import java.io.*;
import java.util.Properties;
import java.util.Vector;

/**
 * FTP访问
 * 
 * @author
 * @createDate 2018-08-13
 */
public class AccessFTP {

	private String port;
	private String host;
	private String userName;
	private String password;
	private String directory;
	private String directoryDownload;
	private String directorySaveFile;

	/**
	 * 连接sftp服务器
	 * 
	 * @param host
	 *            主机
	 * @param port
	 *            端口
	 * @param username
	 *            用户名
	 * @param password
	 *            密码
	 * @return
	 * @throws Exception
	 */
	public ChannelSftp connect(String host, int port, String username, String password) throws Exception {
		ChannelSftp sftp = null;
		JSch jsch = new JSch();
		jsch.getSession(username, host, port);
		Session sshSession = jsch.getSession(username, host, port);
		sshSession.setPassword(password);
		Properties sshConfig = new Properties();
		sshConfig.put("StrictHostKeyChecking", "no");
		sshSession.setConfig(sshConfig);
		sshSession.connect();
		Channel channel = sshSession.openChannel("sftp");
		channel.connect();
		sftp = (ChannelSftp) channel;
		return sftp;
	}

	/**
	 * 上传文件
	 * 
	 * @param directory
	 *            上传的目录
	 * @param uploadFile
	 *            要上传的文件
	 * @param sftp
	 * @throws Exception
	 */
	public void upload(String directory, File uploadFile, ChannelSftp sftp) throws Exception {
		sftp.cd(directory);
		sftp.put(new FileInputStream(uploadFile), uploadFile.getName());
	}

	/**
	 * 下载文件
	 * 
	 * @param directory
	 *            下载目录
	 * @param downloadFile
	 *            下载的文件
	 * @param saveFile
	 *            存在本地的路径
	 * @param sftp
	 * @throws Exception
	 * @throws FileNotFoundException
	 */
	public BufferedReader download(String directory, String saveFile, String downloadFile, ChannelSftp sftp) throws Exception {
		sftp.cd(directory);
		File file = new File(saveFile + downloadFile);

		if (file.exists()) {// 判断文件目录的存在
			if (file.isDirectory()) {// 判断文件的存在性
			} else {
				file.createNewFile();// 创建文件
			}
		} else {
			File file2 = new File(file.getParent());
			file2.mkdirs();
			if (file.isDirectory()) {
			} else {
				file.createNewFile();// 创建文件
			}
		}
		sftp.get(downloadFile, new FileOutputStream(file));

		 BufferedReader br = new BufferedReader(new FileReader(file));
		 return br;
	}

	/**
	 * 删除文件
	 * 
	 * @param directory
	 *            要删除文件所在目录
	 * @param deleteFile
	 *            要删除的文件
	 * @param sftp
	 */
	public void delete(String directory, String deleteFile, ChannelSftp sftp) {
		try {
			sftp.cd(directory);
			sftp.rm(deleteFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 列出目录下的文件
	 * 
	 * @param directory
	 *            要列出的目录
	 * @param sftp
	 * @return
	 * @throws SftpException
	 */
	public Vector listFiles(String directory, ChannelSftp sftp) throws SftpException {
		return sftp.ls(directory);
	}

	public static void main(String[] args) {
		AccessFTP sf = new AccessFTP();
		String host = "10.0.30.141";
		int port = 22;
		String username = "root";
		String password = "yougou";
		String directory = "/usr/";
		String uploadFile = "D:\\1.txt";
		// String downloadFile = "upload.txt";
		// String saveFile = "D:\\tmp\\download.txt";
		// String deleteFile = "delete.txt";
		try {
			ChannelSftp sftp = sf.connect(host, port, username, password);
			sf.download(directory,"d://log//", "access.log-20120822", sftp);
			// sf.upload(directory, new File(uploadFile), sftp);
			// sf.download(directory, downloadFile, saveFile, sftp);
			// sf.delete(directory, deleteFile, sftp);
			sftp.cd(directory);
			// sftp.mkdir("ss");
			System.out.println("finished");
			sftp.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDirectory() {
		return directory;
	}

	public void setDirectory(String directory) {
		this.directory = directory;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public String getDirectoryDownload() {
		return directoryDownload;
	}

	public void setDirectoryDownload(String directoryDownload) {
		this.directoryDownload = directoryDownload;
	}

	public String getDirectorySaveFile() {
		return directorySaveFile;
	}

	public void setDirectorySaveFile(String directorySaveFile) {
		this.directorySaveFile = directorySaveFile;
	}
}
