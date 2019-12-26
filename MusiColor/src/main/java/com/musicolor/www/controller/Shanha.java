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
		mv.setViewName("pages/searchbefore");
		
		return mv;
	}
	
	
	@RequestMapping("/searchAfter.mr")
	@ResponseBody
	public BoardVO searchAfter(ModelAndView mv, BoardVO bVO) {
		BoardVO vo = sDAO.searchAfter(bVO);
		return vo;
	}
}
	
