package com.musicolor.www.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.musicolor.www.vo.MemberVO;

import javafx.scene.control.Alert;

import com.musicolor.www.dao.YoujoonDAO;

@Controller
@RequestMapping("/") 
public class youjoon {
	@Autowired
	YoujoonDAO mDAO;
	
	@RequestMapping("login.mr")
	public ModelAndView loginForm(ModelAndView mv) {
		
		mv.setViewName("pages/login");
		
		return mv;
	}
	
	@RequestMapping("/loginProc.mr")
	public ModelAndView loginProc(HttpSession session, 
									RedirectView rv, 
									ModelAndView mv, 
									MemberVO vo) {
		int cnt = mDAO.loginProc(vo);
		int msg;
		
		if(cnt == 1) {
		// 이 경우는 아이디와 비밀번호가 일치하는 회원이 한 명 있다는 이야기이므로
		// 로그인 처리를 해주면 되는데
		// 로그인 처리는 세션에 아이디를 입력해주기로 하자.
		session.setAttribute("SID", vo.getM_id());
		rv.setUrl("/www/tempMain.mr");
		mv.setView(rv);
		} else {
		// 이 경우는 로그인에 실패한 경우이므로 다시 로그인 페이지로 이동한다.
		System.out.println("### 로그인 실패");

		msg = 1;
		rv.setUrl("/www/login.mr");
		mv.setView(rv); 
		}

		return mv;
	}
	  
	@RequestMapping("/logout.mr")
	public ModelAndView logout(ModelAndView mv,
								RedirectView rv,
								HttpSession session) {
		System.out.println("### /logout.mr");
		session.setAttribute("SID", "");
		rv.setUrl("/www/tempMain.mr");
		mv.setView(rv); 
		
		return mv;
	}
	
	@RequestMapping("/join.mr")
	public ModelAndView joinForm(ModelAndView mv) {
		
		mv.setViewName("pages/join");
		
		return mv;
	}
	
	@RequestMapping("/joinProc.mr")
	public ModelAndView joinProc(ModelAndView mv,
									RedirectView rv, 
									HttpSession session,
									MemberVO mVO) {
		
		int cnt = mDAO.insertMemb(mVO);
		
		if(cnt != 1) {
			System.out.println("### 회원가입 실패");
			rv.setUrl("/www/join.mr");
		} else {
			System.out.println("### 회원가입 성공");
			rv.setUrl("/www/joinSuccess.mr");
		}
		mv.setView(rv);
		return mv;
	}
	@RequestMapping("/joinSuccess.mr")
	public ModelAndView joinSuccess(ModelAndView mv) {
		
		mv.setViewName("pages/joinSuccess");	
		
		return mv; 
	}
	
	// 임시 메인 페이지
	@RequestMapping("/tempMain.mr")
	public ModelAndView tempMain(ModelAndView mv) {
		
		mv.setViewName("pages/tempMain");	
		
		return mv; 
	}
}
