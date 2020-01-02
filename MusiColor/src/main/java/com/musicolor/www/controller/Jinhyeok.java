package com.musicolor.www.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.musicolor.www.dao.*;
import com.musicolor.www.vo.*;

@Controller
public class Jinhyeok {
	
	@Autowired
	JinhyeokDAO jDAO;
	
	@RequestMapping("/bfMain.mr")
	public ModelAndView bfMain(ModelAndView mv) {
		mv.setViewName("pages/bfMain");
		return mv;
	}

	// chart Controller

	@RequestMapping("/detailChart.mr")
	public ModelAndView detailChart(ModelAndView mv) {
		ArrayList<SongVO> list = (ArrayList<SongVO>) jDAO.getChart();
		mv.addObject("LIST", list);
		mv.setViewName("pages/detailChart");

		return mv;
	}

	@RequestMapping("/detailChartSeleced.mr")
	public ModelAndView detailChartSelected(ModelAndView mv, String b_emotion) {
		ArrayList<SongVO> list = (ArrayList<SongVO>) jDAO.getChartSelected(b_emotion);
		mv.addObject("LIST", list);
		mv.addObject("CODE", b_emotion);
		mv.setViewName("pages/detailChart");

		return mv;
	}
}
