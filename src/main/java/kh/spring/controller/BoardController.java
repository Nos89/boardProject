package kh.spring.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.BoardDTO;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.BoardDTO;
import kh.spring.service.BoardService;


@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private BoardService bservice;
	
	@RequestMapping("showBoard.brd")
	public String showBoard(int cpage) throws Exception {
		int amount = bservice.listBoard().size();
		List<BoardDTO> list = bservice.listByCpage(cpage);
		String navi = bservice.getNavi(cpage, amount);
		session.setAttribute("cpage", cpage);
		session.setAttribute("list", list);
		session.setAttribute("navi", navi);
		return "board/board";
	}
	// 글쓰기 창으로 이동
	@RequestMapping("toWrite")
	public String toBoardWrite() {
		return "/board/boardWrite";
	}

	// 글쓰기 성공여부
	@RequestMapping("write")
	public String wirteBoard(Model model, String title, String contents) {
		// String writer = (String) session.getAttribute("loginID");
		String writer = "tempWriter";

		try {
			int result = bservice.WriteBoardInsert(writer, title, contents);
			System.out.println(result);
			// model.addAttribute("result", result);
			return "home";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 댓글 창으로 이동
	@RequestMapping("toCommet")
	public String toCommet() {
		return "/board/cmtWrite";
	}
	
	//댓글 달기 //loginID, board_seq(외래키로??) 가져와야 됨 
	@RequestMapping("writeCmt")
	public String writeCmt( Model model,String contents) {
		// String writer = (String) session.getAttribute("loginID");
		
		String writer = "tempWriter"; //(String) session.getAttribute("loginID");

		try {
			int result = bservice.writeCmt(writer, contents);
			System.out.println(result);
			// model.addAttribute("result", result);
			return "home";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	//글 상세보기
	@RequestMapping("/boardDetail")
	public String boardDetail(Model model,HttpServletRequest req){
		int seq = Integer.parseInt(req.getParameter("seq"));
		String loginId = (String)req.getSession().getAttribute("loginID");
		BoardDTO dto = bservice.viewBoardDetail(seq);
		
		model.addAttribute("dto", dto);
		model.addAttribute("loginId", loginId);
		return "/board/boardDetail";
	}
	
	//글 수 정하기
	@RequestMapping("/modifyBoard")
	public String modifyBoard(Model model, HttpServletRequest req) {
		
		
		return "/board/modifyView";
	}

}
