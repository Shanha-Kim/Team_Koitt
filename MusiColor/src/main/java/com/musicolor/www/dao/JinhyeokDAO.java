package com.musicolor.www.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.musicolor.www.vo.SongVO;

public class JinhyeokDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	// chart DAO
	public List<SongVO> getChart() {
		List<SongVO> list = sqlSession.selectList("jSQL.getChart");
		return list;
	}

	public List<SongVO> getChartSelected(String b_emotion) {
		List<SongVO> list = sqlSession.selectList("jSQL.getChartSelected", b_emotion);
		return list;
	}
}
