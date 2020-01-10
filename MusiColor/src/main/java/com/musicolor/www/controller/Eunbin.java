package com.musicolor.www.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.musicolor.www.dao.*;
import com.musicolor.www.services.FileService;
import com.musicolor.www.vo.*;

@Controller
public class Eunbin {
	@Autowired
	EunbinDAO eDAO;
	@Autowired
	FileDAO fDAO;
	@Autowired
	FileService fileSrvc;
	
// upload Controller
	
	@RequestMapping("/upload.mr")
	public ModelAndView upload(ModelAndView mv) {
		mv.setViewName("pages/upload");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/searchSong.mr")
	public List<SongVO> searchSong(SongVO vo) {
		List<SongVO> list = eDAO.searchSong(vo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/reportProc.mr")
	public int reportProc(ReportVO vo) {
		// mno 가져오기
		int m_no = eDAO.findMno(vo.getId());
		vo.setR_mno(m_no);
		
		return eDAO.reportProc(vo);
	}
	
	@ResponseBody
	@RequestMapping("/vocalSearch.mr")
	public List<SongVO> vocalSearch(SongVO vo) {
		List<SongVO> list = eDAO.vocalSearch(vo);
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/vocalUpdate.mr")
	public SongVO musicUpdate(SongVO vo) {
		eDAO.vocalUpdate(vo);
		return vo;
	}
	
	@ResponseBody
	@RequestMapping("/musicUpdate.mr")
	public Map<String, Object> musicUpdate(HttpSession session, SongVO vo) {
		// youtube 주소 메인부 추출
		String tmp = vo.getY_link();
		int idx = tmp.indexOf("=");
		String yLink = tmp.substring(idx + 1);
		vo.setY_link(yLink);
		
		// mno 가져오기
		int m_no = eDAO.findMno(vo.getId());
		vo.setY_mno(m_no);
		
		// 앨범 사진 업로드 (song 업로드시 앨범 사진 번호가 필요하므로 우선 업로드)
		fileSrvc.setDAO(fDAO);
		long a_no = fileSrvc.singleUpProc(session, vo);
		
		// 업로드된 앨범 파일 번호 vo 에 세팅
		vo.setS_ano(a_no);
		
		// 노래 업로드
		int scnt = eDAO.songUpdate(vo);
		
		// youtube 업로드
		int ycnt = eDAO.youtubeUpdate(vo);
		
		// 반환값 설정
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("s_title", vo.getS_title());
		map.put("s_no", vo.getS_no());
		map.put("s_vno", vo.getS_vno());
		map.put("y_no", vo.getY_no());
		map.put("s_ano", vo.getS_ano());
		
		return map;
	}
	
	@RequestMapping("/boardIn.mr")
	public ModelAndView boardIn(HttpSession session, RedirectView rv, ModelAndView mv, BoardVO vo) {
		// 가져온 id 값 통해 mno 세팅
		String m_id = vo.getM_id();
		int m_no = eDAO.findMno(m_id);
		vo.setB_mno(m_no);
		
		// b_body 개행 처리
		String body = vo.getB_body();
		body = body.replace("\r\n","<br>");
		vo.setB_body(body);
		
		// 게시물 작성 처리
		int cnt = eDAO.boardIn(vo);
		
		if(cnt == 1) {
			rv.setUrl("/feed.mr");
		} else {
			rv.setUrl("/upload.mr");
		}
		mv.setView(rv);
		
		return mv;
	}
	
// random Controller
	
	@RequestMapping("/random.mr")
	public ModelAndView random(ModelAndView mv, BoardVO bVO, String b_emotion) {
		List<BoardVO> list = eDAO.randomSearch(b_emotion);
		mv.addObject("LIST", list);
		mv.addObject("CODE", b_emotion);
		mv.setViewName("pages/random");
		
		return mv;
	}	
	
// admin Controller
	
	@RequestMapping("/admin.mr")
	public ModelAndView admin(ModelAndView mv) {
		mv.setViewName("pages/adminMain");
		return mv;
	}
	
	@RequestMapping("/adminLogin.mr")
	public ModelAndView adminLoginForm(ModelAndView mv) {
		mv.setViewName("pages/adminLogin");
		return mv;
	}
	
	@RequestMapping("/adminLoginProc.mr")
	public ModelAndView adminLoginProc(HttpSession session, RedirectView rv, ModelAndView mv, MemberVO vo) {
		int cnt = eDAO.adminLoginProc(vo);
		
		if(cnt == 1) {
			session.setAttribute("AID", vo.getM_id());
			rv.setUrl("/admin.mr");
			mv.setView(rv);
		} else {
			rv.setUrl("/adminLogin.mr");
			mv.setView(rv); 
		}

		return mv;
	}
	
	@RequestMapping("/adminLogout.mr")
	public ModelAndView adminLogout(ModelAndView mv, RedirectView rv, HttpSession session) {
		session.setAttribute("AID", "");
		rv.setUrl("/admin.mr");
		mv.setView(rv); 
		
		return mv;
	}
	
//	admin report Controller
	
	@RequestMapping("/adminRepo.mr")
	public ModelAndView adminRepo(ModelAndView mv, String r_isokay) {
		List<ReportVO> list = eDAO.getReport(r_isokay);
		mv.addObject("LIST", list);
		mv.addObject("CODE", r_isokay);
		mv.setViewName("pages/adminRepo");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/repoDetail.mr")
	public SongVO repoDetail(String sno) {
		SongVO vo = eDAO.repoDetail(sno);
		
		String tmp = vo.getY_link();
		tmp = "https://www.youtube.com/watch?v=" + tmp;
		vo.setY_link(tmp);
		
		return vo;
	}
	
	@ResponseBody
	@RequestMapping("/repoDetailBoard.mr")
	public BoardVO repoDetailBoard(String bno) {
		return eDAO.repoDetailBoard(bno);
	}
	

	@ResponseBody
	@RequestMapping("/repoDetailComt.mr")
	public ComtVO repoDetailComt(String cno) {
		return eDAO.repoDetailComt(cno);
	}
	
	@ResponseBody
	@RequestMapping("/repoUpdate.mr")
	public int repoUpdate(HttpSession session, SongVO vo) {
		int cnt = 0;
		int bcnt = 0;
		int mcnt = 0;
		
		if (vo.getBan() == 1) {
			// 곡 최초 작성자 ban, 즉 youtube mno ban
			mcnt = eDAO.reupdateSMember(vo);
		} else {
			bcnt = 1;
			mcnt = 1;
		}
		
		// youtube 주소 메인부 추출
		String tmp = vo.getY_link();
		int idx = tmp.indexOf("=");
		String yLink = tmp.substring(idx + 1);
		vo.setY_link(yLink);
		
		// 관리자 mno 가져오기
		int m_no = eDAO.findADMno(vo.getId());
		vo.setM_no(m_no);
		
		// 앨범 수정, 파일이 포함 여부에 따라 실행 결정
		if(vo.getCheck() == 1) {
			fileSrvc.setDAO(fDAO);
			fileSrvc.singleUpProc(session, vo);
		}
		
		// 가수 수정
		int vcnt = eDAO.reupdateVocal(vo);
		
		// 노래 수정
		int scnt = eDAO.reupdateSong(vo);
		
		// youtube 수정
		int ycnt = eDAO.reupdateYoutube(vo);
		
		// report isokay 변경
		int rcnt = 0;
		// 반환값 설정
		if(scnt == 1 && ycnt == 1 && ycnt == 1) {
			// report isokay 변경
			rcnt = eDAO.reupdateReport(vo);
		}
		
		// alert 문구 처리를 위해 cnt 값 다르게 반환
		if(rcnt == 1 && vo.getBan() == 1) {
			cnt = 2;
		} else if (rcnt == 1){
			cnt = 1;
		}
		
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping("/repoUpdateBoard.mr")
	public int repoUpdateBoard(HttpSession session, BoardVO vo) {
		int cnt = 0;
		int bcnt = 0;
		int mcnt = 0;
		if (vo.getBan() == 1) {
			// board isshow 'N'
			bcnt = eDAO.reupdateBoard(vo);
			// board 작성자 ban
			mcnt = eDAO.reupdateBMember(vo);
		} else {
			bcnt = 1;
			mcnt = 1;
		}
		
		// 관리자 mno 가져오기
		System.out.println(vo.getId());
		int m_no = eDAO.findADMno(vo.getId());
		vo.setM_no(m_no);
		
		// report isokay 변경
		int rcnt = 0;
		// 반환값 설정
		if(bcnt == 1 && mcnt == 1) {
			// report isokay 변경
			rcnt = eDAO.reupdateReport(vo);
		}
		
		if(rcnt == 1 && vo.getBan() == 1) {
			cnt = 2;
		} else if (rcnt == 1){
			cnt = 1;
		}
		
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping("/repoUpdateComt.mr")
	public int repoUpdateBoard(HttpSession session, ComtVO vo) {
		int cnt = 0;
		int cmcnt = 0;
		int mcnt = 0;
		if (vo.getBan() == 1) {
			// comt isshow 'N'
			cmcnt = eDAO.reupdateComt(vo);
			// comt 작성자 ban
			mcnt = eDAO.reupdateCMember(vo);
		} else {
			cmcnt = 1;
			mcnt = 1;
		}
		
		// 관리자 mno 가져오기
		System.out.println(vo.getId());
		int m_no = eDAO.findADMno(vo.getId());
		vo.setM_no(m_no);
		
		// report isokay 변경
		int rcnt = 0;
		// 반환값 설정
		if(cmcnt == 1 && mcnt == 1) {
			// report isokay 변경
			rcnt = eDAO.reupdateReport(vo);
		}
		
		if(rcnt == 1 && vo.getBan() == 1) {
			cnt = 2;
		} else if (rcnt == 1){
			cnt = 1;
		}
		
		return cnt;
	}

//	admin chart Controller
	
	// 날짜 생성 함수
	public List<String> getmonths(){
		// 현재 년, 월 생성
		Calendar cal = Calendar.getInstance();
		int year = cal.get ( cal.YEAR );
		int month = cal.get ( cal.MONTH ) + 1;
		String date = "";
		
		List<String> monthNumber = new ArrayList<String>();
		
		for(int i = 0; i < 12; i++) {
			date = year + "-" + String.format("%02d", month);
			monthNumber.add(date);
			
			month--;
			
			if (month == 0) {
				year = year - 1;
				month = 12;
			}
		}
		
		return monthNumber;
	}
	
	// 차트 내용 생성 함수
	public List getPosts(List<ChartVO> clist, List<String> monthNumber) {
		// board 갯수
		List blist = new ArrayList();
		// clist 를 위한 j
		int j = 0;
		
		for(int i = 0; i < 12; i++) {
				if(j < clist.size()) {
					if(monthNumber.get(i).equals(clist.get(j).getMonth())) {
						blist.add(clist.get(j).getCnt());
						j++;
					} else {
						blist.add(0);
					}
				} else {
					blist.add(0);
				}
			} 
		
		return blist;
	}
	
	@RequestMapping("/adminChart.mr")
	public ModelAndView adminChart(ModelAndView mv) {
		// today's member, total member, today's post, total post
		Map<String, Object> count = new HashMap<String, Object>();
		count.put("todayMember", eDAO.todayMember());
		count.put("totalMember", eDAO.totalMember());
		count.put("todayBoard", eDAO.todayBoard());
		count.put("totalBoard", eDAO.totalBoard());
		
		// vocalChart
		List<SongVO> vocal = eDAO.vocalChart();
				
		mv.addObject("COUNT", count);
		mv.addObject("VOCAL", vocal);
		
		// 12달 생성
		List<String> monthNumber = getmonths();
		
		// 모든 게시물
		List<ChartVO> alist = eDAO.boardChart();
		List blist = getPosts(alist, monthNumber);
		
		// 사랑 게시물
		List<ChartVO> alist1 = eDAO.boardChartSelected(1);
		List blist1 = getPosts(alist1, monthNumber);
		
		//  기쁨 게시물
		List<ChartVO> alist2 = eDAO.boardChartSelected(2);
		List blist2 = getPosts(alist2, monthNumber);
		
		//  평온 게시물
		List<ChartVO> alist3 = eDAO.boardChartSelected(3);
		List blist3 = getPosts(alist3, monthNumber);
		
		//  슬픔 게시물
		List<ChartVO> alist4 = eDAO.boardChartSelected(4);
		List blist4 = getPosts(alist4, monthNumber);
		
		//  분노 게시물
		List<ChartVO> alist5 = eDAO.boardChartSelected(5);
		List blist5 = getPosts(alist5, monthNumber);
		
		mv.addObject("CHART", blist);
		mv.addObject("CHART1", blist1);
		mv.addObject("CHART2", blist2);
		mv.addObject("CHART3", blist3);
		mv.addObject("CHART4", blist4);
		mv.addObject("CHART5", blist5);
		mv.addObject("NUMBER", monthNumber);
		
		mv.setViewName("pages/adminChart");
		return mv;
	}
	
//	error page
	
	@RequestMapping("/error.mr")
	public ModelAndView error(ModelAndView mv) {
		mv.setViewName("pages/error");
		return mv;
	}
	
	@RequestMapping("/404.mr")
	public ModelAndView error404(ModelAndView mv) {
		mv.setViewName("pages/404");
		return mv;
	}
	
	@RequestMapping("/500.mr")
	public ModelAndView error500(ModelAndView mv) {
		mv.setViewName("pages/500");
		return mv;
	}
}
