package kh.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.BoardDAO;
import kh.spring.dto.CommentDTO;

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

	public List<CommentDTO> cmtList(int board_seq) {
		return bdao.cmtList(board_seq);
	}

}
