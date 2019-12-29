package com.musicolor.www.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.musicolor.www.vo.BoardVO;
import com.musicolor.www.vo.ComtVO;
import com.musicolor.www.vo.FileVO;

public class ShanhaDAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	public List<FileVO> showBefore(){
		List<FileVO> list = sqlSession.selectList("sSQL.SearchBefore");
		return list;
	}
	public BoardVO showDetail(BoardVO bVO){
		BoardVO vo = sqlSession.selectOne("sSQL.showDetail", bVO);
		List<ComtVO> list = sqlSession.selectList("sSQL.showComt", bVO);
		vo.setComt((ArrayList<ComtVO>)list);
		return vo;
	}
	public BoardVO likeProc(BoardVO bVO){
		//기존에 있는 좋아요인지 체크
		int cnt = sqlSession.selectOne("sSQL.LikeCheck", bVO);
		if(cnt==0) {
			//boardlike테이블에 행추가
			int cnt2 = sqlSession.insert("sSQL.LikeProcIns", bVO);
			//board테이블에 좋아요 총개수 증가
			int cnt3 = sqlSession.update("sSQL.LikeProcPlus", bVO);
		}else {
			//기존에 있던 좋아요가 Y인지 N인지 확인
			BoardVO check = sqlSession.selectOne("sSQL.LikeYorN", bVO);
			if(check.getB_isshow() == 'Y') {
				//boardlike테이블에 isshow 'N'로 변경
				int cnt2 = sqlSession.update("sSQL.LikeProcN", bVO);
				//board테이블에 좋아요 총개수 감소
				int cnt3 = sqlSession.update("sSQL.LikeProcMinus", bVO);
			}else {
				//boardlike테이블에 isshow 'Y'로 변경
				int cnt2 = sqlSession.update("sSQL.LikeProcY", bVO);
				//board테이블에 좋아요 총개수 증가
				int cnt3 = sqlSession.update("sSQL.LikeProcPlus", bVO);
			}
		}
		
		//board테이블에서 b_like 셀렉
		BoardVO vo = sqlSession.selectOne("sSQL.LikeProcSel", bVO);
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
	public ComtVO comtWrite(ComtVO cmVO) {
		int cnt = sqlSession.insert("sSQL.ComtWrite", cmVO);
		long cno = sqlSession.selectOne("sSQL.ComtAppend", cmVO);
		cmVO.setC_no(cno);
		return cmVO;
	}
}
