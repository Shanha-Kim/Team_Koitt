package com.musicolor.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.musicolor.www.vo.*;

public class HeeyoonDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	// 개인프로필 사진 수정 전담 처리 함수
	public int addpic(FileVO fVO) {
		return sqlSession.update("hSQL.addpic", fVO);

	}

	// 개인프로필 사진 리스트 전담 처리 함수
	public List<BoardVO> profileList(String SID) {
		List<BoardVO> list = sqlSession.selectList("hSQL.addalbumpic", SID);
		return list;

	}

	// 개인 프로필 텍스트 수정 전담처리 함수
	public int profiletextconfig(MemberVO mVO) {
		return sqlSession.update("hSQL.profileconfig", mVO);

	}

	// 멤버에다 아이디 값 넣어주기
	public int mNo(String SID) {
		return sqlSession.selectOne("hSQL.mNo", SID);

	}

	// 개인프로필 로고 사진 수정 전담처리 함수
	public FileVO proflogo(String SID) {
		return sqlSession.selectOne("hSQL.proflogo", SID);
	}

	// 개인프로필 자기소개글 전담 처리 함수
	public MemberVO profintro(String SID) {
		return sqlSession.selectOne("hSQL.introtext", SID);
	}

	// 개인 프로필 앨범 수 카운트 점담 처리 함수
	public int profilecont(String SID) {
		return sqlSession.selectOne("hSQL.textcount", SID);
	}

	// 개인 프로필 계정비활성화 전담 처리 함수
	public int prolock(MemberVO mVO) {
		return sqlSession.update("hSQL.lock", mVO);

	}

	// 개인 프로필 계정 활성화 전담 처리 함수
	public int prounlock(MemberVO mVO) {
		return sqlSession.update("hSQL.unlock", mVO);

	}
	// 개인 프로필 계정 비활성화 여부 전담 처리 함수

	public String proisshow(String SID) {
		return sqlSession.selectOne("hSQL.isshow", SID);

	}

	// 팔로워 한 사람들 뽑아오기 전담처리 함수
	public List<MemberVO> follwer(String SID) {
		List<MemberVO> list1 = sqlSession.selectList("hSQL.follwer", SID);
		return list1;

	}

	// 팔로우 체크 함수 N Y 구분 전담 처리 함수
	public void followcheck(MemberVO mVO) {
		int cnt = sqlSession.selectOne("hSQL.followcheck", mVO);
		// 팔로워가 N인지 Y인지 확인
		
		  System.out.println(mVO.getM_id());
		  System.out.println(mVO.getM_name());
		 
		if (cnt == 0) { // null 값
			int cnt1 = sqlSession.insert("hSQL.finsert", mVO);

		} else {
			MemberVO check = sqlSession.selectOne("hSQL.nycheck", mVO);

			if (check.getM_isshow() == 'Y') {
				// 팔로워가 Y이면 N 바꿔주기
				int cnt2 = sqlSession.update("hSQL.fcansle",mVO);
			} else {
				// 팔로워가 N이면 Y 바꿔주기
				int cnt3 = sqlSession.update("hSQL.fadd",mVO);
			}
		}
	}
	

	// 팔로잉 한 사람들 뽑아오기 전담처리 함수
	public List<MemberVO> following(String SID) {
		List<MemberVO> list2 = sqlSession.selectList("hSQL.following", SID);
		return list2;
	}

	// 팔로우 취소 전담 처리 함수
	public int cansle(MemberVO mVO) {
		return sqlSession.update("hSQL.fcansle", mVO);
	}

	// 팔로우 다시 걸기 전담 처리 함수
	public int fadd(MemberVO mVO) {
		return sqlSession.update("hSQL.fadd", mVO);
	}
	
	//팔로워 카운트 전담 처리 함수
	public int followcnt(String SID) {
		return sqlSession.selectOne("hSQL.followercnt",SID);
		
	}
	//팔로잉 카운트 전담 처리 함수
	public int followingcnt(String SID) {
		return sqlSession.selectOne("hSQL.followeingcnt",SID);
	}
	
	//좋아요 게시글 리스트  전담처리 함수
	public List<BoardVO> likelist(String SID) {
		List<BoardVO> list3 =  sqlSession.selectList("hSQL.likedboard", SID);
		return list3;
	}
	
	//상대방 홈페이지에서 팔로워 취소 처리 전담함수
	public int otherscansle(MemberVO mVO) {
		return sqlSession.update("hSQL.fcansle",mVO);
		
	}
	
	//팔로워 n 인지 y 인지 체크
	public MemberVO nyck(MemberVO mVO){
		return sqlSession.selectOne("hSQL.nycheck",mVO);
		
	}
}

