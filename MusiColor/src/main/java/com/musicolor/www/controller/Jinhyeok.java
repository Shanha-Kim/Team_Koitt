package com.musicolor.www.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Jinhyeok {
	@RequestMapping("/bfMain.mr")
	public ModelAndView bfMain(ModelAndView mv) {
		mv.setViewName("pages/bfMain");
		return mv;
	}
}
