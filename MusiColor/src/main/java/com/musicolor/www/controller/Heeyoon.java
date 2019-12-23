package com.musicolor.www.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.musicolor.www.dao.FileDAO;
import com.musicolor.www.dao.HeeyoonDAO;
import com.musicolor.www.services.FileService;
import com.musicolor.www.vo.FileVO;
import com.musicolor.www.vo.MemberVO;

@Controller
@RequestMapping("/musiccolor/")
public class Heeyoon {

	@Autowired
	FileDAO fDAO;
	@Autowired
	FileService fileSrvc;
	@Autowired
	HeeyoonDAO hDAO;
	
	
	@RequestMapping("profconfig.mr") // 개인 프로필 수정 폼 보이기 
	public ModelAndView configform(ModelAndView mv, HttpSession session) {
		session.setAttribute("SID", "kk");
		mv.setViewName("pages/config");
		return mv;		
	}
	
	@RequestMapping("profilepic.mr") //프로필 사진 수정 controller
	public ModelAndView configpic(ModelAndView mv, HttpSession session, MemberVO mVO, RedirectView rv) {
		fileSrvc.singleUpProc(session, mVO); 
		rv.setUrl("/www/musiccolor/profconfig.mr");
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("profiletext.mr") //프로필 텍스트 수정 controller
	public ModelAndView configtext(ModelAndView mv, MemberVO mVO, RedirectView rv ) {
		hDAO.profiletextconfig(mVO);
		
		rv.setUrl("/www/musiccolor/profconfig.mr");
		mv.setView(rv);
		return mv;
	}
	
	@RequestMapping("profile.mr") //개인 프로필 폼 controller
		public ModelAndView profile(ModelAndView mv) {
			
		mv.setViewName("pages/profile");
		return mv;
		}
	
	  @RequestMapping("profilelist.mr")//개인 프로필 리스트 controller
	  public ModelAndView profilelist (ModelAndView mv, HttpSession session) {
		  List<FileVO> list = hDAO.profileList();
		  session.setAttribute("SID", "kk");
		  mv.addObject("LIST",list);
		  mv.setViewName("pages/profile");
		  
		  return mv;
	  
	  }
	  
	  
	 }
	