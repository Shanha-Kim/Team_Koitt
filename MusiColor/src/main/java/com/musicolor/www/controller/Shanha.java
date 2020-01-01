package com.musicolor.www.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.musicolor.www.vo.*;
import com.musicolor.www.dao.ShanhaDAO;

@Controller
public class Shanha {
	@Autowired
	ShanhaDAO sDAO;
	
	@RequestMapping("/searchBefore.mr")
	public ModelAndView searchBefore(ModelAndView mv, BoardVO bVO, HttpSession session) {
		session.setAttribute("SID", "lbrade0");
		ArrayList<BoardVO> list = (ArrayList<BoardVO>)sDAO.showBefore(bVO);
		mv.addObject("LIST", list);
		mv.setViewName("pages/search");
		
		return mv;
	}
	
	
	@RequestMapping("/showDetail.mr")
	@ResponseBody
	public BoardVO showDetail(BoardVO bVO) {
		BoardVO vo = sDAO.showDetail(bVO);
		return vo;
	}
	
	@RequestMapping("/likeProc.mr")
	@ResponseBody
	public BoardVO likeProc(BoardVO bVO) {
		BoardVO vo = sDAO.likeProc(bVO);
		return vo;
	}
	
	@RequestMapping("/searchAfter.mr")
	public ModelAndView searchAfter(ModelAndView mv, BoardVO bVO, HttpSession session) {
		session.setAttribute("key_main", bVO.getKey_main());
		session.setAttribute("key_tab", bVO.getKey_tab());
		String tabnow = bVO.getKey_tab();
		ArrayList<BoardVO> list = (ArrayList<BoardVO>)sDAO.searchAfter(bVO);
		mv.addObject("LIST", list);
		mv.addObject("tabnow", tabnow);
		mv.addObject("forscroll", "yes");
		mv.setViewName("pages/search");
		
		return mv;
	}
	@RequestMapping("/plusList.mr")
	@ResponseBody
	public ArrayList<BoardVO> plusList(BoardVO bVO, HttpSession session){
		bVO.setKey_main((String)session.getAttribute("key_main"));
		bVO.setKey_tab((String)session.getAttribute("key_tab"));
		ArrayList<BoardVO> list = (ArrayList<BoardVO>)sDAO.searchAfter(bVO);
		return list;
	}
	
	@RequestMapping("/preView.mr")
	@ResponseBody
	public java.util.List<FileVO> preView(BoardVO bVO) {
		java.util.List<FileVO> plist = sDAO.preView(bVO);
		return plist;
	}
	
	@RequestMapping("/comtWrite.mr")
	@ResponseBody
	public ArrayList<ComtVO> comtWirte(ComtVO cmVO) {
		ArrayList<ComtVO> list = (ArrayList<ComtVO>)sDAO.comtWrite(cmVO);
		return list;
	}
}
	
