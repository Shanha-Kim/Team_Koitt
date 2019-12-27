package com.musicolor.www.dao;

import java.util.List;

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
	public BoardVO showDetail(BoardVO bVO){
		BoardVO vo = sqlSession.selectOne("sSQL.showDetail", bVO);
		return vo;
	}
	public List<FileVO> searchAfter(BoardVO bVO){
		List<FileVO> list = sqlSession.selectList("sSQL.SearchAfter", bVO);
		return list;
	}
	
	public java.util.List<FileVO> preView(BoardVO bVO){
		java.util.List<FileVO> list = sqlSession.selectList("sSQL.PreView", bVO);
		return list;
	}
}
