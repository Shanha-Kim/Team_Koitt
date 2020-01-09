package com.musicolor.www.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.musicolor.www.vo.*;
import com.musicolor.www.dao.JinhyeokDAO;
import com.musicolor.www.dao.ShanhaDAO;
import com.musicolor.www.services.Crawling;

@Controller
public class Shanha {
	@Autowired
	ShanhaDAO sDAO;
	@Autowired
	JinhyeokDAO jDAO;
	
	@Inject    //서비스를 호출하기 위해서 의존성을 주입
	JavaMailSender mailSender;     //메일 서비스를 사용하기 위해 의존성을 주입함.
	
	//feed페이지
	@RequestMapping("/feed.mr")
	public ModelAndView goFeed(ModelAndView mv, HttpSession session) {
		String SID = (String)session.getAttribute("SID");
		BoardVO bVO= new BoardVO();
		bVO.setM_id(SID);
		bVO.setRno(1);
		ArrayList<BoardVO> list = (ArrayList<BoardVO>)sDAO.showFeed(bVO);
		mv.addObject("LIST", list);
		mv.setViewName("pages/feed");
		
		return mv;
	}
	@RequestMapping("/plusListFeed.mr")
	@ResponseBody
	public ArrayList<BoardVO> plusListFeed(BoardVO bVO, HttpSession session){
		String SID = (String)session.getAttribute("SID");
		bVO.setM_id(SID);
		ArrayList<BoardVO> list = (ArrayList<BoardVO>)sDAO.showFeed(bVO);
		return list;
	}
	
	//댓글기능
	@RequestMapping("/comtWrite.mr")
	@ResponseBody
	public ArrayList<ComtVO> comtWirte(ComtVO cmVO) {
		ArrayList<ComtVO> list = (ArrayList<ComtVO>)sDAO.comtWrite(cmVO);
		return list;
	}
	//좋아요기능
	@RequestMapping("/likeProc.mr")
	@ResponseBody
	public BoardVO likeProc(BoardVO bVO) {
		BoardVO vo = sDAO.likeProc(bVO);
		return vo;
	}
	
	//신고, 삭제기능
	@RequestMapping("/delComt.mr")
	@ResponseBody
	public int delcomt(ComtVO cmVO) {
		int cnt = sDAO.delComt(cmVO);
		return cnt;
	}
	@RequestMapping("/decComt.mr")
	@ResponseBody
	public int decComt(ComtVO cmVO) {
		int cnt = sDAO.decComt(cmVO);
		return cnt;
	}
	@RequestMapping("/delPost.mr")
	@ResponseBody
	public int delPost(BoardVO bVO) {
		int cnt = sDAO.delPost(bVO);
		return cnt;
	}
	@RequestMapping("/decPost.mr")
	@ResponseBody
	public int decPost(BoardVO bVO) {
		int cnt = sDAO.decPost(bVO);
		return cnt;
	}
	
	//검색페이지
	@RequestMapping("/searchBefore.mr")
	public ModelAndView searchBefore(ModelAndView mv, BoardVO bVO, HttpSession session) {
		ArrayList<BoardVO> list = (ArrayList<BoardVO>)sDAO.showBefore(bVO);
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
	public ModelAndView searchAfter(ModelAndView mv, BoardVO bVO, HttpSession session) {
		session.setAttribute("key_main", bVO.getKey_main());
		session.setAttribute("key_tab", bVO.getKey_tab());
		String tabnow = bVO.getKey_tab();
		ArrayList<BoardVO> list = (ArrayList<BoardVO>)sDAO.searchAfter(bVO);
		mv.addObject("LIST", list);
		mv.addObject("tabnow", tabnow);
		mv.addObject("forscroll", "yes");
		mv.setViewName("pages/search");
		
		return mv;
	}
	@RequestMapping("/plusList.mr")
	@ResponseBody
	public ArrayList<BoardVO> plusList(BoardVO bVO, HttpSession session){
		bVO.setKey_main((String)session.getAttribute("key_main"));
		bVO.setKey_tab((String)session.getAttribute("key_tab"));
		ArrayList<BoardVO> list = (ArrayList<BoardVO>)sDAO.searchAfter(bVO);
		return list;
	}
	@RequestMapping("/preView.mr")
	@ResponseBody
	public java.util.List<FileVO> preView(BoardVO bVO) {
		java.util.List<FileVO> plist = sDAO.preView(bVO);
		return plist;
	}
	
	//이메일인증
	@RequestMapping("/mailauth.mr")
	@ResponseBody
	public int mailcheck(String mymail) {
		Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "musicolor.proj@gmail.com";
        String tomail = mymail; // 받는 사람 이메일
        String title = "MusiColor 회원가입 인증 이메일 입니다."; // 제목
        String content =
	        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
	        System.getProperty("line.separator")+
	        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
	        +System.getProperty("line.separator")+
	        System.getProperty("line.separator")+
	        " 인증번호는 " +dice+ " 입니다. "
	        +System.getProperty("line.separator")+
	        System.getProperty("line.separator")+
	        "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
        
        try {
			MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
        } catch (Exception e) {
        }
        
		return dice;
	}
	
	@RequestMapping("/findpw.mr")
	public ModelAndView findPw(ModelAndView mv, String mymail, String id, RedirectView rv) {
		MemberVO vo = new MemberVO();
		vo.setM_email(mymail);
		vo.setM_id(id);
        String pw = sDAO.findPW(vo);
        
        String setfrom = "musicolor.proj@gmail.com";
        String tomail = mymail; // 받는 사람 이메일
        String title = "MusiColor 비밀번호 찾기 이메일 입니다."; // 제목
        String content =
	        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
	        System.getProperty("line.separator")+
	        "안녕하세요  "+id+" 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
	        +System.getProperty("line.separator")+
	        System.getProperty("line.separator")+
	        " 회원님의 비밀번호는 " +pw+ " 입니다. "
	        +System.getProperty("line.separator");
        
        try {
			MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
        } catch (Exception e) {
        }
        rv.setUrl("/findpwafter.mr");
        mv.setView(rv);
        
		return mv;
	}
	
	@RequestMapping("/findpwbefore.mr")
	public ModelAndView gopwbefore(ModelAndView mv) {
		mv.setViewName("pages/findpw");
		return mv;
	}
	@RequestMapping("/findpwafter.mr")
	public ModelAndView gopwafter(ModelAndView mv) {
		mv.setViewName("pages/findpwafter");
		return mv;
	}
	
}
	
