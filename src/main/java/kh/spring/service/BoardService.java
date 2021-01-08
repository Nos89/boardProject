package kh.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.BoardDAO;
import kh.spring.dto.BoardDTO;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO bdao;
	
	public BoardDTO viewBoardDetail(int seq){
		
		return bdao.viewBoardDetail(seq);
	}

}
