package kh.spring.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BoardDAO {
	
	@Autowired
	private SqlSession db;

	public int WriteBoardInsert(String writer, String title, String contents) {
		Map<String, Object> param = new HashMap<>();
		param.put("writer",writer);
		param.put("title",title);
		param.put("contents",contents);
		
		return db.insert("Board.writeInsert", param);
	}

	public int writeCmt(String writer, String contents) {
		Map<String, Object> param = new HashMap<>();
		param.put("writer",writer);
		param.put("contents",contents);
		
		return db.insert("Board.writeCmt", param);
	}

}