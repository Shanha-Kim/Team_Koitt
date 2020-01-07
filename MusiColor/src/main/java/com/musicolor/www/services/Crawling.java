package com.musicolor.www.services;

import java.io.IOException;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class Crawling {
	public List<String> songlist;
	public List<String> vocallist;
	
	public Crawling() {
		try {
			//웹에서 내용을 가져온다.
			Document doc = Jsoup.connect("https://www.billboard.com/charts/hot-100/").get();
			
			//내용 중에서 원하는 부분을 가져온다.
			Elements content_song = doc.select(".chart-element__information__song");
			Elements content_vocal = doc.select(".chart-element__information__artist");
			//원하는 부분은 Elements형태로 되어 있으므로 이를 String 형태로 바꾸어 준다.
			//##################여기는 음악제목################
			songlist = content_song.eachText();
//			for(String x : songlist) {
//				System.out.println(x);
//			}
			//##################여기는 가수이름################
			vocallist = content_vocal.eachText();
//			for(String x : vocallist) {
//				System.out.println(x);
//			}

		} catch (IOException e) { //Jsoup의 connect 부분에서 IOException 오류가 날 수 있으므로 사용한다.   
			e.printStackTrace();
		}
	}
}
