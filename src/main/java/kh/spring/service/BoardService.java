package kh.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.BoardDAO;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO bdao;
	
	public int WriteBoardInsert(String writer, String title, String contents) {
		return bdao.WriteBoardInsert(writer, title, contents);
	}

	public int writeCmt(String writer, String contents) {
		return bdao.writeCmt(writer,contents);
	}

}
