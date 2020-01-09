package com.musicolor.www.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.musicolor.www.services.*;

import com.musicolor.www.dao.*;

import com.musicolor.www.vo.*;

@Controller
public class Jinhyeok {
	
	@Autowired
	JinhyeokDAO jDAO;


	@RequestMapping("/bfMain.mr")
	public ModelAndView bfMain(ModelAndView mv) {
		ArrayList<SongVO> list = (ArrayList<SongVO>) jDAO.getChart();
		mv.addObject("LIST", list);
		
		Crawling Jinhyeok = new Crawling();
		List<String> songlist = Jinhyeok.songlist;
		List<String> vocallist = Jinhyeok.vocallist;	

		
		mv.addObject("LIST2", songlist);
		mv.addObject("LIST3", vocallist);
				
		mv.setViewName("pages/bfMain");

		return mv;
	}

	
	// chart Controller
	@RequestMapping("/detailChart.mr")
	public ModelAndView detailChart(ModelAndView mv) {
		ArrayList<SongVO> list = (ArrayList<SongVO>) jDAO.getChart();
		
		//크롤링 객체
		Crawling Jinhyeok = new Crawling();
		List<String> songlist = Jinhyeok.songlist;
		List<String> vocallist = Jinhyeok.vocallist;	
		SongVO sVO = new SongVO();
		mv.addObject("LIST2", songlist);
		mv.addObject("LIST3", vocallist);
		
		//랜덤 이미지 리스트 함수 호출
		ArrayList<Integer> ran = getRandom(list.size());
		mv.addObject("RAN", ran);
		mv.addObject("LIST", list);
		mv.setViewName("pages/detailChart");
		return mv;
	}
	
	//랜덤 리스트 
	public ArrayList<Integer> getRandom(int size){
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		loop:
		for(int i = 0; i < size; i++) {
			if(i == 4) break;
			int idx = (int)(Math.random()* size);
			for(int j = 0; j < i; j++) {
				if(idx == list.get(j)) {
					i--;
					continue loop;
				}
			}
			list.add(idx);
		}
		
		return list;
	}
	


	@RequestMapping("/detailChartSeleced.mr")
	public ModelAndView detailChartSelected(ModelAndView mv, String b_emotion) {
		ArrayList<SongVO> list = (ArrayList<SongVO>) jDAO.getChartSelected(b_emotion);
		mv.addObject("LIST", list);
		mv.addObject("CODE", b_emotion);
		mv.setViewName("pages/detailChart");
		
		/* 크롤링 */
		Crawling Jinhyeok = new Crawling();
		List<String> songlist = Jinhyeok.songlist;
		List<String> vocallist = Jinhyeok.vocallist;	
		SongVO sVO = new SongVO();
		mv.addObject("LIST2", songlist);
		mv.addObject("LIST3", vocallist);

		return mv;
	}
	


	
	
}














