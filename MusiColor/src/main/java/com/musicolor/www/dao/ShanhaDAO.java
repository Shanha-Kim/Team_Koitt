package com.musicolor.www.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.musicolor.www.vo.BoardVO;

public class ShanhaDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public java.util.List<BoardVO> showBefore(){
		java.util.List<BoardVO> list = sqlSession.selectList("sSQL.SearchBefore");
		return list;
	}
	public java.util.List<BoardVO> searchAfter(){
		java.util.List<BoardVO> list = sqlSession.selectList("sSQL.SearchAfter");
		return list;
	}
}
