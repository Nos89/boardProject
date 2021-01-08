package kh.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kh.spring.dto.BoardDTO;

@Component
public class BoardDAO {
	
	@Autowired
	private SqlSession db;
	
	public BoardDTO viewBoardDetail(int seq){
		return db.selectOne("Board.viewBoardDetail",seq);
		
	}

}
