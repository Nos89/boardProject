package kh.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kh.spring.dto.MemberDTO;
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
	
	@RequestMapping("myInfo")
	public String myInfo(String type, Model model) {
		String id = (String)session.getAttribute("loginID");
		model.addAttribute("myInfo", mservice.getMyInfo(id));
		try {
			boolean flag = Boolean.parseBoolean(type);
			if( flag ) {
				model.addAttribute("flag", true);
			} else {
				model.addAttribute("flag", false);
			}
		} catch(Exception e) {
			model.addAttribute("flag", false);
		}
		return "/myInfo";
	}
	
	@RequestMapping("modify")
	public String modifyInfo( MemberDTO dto, Model model ) {
		dto.setId((String)session.getAttribute("loginID"));
		int result = mservice.modifyInfo(dto);
		if( result > 0 ) {
			model.addAttribute("result", true);
		} else {
			model.addAttribute("result", false);
		}
		return "/myInfo";
	}
}
