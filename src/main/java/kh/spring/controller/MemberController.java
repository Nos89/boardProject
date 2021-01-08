package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	HttpSession session;
	
	@Autowired
	MemberService mservice;
	
	
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
	
}
