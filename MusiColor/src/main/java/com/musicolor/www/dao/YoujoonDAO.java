package com.musicolor.www.dao;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.musicolor.www.vo.MemberVO;
 
public class YoujoonDAO {
	
	@Autowired 
	SqlSessionTemplate sqlSession;
	
	public int loginProc(MemberVO mVO) {
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
		MemberVO fId = sqlSession.selectOne("mSQL.findId", mVO);
		
		return fId;
	}
}