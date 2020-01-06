package com.musicolor.www.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class SongVO { 
	// song 테이블
	private long s_no; // 노래번호
	private int s_vno; // 가수번호
	private String s_title; // 노래제목
	private long s_ano; // 사진번호
	private List<String> songlist; //크롤링 노래
	private List<String> vocallist;//크롤링 가수
	// vocal 테이블
	private String v_name; // 가수 이름
	
	// youtube 테이블
	private long y_no; // 유튜브 번호
	private String y_link; // 유튜브 링크
	private int y_mno; // 업로드 회원 번호
	
	// album 테이블
	private String a_sname; // 사진 저장 번호
	private String a_dir; // 사진 저장 위치
	
	// 파일 업로드 관련
	private MultipartFile sFile;
	private MultipartFile[] file;
	
	// 검색 키워드 저장용
	private String keywords;
	
	// 차트 순서 저장용 
	private int chart;
	
	// 아이디
	private String id;
	private int m_no;
	
	// 임시저장용
	private int check;
	
	// report num
	private long r_no;
	
	
	
	
	
	public List<String> getSonglist() {
		return songlist;
	}
	public void setSonglist(List<String> songlist) {
		this.songlist = songlist;
	}
	public List<String> getVocallist() {
		return vocallist;
	}
	public void setVocallist(List<String> vocallist) {
		this.vocallist = vocallist;
	}
	public long getS_no() {
		return s_no;
	}
	public void setS_no(long s_no) {
		this.s_no = s_no;
	}
	public int getS_vno() {
		return s_vno;
	}
	public void setS_vno(int s_vno) {
		this.s_vno = s_vno;
	}
	public String getS_title() {
		return s_title;
	}
	public void setS_title(String s_title) {
		this.s_title = s_title;
	}
	public long getS_ano() {
		return s_ano;
	}
	public void setS_ano(long s_ano) {
		this.s_ano = s_ano;
	}
	public String getV_name() {
		return v_name;
	}
	public void setV_name(String v_name) {
		this.v_name = v_name;
	}
	public long getY_no() {
		return y_no;
	}
	public void setY_no(long y_no) {
		this.y_no = y_no;
	}
	public String getY_link() {
		return y_link;
	}
	public void setY_link(String y_link) {
		this.y_link = y_link;
	}
	public int getY_mno() {
		return y_mno;
	}
	public void setY_mno(int y_mno) {
		this.y_mno = y_mno;
	}
	public String getA_sname() {
		return a_sname;
	}
	public void setA_sname(String a_sname) {
		this.a_sname = a_sname;
	}
	public String getA_dir() {
		return a_dir;
	}
	public void setA_dir(String a_dir) {
		this.a_dir = a_dir;
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
	public String getKeywords() {
		return keywords;
	}
	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}
	public int getChart() {
		return chart;
	}
	public void setChart(int chart) {
		this.chart = chart;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public int getCheck() {
		return check;
	}
	public void setCheck(int check) {
		this.check = check;
	}
	public long getR_no() {
		return r_no;
	}
	public void setR_no(long r_no) {
		this.r_no = r_no;
	}
}
