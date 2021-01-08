package kh.spring.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class MemberController {

	@RequestMapping("logout.mem")
	public String logout(HttpServletRequest request) throws Exception {
		request.getSession().invalidate();
		return "home";
	}
}
