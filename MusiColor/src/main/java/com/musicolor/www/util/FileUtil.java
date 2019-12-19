package com.musicolor.www.util;


/**
 * 이 클래스는 파일 업로드에 필요하 기능을 처리하기 위해 만든 유틸리티적 클래스이다.
 * @author 김산하
 * @since 2019.12.17
 * @version v.1.0
 * @see
 * 		변경이력
 * 			2019.12.17 - 클래스제작 - 담당자 : 김산하
 *
 */
import java.io.*;

public class FileUtil {
	public static String rename(String path, String oldName) {
		/*
			sample.jpg 라는 파일을 업로드 하려하는데
			이미 업로드된 파일의 이름이 존재한다면 
			sample_1.jpg
			라는 이름으로 변경시켜서 저장하자.
		 */
		
		int count = 0; // 동일한 파일의 경우 붙여질 번호를 기억할 변수
		String tmpName = oldName; // 현재 이름을 따로 기억해 놓는다.
		
		File file = new File(path, oldName);
		
		// 먼저 oldName으로 만들어진 파일이 있는지 체크한다.
		while(file.exists()) {
			count++;
			int len = tmpName.lastIndexOf(".");
			String tmp1 = tmpName.substring(0, len);
			oldName = tmp1 + "_" + count + tmpName.substring(len);
			
			file = new File(path, oldName);
		}
		
		return oldName;
	}
	

}