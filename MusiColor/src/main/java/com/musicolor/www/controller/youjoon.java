package com.musicolor.www.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
//	@RequestMapping("ban.mr")
//	public ModelAndView ban(ModelAndView mv) {
//		
//		mv.setViewName("pages/ban");
//		
//		return mv;
//	}
	
	@RequestMapping("loginProc.mr")
	public ModelAndView loginProc(HttpSession session, 
									RedirectView rv, 
									ModelAndView mv, 
									MemberVO vo) {
		int cnt = mDAO.loginProc(vo);
		int msg;
		int ban = mDAO.loginBan(vo);
		if(cnt == 1 && ban < 3) {
		// 이 경우는 아이디와 비밀번호가 일치하는 회원이 한 명 있다는 이야기이므로
		// 로그인 처리를 해주면 되는데
		// 로그인 처리는 세션에 아이디를 입력해주기로 하자.
		session.setAttribute("SID", vo.getM_id());
		session.setAttribute("isFail", "");
		rv.setUrl("/feed.mr");
		mv.setView(rv);
		} 
		else if(cnt == 1 && ban >= 3){
			// 신고 누적 3회 이상 회원 로그인 불가
			session.setAttribute("isBan", "ban");
			msg = 1;
			rv.setUrl("/login.mr");
			mv.setView(rv); 
		}
		else {
		// 이 경우는 로그인에 실패한 경우이므로 다시 로그인 페이지로 이동한다.
		
		session.setAttribute("isFail", "fail");	// 로그인 실패를 알려주기 위한 세션(alert 창 띄워준 후 바로 "")
		msg = 1;
		rv.setUrl("/login.mr");
		mv.setView(rv); 
		}
		
		return mv;
	}
	  
	@RequestMapping("logout.mr")
	public ModelAndView logout(ModelAndView mv,
								RedirectView rv,
								HttpSession session) {
		session.setAttribute("SID", "");
		rv.setUrl("/bfMain.mr");
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
		long pno = mDAO.insertprofile();
		mVO.setM_pno(pno);
		int cnt = mDAO.insertMemb(mVO);
		
		if(cnt != 1) {
			rv.setUrl("/join.mr");
		} else {
			rv.setUrl("/joinSuccess.mr");
		}
		mv.setView(rv);
		return mv;
	}
	@RequestMapping("/joinSuccess.mr")
	public ModelAndView joinSuccess(ModelAndView mv) {
		
		mv.setViewName("pages/joinSuccess");	
		
		return mv; 
	}
	
	// 아이디 체크
	@RequestMapping(value="idCheck.mr")
	@ResponseBody
	public int idCheck(@RequestParam String m_id) {
		int cnt = 0;
		cnt = mDAO.idCheck(m_id);
		
		return cnt;
	}
	
	@RequestMapping("/findId.mr")
	public ModelAndView findId(ModelAndView mv) {
		
		mv.setViewName("pages/findId");
		
		return mv;
	}
	
	@RequestMapping("/findIdProc.mr")
	public ModelAndView findIdProc(HttpSession session,
									ModelAndView mv,
									RedirectView rv,
									MemberVO mVO) {
		
		MemberVO fId = mDAO.findIdProc(mVO);
		
		if(fId != null) {

			// 입력 사항과 일치하는 회원이 있는 경우
			
			session.setAttribute("FID", fId.getM_id());
			rv.setUrl("/findId.mr");
			mv.setView(rv);
		} else {
			
			session.setAttribute("findFail", "fail");
			rv.setUrl("/findId.mr");
			mv.setView(rv);			
		}
		
		return mv;
	}
	
}
