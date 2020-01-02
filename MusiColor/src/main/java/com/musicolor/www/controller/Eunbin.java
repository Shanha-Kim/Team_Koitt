package com.musicolor.www.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.musicolor.www.dao.*;
import com.musicolor.www.services.FileService;
import com.musicolor.www.vo.*;

@Controller
public class Eunbin {
	@Autowired
	EunbinDAO eDAO;
	@Autowired
	FileDAO fDAO;
	@Autowired
	FileService fileSrvc;
	
// upload Controller
	
	@RequestMapping("/upload.mr")
	public ModelAndView upload(ModelAndView mv) {
		mv.setViewName("pages/upload");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/vocalUpdate.mr")
	public SongVO musicUpdate(ModelAndView mv, SongVO vo) {
		int cnt = eDAO.vocalUpdate(vo);
		if (cnt == 1) {
			
			System.out.println(vo.getS_vno());
			
			System.out.println(vo.getV_name());
		} else {
		}
		return vo;
	}
	
	@ResponseBody
	@RequestMapping("vocalSearch.mr")
	public List<SongVO> vocalSearch(SongVO vo) {
		List<SongVO> list = eDAO.vocalSearch(vo);
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping("musicUpdate.mr")
	public Map<String, Object> musicUpdate(HttpSession session, RedirectView rv, ModelAndView mv, SongVO vo) {
		// youtube 주소 메인부 추출
		String tmp = vo.getY_link();
		int idx = tmp.indexOf("=");
		String yLink = tmp.substring(idx + 1);
		vo.setY_link(yLink);
		
		// mno 가져오기
		int m_no = eDAO.findMno(vo.getId());
		vo.setY_mno(m_no);
		
		// 앨범 사진 업로드 (song 업로드시 앨범 사진 번호가 필요하므로 우선 업로드)
		fileSrvc.setDAO(fDAO);
		long a_no = fileSrvc.singleUpProc(session, vo);
		
		// 업로드된 앨범 파일 번호 vo 에 세팅
		vo.setS_ano(a_no);
		// 노래 업로드
		int scnt = eDAO.songUpdate(vo);
		
		// youtube 업로드
		int ycnt = eDAO.youtubeUpdate(vo);
		
		// 반환값 설정
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("s_title", vo.getS_title());
		map.put("s_no", vo.getS_no());
		map.put("s_vno", vo.getS_vno());
		map.put("y_no", vo.getY_no());
		map.put("s_ano", vo.getS_ano());
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("searchSong.mr")
	public List<SongVO> searchSong(SongVO vo) {
		List<SongVO> list = eDAO.searchSong(vo);
		return list;
	}
	
	@RequestMapping("boardIn.mr")
	public ModelAndView boardIn(HttpSession session, RedirectView rv, ModelAndView mv, BoardVO vo) {
		String m_id = vo.getM_id();
		int m_no = eDAO.findMno(m_id);
		vo.setB_mno(m_no);
		
		int cnt = eDAO.boardIn(vo);
		
		if(cnt == 1) {
			rv.setUrl("/www/random.mr"); // 임시 경로
		} else {
			rv.setUrl("/www/upload.mr");
		}
		mv.setView(rv);
		
		return mv;
	}
	
// random Controller
	
	@RequestMapping("/random.mr")
	public ModelAndView random(ModelAndView mv, BoardVO bVO) {
		ArrayList<BoardVO> list = (ArrayList<BoardVO>)eDAO.randomSearch();
		mv.addObject("LIST", list);
		mv.setViewName("pages/random");
		
		return mv;
	}	
	
	@RequestMapping("/randomseleced.mr")
	public ModelAndView randomSelected(ModelAndView mv, BoardVO bVO, String b_emotion) {
		ArrayList<BoardVO> list = (ArrayList<BoardVO>)eDAO.randomSelected(b_emotion);
		mv.addObject("LIST", list);
		mv.addObject("CODE", b_emotion);
		mv.setViewName("pages/random");
		
		return mv;
	}
	
// report Controller
	
	@ResponseBody
	@RequestMapping("/reportProc.mr")
	public int reportProc(ReportVO vo) {
		// mno 가져오기
		int m_no = eDAO.findMno(vo.getId());
		vo.setR_mno(m_no);
		
		int cnt = eDAO.reportProc(vo);
		return cnt;
	}
}
