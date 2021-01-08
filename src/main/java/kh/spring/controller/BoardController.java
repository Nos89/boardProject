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

import kh.spring.dto.CommentDTO;
import kh.spring.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private HttpSession session;

	@Autowired
	private BoardService bservice;

	private int board_seq;

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
		String writer = (String) session.getAttribute("loginID");

		try {
			int result = bservice.WriteBoardInsert(writer, title, contents);
			return "home";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	// 글 상세보기(+댓글 확인)
	@RequestMapping("/boardDetail")
	public String boardDetail(Model model, HttpServletRequest req) {
		int seq = Integer.parseInt(req.getParameter("seq"));
		board_seq = seq;
		String loginId = (String) req.getSession().getAttribute("loginID");

		BoardDTO dto = bservice.viewBoardDetail(seq);
		List<CommentDTO> list = bservice.cmtList(board_seq);

		model.addAttribute("dto", dto);
		model.addAttribute("loginId", loginId);
		model.addAttribute("cmtList", list);
		return "/board/boardDetail";
	}

	//댓글 달기
    @RequestMapping("writeCmt")
    public String writeCmt( Model model,String contents) {
       String writer = (String) session.getAttribute("loginID");

       try {
          int result = bservice.writeCmt(board_seq,writer, contents);
          System.out.println(result);
          BoardDTO dto = bservice.viewBoardDetail(board_seq);
          List<CommentDTO> list = bservice.cmtList(board_seq);
          
          
          model.addAttribute("dto", dto);
          model.addAttribute("loginId", writer);
          model.addAttribute("cmtList", list);
          return "/board/boardDetail";
       } catch (Exception e) {
          e.printStackTrace();
       }
       return null;
    }
	
	@RequestMapping("cmtView")
	public String cmtView(Model model) {
		
		int board_seq =11;
		
		List<CommentDTO> list = bservice.cmtList(board_seq);
		model.addAttribute("cmtList", list);
		model.addAttribute("aaa", 1111111);
		return "/board/cmtView";		
	}
	
	

	
	
	//글 수 정하기 페이지로 이동
	@RequestMapping("/modifyBoard")
	public String modifyBoard(Model model, HttpServletRequest req, BoardDTO dto) {
		System.out.println(dto.getSeq() +":" + dto.getWriter()+":"+ dto.getContents());
		model.addAttribute("dto", dto);
		
		return "/board/boardModify";
	}
	
	//글 수정하기 작업
	@RequestMapping("/modifyBoardProc")
	public String modifyBoardProc(Model model, BoardDTO dto) {
		int result = bservice.modifyBoard(dto);
		model.addAttribute("result", result);
		
		return "/board/modifyBoardProcView";
	}
	
	//글 삭제
	@RequestMapping("/deleteBoard")
	public String deleteBoard(Model model, HttpServletRequest req) {
		int result = bservice.deleteBoard(Integer.parseInt(req.getParameter("seq")));
		model.addAttribute("result", result);
		return "/board/deleteBoardProcView";
	}

}
