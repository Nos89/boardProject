package kh.spring.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.BoardDTO;

@Component
public class BoardDAO {
	
	@Autowired
	private SqlSession db;

	
	public List<BoardDTO> listByCpage(Map<String, Integer> param) throws Exception{
		return db.selectList("Board.listByCpage", param);
	}

	public List<BoardDTO> listBoard() throws Exception {
		return db.selectList("Board.listBoard");
	}
}
