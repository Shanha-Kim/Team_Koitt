package com.musicolor.www.vo;

public class ReportVO {
	// report 테이블
	private long r_no; // 신고 번호
	private long r_mno; // 신고자 번호
	private long r_problem; // 문제 내용 번호
	private String r_kind; // 신고 분류
	private String r_detail; // 신고 자세한 내용
	private String r_isokay;
	private String r_date;
	
	private String id;
	private String adid;
	
	private String song;

	public long getR_no() {
		return r_no;
	}

	public void setR_no(long r_no) {
		this.r_no = r_no;
	}

	public long getR_mno() {
		return r_mno;
	}

	public void setR_mno(long r_mno) {
		this.r_mno = r_mno;
	}

	public long getR_problem() {
		return r_problem;
	}

	public void setR_problem(long r_problem) {
		this.r_problem = r_problem;
	}

	public String getR_kind() {
		return r_kind;
	}

	public void setR_kind(String r_kind) {
		this.r_kind = r_kind;
	}

	public String getR_detail() {
		return r_detail;
	}

	public void setR_detail(String r_detail) {
		this.r_detail = r_detail;
	}

	public String getR_isokay() {
		return r_isokay;
	}

	public void setR_isokay(String r_isokay) {
		this.r_isokay = r_isokay;
	}

	public String getR_date() {
		return r_date;
	}

	public void setR_date(String r_date) {
		this.r_date = r_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	

	public String getAdid() {
		return adid;
	}

	public void setAdid(String adid) {
		this.adid = adid;
	}

	public String getSong() {
		return song;
	}

	public void setSong(String song) {
		this.song = song;
	}
	
	
}
