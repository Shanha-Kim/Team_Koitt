package com.musicolor.www.services;

import java.io.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;

import com.musicolor.www.dao.*;
import com.musicolor.www.util.FileUtil;
import com.musicolor.www.vo.BoardVO;
import com.musicolor.www.vo.FileVO;
import com.musicolor.www.vo.MemberVO;

//경로수정 필요합니다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//경로수정 필요합니다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//경로수정 필요합니다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

public class FileService {
	
	//프로필사진
	public void singleUpProc(HttpSession session, MemberVO vo) {
		String saveName = "";
		
		long len = 0;
		
		String spath =  session.getServletContext().getRealPath("resources/upload");
		String rePath = spath.substring(0, spath.indexOf("\\.metadata"));
		rePath = rePath + "\\Team_koitt\\MusiColor\\src\\main\\webapp\\resources\\upload";
		
		String oriName = "";
		try {
			oriName = vo.getsFile().getOriginalFilename();
		} catch(Exception e) {
			return;
		}
		
		saveName = FileUtil.rename(spath, oriName);
		
		try {
			File file = new File(spath, saveName);
			vo.getsFile().transferTo(file);
			
			len = vo.getsFile().getSize();
			
			// 작업경로에 복사
			file = new File(rePath, saveName);
			vo.getsFile().transferTo(file);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		FileVO fVO = new FileVO();
		fVO.setNo(vo.getM_no());
		fVO.setOname(oriName);
		fVO.setSname(saveName);
		
		fVO.setDir(rePath);
		
		fVO.setLen(len);
		
		FileDAO fDAO = new FileDAO();
		
		fDAO.profilePicture(fVO);
	}
	
	
	//앨범사진
	
	public void singleUpProc(HttpSession session, BoardVO vo) {
		String saveName = "";
		
		long len = 0;
		
		String spath =  session.getServletContext().getRealPath("resources/upload");
		String rePath = spath.substring(0, spath.indexOf("\\source\\.metadata"));
		rePath = rePath + "\\git\\springsimple\\simple\\src\\main\\webapp\\resources\\upload\\";
		
		String oriName = "";
		try {
			oriName = vo.getsFile().getOriginalFilename();
		} catch(Exception e) {
			return;
		}
		
		saveName = FileUtil.rename(spath, oriName);
		
		try {
			File file = new File(spath, saveName);
			vo.getsFile().transferTo(file);
			
			len = vo.getsFile().getSize();
			
			// 작업경로에 복사
			file = new File(rePath, saveName);
			vo.getsFile().transferTo(file);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		FileVO fVO = new FileVO();
		fVO.setNo(vo.getB_no());
		fVO.setOname(oriName);
		fVO.setSname(saveName);
		fVO.setDir(rePath);
		fVO.setLen(len);
		FileDAO fDAO = new FileDAO();
		fDAO.albumPicture(fVO);
	}

	

	
}