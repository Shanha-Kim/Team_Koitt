package com.musicolor.www.controller;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.musicolor.www.dao.FileDAO;
import com.musicolor.www.dao.HeeyoonDAO;
import com.musicolor.www.services.FileService;
import com.musicolor.www.vo.*;

@Controller
@RequestMapping("/")
public class Heeyoon {

	@Autowired
	FileDAO fDAO;
	@Autowired
	FileService fileSrvc;
	@Autowired
	HeeyoonDAO hDAO;

	@RequestMapping("profconfig.mr") // 개인 프로필 수정 폼 보이기
	public ModelAndView configform(ModelAndView mv, HttpSession session) {
		/* session.setAttribute("SID", "kk"); */
		mv.setViewName("pages/config");
		return mv;
	}

	@RequestMapping("profilepic.mr") // 프로필 사진 수정 controller
	public ModelAndView configpic(ModelAndView mv, HttpSession session, MemberVO mVO, RedirectView rv) {
		String SID = (String) session.getAttribute("SID");
		mVO.setM_no(hDAO.mNo(SID));
		fileSrvc.setDAO(fDAO);
		fileSrvc.singleUpProc(session, mVO);
		rv.setUrl("/profconfig.mr");
		mv.setView(rv);
		return mv;
	}

	@RequestMapping("profiletext.mr") // 프로필 텍스트 수정 controller
	public ModelAndView configtext(ModelAndView mv, MemberVO mVO, RedirectView rv) {
		hDAO.profiletextconfig(mVO);
		rv.setUrl("/profconfig.mr");
		mv.setView(rv);
		return mv;
	}

	/*
	 * @RequestMapping("profile.mr") //개인 프로필 폼 controller public ModelAndView
	 * profile(ModelAndView mv) {
	 * 
	 * mv.setViewName("pages/profile"); return mv; }
	 */
	
	@ResponseBody
	@RequestMapping("profilelist.mr")// 개인 프로필 리스트 controller
	public ModelAndView profilelist(ModelAndView mv, HttpSession session, String m_id ) {

		/* session.setAttribute("SID", "lbrade0"); lbrade0 */

		
		String SID = (String) session.getAttribute("SID");
		String nyck = "";
		if (m_id.equals(SID)) {
		
			
		}else {
			
			MemberVO mVO= new MemberVO(); 
			
			SID=m_id;
			
			mVO.setM_id(SID);
			mVO.setM_name(m_id);
			 
				
			nyck = ""+hDAO.nyck(mVO);
			
		}
		
		
		mv.addObject("NYCK",nyck);
		System.out.println(nyck);
		
		mv.addObject("ID", SID);	
		List<BoardVO> list = hDAO.profileList(SID);
		mv.addObject("LIST", list);

		// 프로필 로고 사진
		FileVO fVO = hDAO.proflogo(SID);
		mv.addObject("VO", fVO);

		// 프로필 자기소개글
		MemberVO mVO = hDAO.profintro(SID);
		mv.addObject("IVO", mVO);

		// 프로필 계정 비활성화 여부
		String str = SID;
		String isshow = hDAO.proisshow(str);
		mv.addObject("ISSHOW", isshow);

		// 프로필 게시글 카운트
		int cnt = hDAO.profilecont(SID);
		mv.addObject("CNT", cnt);
		mv.setViewName("pages/profile");
		// 팔로워 수 카운트
		int x = hDAO.followcnt(SID);
		mv.addObject("CNT1", x);
		// 팔로잉 수 타운트
		int y = hDAO.followingcnt(SID);
		mv.addObject("CNT2", y);

		// 팔로워 버튼 눌렀을 때 팔로워 리스트 뽑아오기
		List<MemberVO> list1 = hDAO.follwer(SID);
		mv.addObject("LIST1", list1);
		// 팔로우 버튼 눌렀을 때 팔로잉 리스트 뽑아오기
		List<MemberVO> list2 = hDAO.following(SID);
		mv.addObject("LIST2", list2);

		return mv;

	}

	// 프로필 계정 비활성화 controller
	@RequestMapping("lock.mr")
	public ModelAndView lock(ModelAndView mv, HttpSession session, RedirectView rv) {
		String str = (String) session.getAttribute("SID");
		MemberVO mVO = new MemberVO();
		mVO.setM_id(str);
		int cnt = hDAO.prolock(mVO);
		mv.addObject("LOCK", cnt);
		rv.setUrl("/profilelist.mr");
		mv.setView(rv);
		return mv;
	}

	@RequestMapping("unlock.mr") // 프로필 계정 다시 활성화 표시
	public ModelAndView unlock(ModelAndView mv, HttpSession session, RedirectView rv) {
		String str = (String) session.getAttribute("SID");
		MemberVO mVO = new MemberVO();
		mVO.setM_id(str);
		int cnt = hDAO.prounlock(mVO);
		mv.addObject("UNLOCK", cnt);
		rv.setUrl("/profilelist.mr");
		mv.setView(rv);

		return mv;
	}

	// 팔로워 Y or N 체크 컨트롤러

	@RequestMapping("followercheck.mr")
	@ResponseBody
	public int followcheck(MemberVO mVO) {
		hDAO.followcheck(mVO);
		return 0;
	}

	// 좋아요한 게시물 보이기
	@RequestMapping("likedlist.mr")
	public ModelAndView likedlist(ModelAndView mv, HttpSession session) {
		session.setAttribute("SID", "kk");
		String SID = (String) session.getAttribute("SID");
		List<BoardVO> list3 = hDAO.likelist(SID);
		mv.addObject("LIKELIST", list3);
		mv.setViewName("pages/liked");
		return mv;
	}

	//상대방 팔로워 취소 controller
	
	@RequestMapping("otheresfollowcansle.mr")
	public int otherscansle( MemberVO mVO ,HttpSession session) {
		String SID = (String)session.getAttribute("SID");
		hDAO.otherscansle(mVO);
		
		return 0;
	}
	
}
