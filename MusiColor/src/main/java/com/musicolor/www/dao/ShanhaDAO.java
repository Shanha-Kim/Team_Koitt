package com.musicolor.www.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.musicolor.www.vo.BoardVO;
import com.musicolor.www.vo.FileVO;

public class ShanhaDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public java.util.List<FileVO> showBefore(){
		java.util.List<FileVO> list = sqlSession.selectList("sSQL.SearchBefore");
		return list;
	}
	public BoardVO searchAfter(BoardVO bVO){
		BoardVO vo = sqlSession.selectOne("sSQL.", bVO);
		return vo;
	}
}
