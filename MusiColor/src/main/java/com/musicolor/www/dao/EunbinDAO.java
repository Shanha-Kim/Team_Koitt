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
		System.out.println(vo.getKeywords());
		return sqlSession.selectList("eSQL.searchSong", vo);
	}
	public int findMno(String m_id) {
		return sqlSession.selectOne("eSQL.findMno", m_id);
	}
	public int boardIn(BoardVO vo) {
		return sqlSession.insert("eSQL.boardIn", vo);
	}
	
// 	random DAO
	public List<BoardVO> randomSearch(){
		List<BoardVO> list = sqlSession.selectList("eSQL.randomSearch");
		return list;
	}
	
	public List<BoardVO> randomSelected(String b_emotion){
		List<BoardVO> list = sqlSession.selectList("eSQL.randomSelected", b_emotion);
		return list;
	}
	
// report DAO
	public int reportProc(ReportVO vo) {
		return sqlSession.insert("eSQL.reportProc", vo);
	}
}
