package kh.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.service.BoardService;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	HttpSession session;
	@Autowired
	private BoardService bservice;
	
		//글쓰기 창으로 이동
		@RequestMapping("toWrite")
		public String toBoardWrite(String title, String contents, Model model) {
		//	model.addAttribute("title", title);
		//	model.addAttribute("contents", contents);
			return "/board/boardWrite";
		}
		
		//글쓰기 성공여부
		@RequestMapping("write")
		public String wirteBoard(HttpServletRequest request, Model model,String title, String contents) {
			//String writer = (String) session.getAttribute("loginID");
			//System.out.println(title + " : " + contents);
			String writer="tempWriter";
		
			try {
				int result = bservice.WriteBoardInsert(writer, title,contents );
				System.out.println(result);
				//model.addAttribute("result", result);
				return "home";
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
	

}
