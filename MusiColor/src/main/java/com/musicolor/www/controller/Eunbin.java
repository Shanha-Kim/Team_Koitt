package com.musicolor.www.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.musicolor.www.dao.EunbinDAO;

@Controller
public class Eunbin {
	@Autowired
	EunbinDAO eDAO;
	
	@RequestMapping("/random.mr")
	public ModelAndView random(ModelAndView mv) {
		mv.setViewName("pages/random");
		return mv;
	}
	
	@RequestMapping("/upload.mr")
	public ModelAndView upload(ModelAndView mv) {
		mv.setViewName("pages/upload");
		return mv;
	}
}
