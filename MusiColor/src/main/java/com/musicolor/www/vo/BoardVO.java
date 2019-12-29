package com.musicolor.www.vo;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

public class BoardVO {
	//board
	private long b_no;
	private int b_mno;
	private int b_vno;
	private long b_sno;
	private long b_yno;
	private long b_ano;
	private int b_like;
	private int b_emotion;
	private char b_isshow;
	private String b_date;
	private String b_body;
	
	private MultipartFile sFile;
	private MultipartFile[] file;
	
	//member
	private String m_id;
	
	//picture
	private String sname;
	 
	//vocal 
	private String v_name;
	
	//song
	private String s_title;
	
	//youtube
	private String y_link;
	private char y_ismain;
	
	//search
	private String key_main;
	private String key_tab;
	
	//ComtVO 담을 list
	private ArrayList<ComtVO> comt;
	
	
	
	public ArrayList<ComtVO> getComt() {
		return comt;
	}
	public void setComt(ArrayList<ComtVO> comt) {
		this.comt = comt;
	}
	public String getKey_main() {
		return key_main;
	}
	public void setKey_main(String key_main) {
		this.key_main = key_main;
	}
	public String getKey_tab() {
		return key_tab;
	}
	public void setKey_tab(String key_tab) {
		this.key_tab = key_tab;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getB_body() {
		return b_body;
	}
	public void setB_body(String b_body) {
		this.b_body = b_body;
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
	public long getB_no() {
		return b_no;
	}
	public void setB_no(long b_no) {
		this.b_no = b_no;
	}
	public int getB_mno() {
		return b_mno;
	}
	public void setB_mno(int b_mno) {
		this.b_mno = b_mno;
	}
	public int getB_vno() {
		return b_vno;
	}
	public void setB_vno(int b_vno) {
		this.b_vno = b_vno;
	}
	public long getB_sno() {
		return b_sno;
	}
	public void setB_sno(long b_sno) {
		this.b_sno = b_sno;
	}
	public long getB_yno() {
		return b_yno;
	}
	public void setB_yno(long b_yno) {
		this.b_yno = b_yno;
	}
	public long getB_ano() {
		return b_ano;
	}
	public void setB_ano(long b_ano) {
		this.b_ano = b_ano;
	}
	public int getB_like() {
		return b_like;
	}
	public void setB_like(int b_like) {
		this.b_like = b_like;
	}
	public int getB_emotion() {
		return b_emotion;
	}
	public void setB_emotion(int b_emotion) {
		this.b_emotion = b_emotion;
	}
	public char getB_isshow() {
		return b_isshow;
	}
	public void setB_isshow(char b_isshow) {
		this.b_isshow = b_isshow;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public String getV_name() {
		return v_name;
	}
	public void setV_name(String v_name) {
		this.v_name = v_name;
	}
	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public String getY_link() {
		return y_link;
	}
	public void setY_link(String y_link) {
		this.y_link = y_link;
	}
	public char getY_ismain() {
		return y_ismain;
	}
	public void setY_ismain(char y_ismain) {
		this.y_ismain = y_ismain;
	}
	
	
}
