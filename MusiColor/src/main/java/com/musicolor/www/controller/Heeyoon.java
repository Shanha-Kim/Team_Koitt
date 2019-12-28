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
		String SID = (String)session.getAttribute("SID");
		mVO.setM_no(hDAO.mNo(SID));
		fileSrvc.setDAO(fDAO);
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
	
	/*
	 * @RequestMapping("profile.mr") //개인 프로필 폼 controller public ModelAndView
	 * profile(ModelAndView mv) {
	 * 
	 * mv.setViewName("pages/profile"); return mv; }
	 */
	
	  @RequestMapping("profilelist.mr")//개인 프로필 리스트 controller
	  public ModelAndView profilelist (ModelAndView mv, HttpSession session) {
		  session.setAttribute("SID", "kk");
		  List<FileVO> list = hDAO.profileList((String)session.getAttribute("SID"));
		  mv.addObject("LIST",list);
		  //프로필 로고 사진 	
		  FileVO fVO = hDAO.proflogo((String)session.getAttribute("SID"));
		  mv.addObject("VO",fVO);		  
		  
		  //프로필 자기소개글 
		  MemberVO mVO = hDAO.profintro((String)session.getAttribute("SID"));
		  mv.addObject("IVO",mVO);
		
		  //프로필 계정 비활성화 여부 
		  String str = (String)session.getAttribute("SID");
		  String isshow = hDAO.proisshow(str);
		  mv.addObject("ISSHOW",isshow);
		 
		  //프로필 게시글 카운트 
		   int cnt= hDAO.profilecont((String)session.getAttribute("SID"));
		   mv.addObject("CNT",cnt);
		  mv.setViewName("pages/profile");
		  return mv;
	  }
	  
	  @RequestMapping("lock.mr") //프로필 계정 비활성화 표시 
	  //프로필 계정 비활성화 controller
	  public ModelAndView lock(ModelAndView mv, HttpSession session, RedirectView rv) {
		 String str = (String)session.getAttribute("SID");
		 MemberVO mVO = new MemberVO();
		  mVO.setM_id(str);
		  int cnt = hDAO.prolock(mVO);
		  mv.addObject("LOCK", cnt);	  
		  rv.setUrl("/www/musiccolor/profilelist.mr");
		  mv.setView(rv);
		  return mv;
	  }
	  
	  @RequestMapping("unlock.mr")//프로필 계정 다시 활성화 표시
	  public ModelAndView unlock(ModelAndView mv, HttpSession session, RedirectView rv) {
		  String str = (String)session.getAttribute("SID");
		  MemberVO mVO = new MemberVO();
		  mVO.setM_id(str);
		  int cnt = hDAO.prounlock(mVO);
		  mv.addObject("UNLOCK",cnt);
		  rv.setUrl("/www/musiccolor/profilelist.mr");
		  mv.setView(rv);
		  
		  return mv;
	  }
	  
	  
	 }
	