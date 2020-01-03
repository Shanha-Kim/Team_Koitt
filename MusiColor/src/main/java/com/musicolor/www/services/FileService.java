package com.musicolor.www.services;

import java.io.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;

import com.musicolor.www.dao.*;
import com.musicolor.www.util.FileUtil;
import com.musicolor.www.vo.BoardVO;
import com.musicolor.www.vo.FileVO;
import com.musicolor.www.vo.MemberVO;
import com.musicolor.www.vo.SongVO;

//경로수정 필요합니다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//경로수정 필요합니다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//경로수정 필요합니다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

public class FileService {
	FileDAO fDAO;

	public void setDAO(FileDAO fDAO) {
		this.fDAO = fDAO;
	};

	// 프로필사진
	public void singleUpProc(HttpSession session, MemberVO vo) {
		String saveName = "";

		long len = 0;

		String spath = session.getServletContext().getRealPath("resources/upload");
		String rePath = spath.substring(0, spath.indexOf("\\.metadata"));
		rePath = rePath + "\\Team_koitt\\MusiColor\\src\\main\\webapp\\resources\\upload";

		String oriName = "";
		try {
			oriName = vo.getsFile().getOriginalFilename();
		} catch (Exception e) {
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

		} catch (Exception e) {
			e.printStackTrace();
		}
		FileVO fVO = new FileVO();
		fVO.setNo(vo.getM_no());
		fVO.setOname(oriName);
		fVO.setSname(saveName);

		fVO.setDir(rePath);

		fVO.setLen(len);
		fDAO.profilePicture(fVO);
	}

	// 앨범사진

	public long singleUpProc(HttpSession session, SongVO vo) {

		String saveName = "";

		long len = 0;

		String spath = session.getServletContext().getRealPath("resources/album");
		System.out.println("spath: " + spath);
//		String rePath = spath.substring(0, spath.indexOf("\\source\\.metadata"));
		String rePath = "/Users/mac297/git/Team_koitt/MusiColor/src/main/webapp/resources/album";
		System.out.println("rePath : " + rePath);

		String oriName = "";
		try {
			oriName = vo.getsFile().getOriginalFilename();
		} catch (Exception e) {
			e.printStackTrace();
		}

		saveName = FileUtil.rename(spath, oriName);

		try {
			File file = new File(spath, saveName);
			vo.getsFile().transferTo(file);

			len = vo.getsFile().getSize();

			// 작업경로에 복사
			file = new File(rePath, saveName);
			vo.getsFile().transferTo(file);

		} catch (Exception e) {
			e.printStackTrace();
		}
		FileVO fVO = new FileVO();

		// 재업로드 하는 경우 기존 업로드 파일 삭제
		if (vo.getCheck() == 1) {
			String smove = spath + vo.getA_sname();
			String remove = rePath + vo.getA_sname();

			System.out.println("smove : " + smove);
			System.out.println("remove : " + remove);
			File sfile = new File(smove);
			File refile = new File(remove);

			if (refile.exists() == true) {
				refile.delete();
				System.out.println("refile 삭제 완료");
			} else if (sfile.exists() == true) {
				sfile.delete();
				System.out.println("sfile 삭제 완료");
			}

			fVO.setNo(vo.getS_ano());
			fVO.setCheck(vo.getCheck());

			System.out.println("no : " + fVO.getNo());
			System.out.println("check : " + fVO.getCheck());
		}
		fVO.setOname(oriName);
		fVO.setSname(saveName);

		rePath = "/resources/album";

		fVO.setDir(rePath);
		fVO.setLen(len);
		fDAO.albumPicture(fVO);

		return fVO.getNo();
	}

}