package com.musicolor.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.musicolor.www.vo.FileVO;
import com.musicolor.www.vo.MemberVO;

public class HeeyoonDAO {

	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//개인프로필 사진 수정 전담 처리 함수
	public int addpic(FileVO fVO) {
		return sqlSession.update("hSQL.addpic" ,fVO);
		
	}
	
	//개인프로필 사진 리스트 전담 처리 함수
	public List<FileVO> profileList(){
	List<FileVO> list = sqlSession.selectList("hSQL.addalbumpic");
		return list;
		
	}
	//개인 프로필 텍스트 수정 전담처리 함수 
	public int profiletextconfig(MemberVO mVO) {
		return sqlSession.update("hSQL.profileconfig",mVO);
		
	}
	
}
