package com.musicolor.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.musicolor.www.vo.*;

public class EunbinDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
//	upload DAO
	public int vocalUpdate(SongVO vo){
		return sqlSession.insert("eSQL.vocalIn", vo);
	}
	
	public List<SongVO> vocalSearch(SongVO vo) {
		return sqlSession.selectList("eSQL.vocalSearch", vo);
	}
	
	public int songUpdate(SongVO vo) {
		return sqlSession.insert("eSQL.songIn", vo);
	}
	
	public int youtubeUpdate(SongVO vo) {
		return sqlSession.insert("eSQL.youtubeIn", vo);
	}

	public List<SongVO> searchSong(SongVO vo) {
		return sqlSession.selectList("eSQL.searchSong", vo);
	}
	public int findMno(String m_id) {
		return sqlSession.selectOne("eSQL.findMno", m_id);
	}
	public int boardIn(BoardVO vo) {
		return sqlSession.insert("eSQL.boardIn", vo);
	}
	
// 	random DAO
	public List<BoardVO> randomSearch(String b_emotion){
		List<BoardVO> list = sqlSession.selectList("eSQL.randomSearch", b_emotion);
		return list;
	}
	
// report DAO
	public int reportProc(ReportVO vo) {
		return sqlSession.insert("eSQL.reportProc", vo);
	}
	
// admin DAO
	
	public int adminLoginProc(MemberVO mVO) {
		return sqlSession.selectOne("eSQL.adminLogin", mVO);
	}
	
	public List<ReportVO> getReport(String r_isokay){
		return sqlSession.selectList("eSQL.getReport", r_isokay);
	}
	
	public SongVO repoDetail(String sno) {
		return sqlSession.selectOne("eSQL.repoDetail", sno);
	}
	
	public BoardVO repoDetailBoard(String bno) {
		return sqlSession.selectOne("eSQL.repoDetailBoard", bno);
	}
	
	public ComtVO repoDetailComt(String cno) {
		return sqlSession.selectOne("eSQL.repoDetailComt", cno);
	}
	
	public int findADMno(String ad_id) {
		return sqlSession.selectOne("eSQL.findADMno", ad_id);
	}
	
	public int reupdateVocal(SongVO vo) {
		return sqlSession.update("eSQL.reupdateVocal", vo);
	}
	
	public int reupdateSong(SongVO vo) {
		return sqlSession.update("eSQL.reupdateSong", vo);
	}
	
	public int reupdateYoutube(SongVO vo) {
		return sqlSession.update("eSQL.reupdateYoutube", vo);
	}
	
	public int reupdateReport(Object vo) {
		return sqlSession.update("eSQL.reupdateReport", vo);
	}
	
	public int reupdateBoard(BoardVO vo) {
		return sqlSession.update("eSQL.reupdateBoard", vo);
	}
	
	public int reupdateComt(ComtVO vo) {
		return sqlSession.update("eSQL.reupdateComt", vo);
	}
	
	public int reupdateSMember(SongVO vo) {
		return sqlSession.update("eSQL.reupdateSMember", vo);
	}
	
	public int reupdateBMember(BoardVO vo) {
		return sqlSession.update("eSQL.reupdateBMember", vo);
	}
	
	public int reupdateCMember(ComtVO vo) {
		return sqlSession.update("eSQL.reupdateCMember", vo);
	}
	
	public int todayMember() {
		return sqlSession.selectOne("eSQL.todayMember");
	}
	
	public int totalMember() {
		return sqlSession.selectOne("eSQL.totalMember");
	}
	
	public int todayBoard() {
		return sqlSession.selectOne("eSQL.todayBoard");
	}
	
	public int totalBoard() {
		return sqlSession.selectOne("eSQL.totalBoard");
	}
	
	public List<SongVO> vocalChart() {
		return sqlSession.selectList("eSQL.vocalChart");
	}
	
	public List<ChartVO> boardChart() {
		return sqlSession.selectList("eSQL.boardChart");
	}
	
	public List<ChartVO> boardChartSelected(int emo) {
		return sqlSession.selectList("eSQL.boardChartSelected", emo);
	}
}
