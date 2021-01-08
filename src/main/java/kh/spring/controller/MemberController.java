package kh.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.spring.dto.MemberDTO;
import kh.spring.service.MemberService;
import kh.spring.utils.EncryptUtils;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	MemberService mservice;
	
	@RequestMapping("logout.mem")
	public String logout(HttpServletRequest request) throws Exception {
		request.getSession().invalidate();
		return "home";
	}
	
	@RequestMapping("login")
	public String login(String id, String pw, Model model) {
		System.out.println(id + pw);
		boolean result = mservice.login(id, pw);
		System.out.println(result);
		if( result ) {
			session.setAttribute("loginID", id);
			model.addAttribute("loginMsg", "success");
		} else {
			model.addAttribute("loginMsg", "fail");
		}
		return "home";
	}
	
	// 회원가입 페이지로 이동
	@RequestMapping("toSignUp")
	public String toSignUp() {
		return "/member/signUp";
	}
	
	// 아이디 중복 체크
	@RequestMapping(value="idCheck", produces="text/plain; charset=UTF8")	
	@ResponseBody
	public String idDuplCheck(String id) {
		int result = mservice.isIdDuplicated(id);
		if(result == 1) {
			return "이미 사용 중인 아이디입니다.";
		}else {
			return "사용 가능한 아이디입니다.";
		}
	}
	
	// 회원가입
	@RequestMapping("signUp")
	public String signUp(MemberDTO dto, Model model) throws Exception {
		dto.setPw(EncryptUtils.getSHA256(dto.getPw()));
		int result = mservice.signUp(dto);
		model.addAttribute("signUp", result);
		return "/member/signUpResult";
	}
	
}
