package com.musicolor.www.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.musicolor.www.vo.MemberVO;
 
public class YoujoonDAO {
	
	@Autowired 
	SqlSessionTemplate sqlSession;
	
	public int loginProc(MemberVO mVO) {
		System.out.println("### id " + mVO.getM_id() + " | pw : " + mVO.getM_pw());
		int cnt = sqlSession.selectOne("mSQL.login", mVO);
		
		return cnt; 
	}
	 
	public int insertMemb(MemberVO mVO) {
		
		return sqlSession.insert("mSQL.insertMemb", mVO);
	}
	
	public int idCheck(String m_id) {
		
		int cnt = sqlSession.selectOne("mSQL.idCheck", m_id);
		
		return cnt;
	}
	
	public MemberVO findIdProc(MemberVO mVO) {
		System.out.println("dao 함수");
		MemberVO fId = sqlSession.selectOne("mSQL.findId", mVO);
		
		return fId;
	}
}