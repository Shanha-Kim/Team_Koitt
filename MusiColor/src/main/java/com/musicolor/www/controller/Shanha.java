package com.musicolor.www.controller;

import java.util.ArrayList;

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
	public ModelAndView searchBefore(ModelAndView mv) {
		ArrayList<FileVO> list = (ArrayList<FileVO>)sDAO.showBefore();
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
	
	
	@RequestMapping("/searchAfter.mr")
	public ModelAndView searchAfter(ModelAndView mv, BoardVO bVO) {
		ArrayList<FileVO> list = (ArrayList<FileVO>)sDAO.searchAfter(bVO);
		mv.addObject("LIST", list);
		mv.setViewName("pages/search");
		
		return mv;
	}
	
	@RequestMapping("/preView.mr")
	@ResponseBody
	public java.util.List<FileVO> preView(BoardVO bVO) {
		java.util.List<FileVO> plist = sDAO.preView(bVO);
		return plist;
	}
}
	
