package com.musicolor.www.vo;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private int m_no;
	private String m_id;
	private String m_name;
	private String m_pw;
	private String m_email;
	private String m_tel;
	private int m_isban;
	private char m_isshow;
	private int m_following;
	private int m_follower;
	private long m_pno;
	private String m_date;
	private String m_about; // 자기소개
	//m_date 활용은 sql문에서 TO_CHAR(m_date, 'YYYY/MM/DD HH24:MI:SS DY') 형태로 활용

	private MultipartFile sFile;
	private MultipartFile[] file;
	
	
	
	public long getM_pno() {
		return m_pno;
	}
	public void setM_pno(long m_pno) {
		this.m_pno = m_pno;
	}
	public String getM_about() {
		return m_about;
	}
	public void setM_about(String m_about) {
		this.m_about = m_about;
	}
	public MultipartFile getsFile() {
		return sFile;
	}
	public void setsFile(MultipartFile sFile) {
		this.sFile = sFile;
	}
	public MultipartFile[] getFile() {
		return file;
	}
	public void setFile(MultipartFile[] file) {
		this.file = file;
	}
	public char getM_isshow() {
		return m_isshow;
	}
	public void setM_isshow(char m_isshow) {
		this.m_isshow = m_isshow;
	}
	public String getM_date() {
		return m_date;
	}
	public void setM_date(String m_date) {
		this.m_date = m_date;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_tel() {
		return m_tel;
	}
	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}
	public int getM_isban() {
		return m_isban;
	}
	public void setM_isban(int m_isban) {
		this.m_isban = m_isban;
	}
	public int getM_following() {
		return m_following;
	}
	public void setM_following(int m_following) {
		this.m_following = m_following;
	}
	public int getM_follower() {
		return m_follower;
	}
	public void setM_follower(int m_follower) {
		this.m_follower = m_follower;
	}
	
}
