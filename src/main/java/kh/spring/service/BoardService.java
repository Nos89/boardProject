package kh.spring.service;

import java.util.List;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.BoardDAO;
import kh.spring.dto.CommentDTO;
import kh.spring.dto.BoardDTO;
import kh.spring.statics.Statics;

import kh.spring.dto.BoardDTO;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO bdao;
	
	public BoardDTO viewBoardDetail(int seq){
		
		return bdao.viewBoardDetail(seq);
	}
	
	public int modifyBoard(BoardDTO dto) {
		return bdao.modifyBoard(dto);
		
	}
	
	public int deleteBoard(int seq) {
		return bdao.deleteBoard(seq);
	}

	public int WriteBoardInsert(String writer, String title, String contents) {
		return bdao.WriteBoardInsert(writer, title, contents);
	}

	public int writeCmt(int board_seq,String writer, String contents) {
		return bdao.writeCmt(board_seq,writer,contents);
	}


	public List<CommentDTO> cmtList(int board_seq) {
		return bdao.cmtList(board_seq);
	}


	public List<BoardDTO> listBoard() throws Exception {
		return bdao.listBoard();
	}

	public List<BoardDTO> listByCpage(int cpage) throws Exception{

		int startRowNum = (cpage-1) * Statics.recordCountPerPage + 1;
		int endRowNum = startRowNum + Statics.recordCountPerPage - 1;

		Map<String, Integer> param = new HashMap<>();
		param.put("startRowNum", startRowNum);
		param.put("endRowNum", endRowNum);
		return bdao.listByCpage(param);
	}
	
	public String getNavi(int currentPage, int amount) throws Exception {

		int recordTotalCount = amount;

		int pageTotalCount;
		if(recordTotalCount%Statics.recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount/Statics.recordCountPerPage + 1;
		}else {
			pageTotalCount = recordTotalCount/Statics.recordCountPerPage;
		}

		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}
		int startNavi = (currentPage-1) / Statics.naviCountPerPage * 10 + 1;
		int endNavi = startNavi + Statics.naviCountPerPage - 1;

		if(endNavi>pageTotalCount) {
			endNavi = pageTotalCount;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) needPrev = false;
		if(endNavi == pageTotalCount) needNext = false;

		StringBuilder sb = new StringBuilder();
		if(needPrev) {
			sb.append("<a class='nav_item2' href='/board/showBoard.brd?cpage="+(startNavi-1)+"'>< </a>");
		}
		for(int i = startNavi; i<=endNavi; i++) {
			sb.append("<a class='nav_item' href='/board/showBoard.brd?cpage="+i+"'>"+ i + " </a> ");
		}

		if(needNext) {
			sb.append("<a class='nav_item2' href='/board/showBoard.brd?cpage="+(endNavi+1)+"'> ></a>");
		}

		return sb.toString();
	}
}
