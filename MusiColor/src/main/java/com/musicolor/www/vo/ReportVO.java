package com.musicolor.www.vo;

public class ReportVO {
	// report 테이블
	private long r_no; // 신고 번호
	private long r_mno; // 신고자 번호
	private long r_sno; // 신고된 곡 번호
	private String r_kind; // 신고 분류
	private String r_detail; // 신고 자세한 내용
	
	private String id;

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

	public long getR_sno() {
		return r_sno;
	}

	public void setR_sno(long r_sno) {
		this.r_sno = r_sno;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
