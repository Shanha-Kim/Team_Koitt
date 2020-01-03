package com.musicolor.www.vo;

import org.springframework.web.multipart.MultipartFile;

public class FileVO {
	private long no;
	private String oname;
	private String sname;
	private String dir;
	private long len;
	private char isshow;
	private MultipartFile sFile;
	
	private int check;
	
	
	
	public MultipartFile getsFile() {
		return sFile;
	}
	public void setsFile(MultipartFile sFile) {
		this.sFile = sFile;
	}
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getOname() {
		return oname;
	}
	public void setOname(String oname) {
		this.oname = oname;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public long getLen() {
		return len;
	}
	public void setLen(long len) {
		this.len = len;
	}
	public char getIsshow() {
		return isshow;
	}
	public void setIsshow(char isshow) {
		this.isshow = isshow;
	}
	public int getCheck() {
		return check;
	}
	public void setCheck(int check) {
		this.check = check;
	}
}
