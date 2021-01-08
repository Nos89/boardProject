package kh.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
}
