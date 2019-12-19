package com.musicolor.www.vo;

public class FileVO {
	private int no;
	private String oname;
	private String sname;
	private String dir;
	private long len;
	private char isshow;
	
	
	
	public String getDir() {
		return dir;
	}
	public void setDir(String dir) {
		this.dir = dir;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
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
	
	
}
