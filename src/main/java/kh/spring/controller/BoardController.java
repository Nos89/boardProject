package kh.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.BoardDTO;
import kh.spring.service.BoardService;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService bservice;
	
	@RequestMapping("/boardDetail")
	public String boardDetail(Model model,HttpServletRequest req){
		int seq = Integer.parseInt(req.getParameter("seq"));
		String loginId = (String)req.getSession().getAttribute("loginID");
		BoardDTO dto = bservice.viewBoardDetail(seq);
		
		model.addAttribute("dto", dto);
		model.addAttribute("loginId", loginId);
		return "/board/boardDetail";
	}
}
