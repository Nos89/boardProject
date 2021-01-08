package kh.spring.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.spring.dao.MemberDAO;
import kh.spring.dto.MemberDTO;

@Service
public class MemberService {
	@Autowired
	MemberDAO mdao;
	
	public boolean login( String id, String pw ) {
		Map<String, String> temp = new HashMap<>();
		temp.put("id", id);
		temp.put("pw", pw);
		return mdao.login(temp);
	}
	
	// 아이디 중복확인
	public int isIdDuplicated(String id) {
		return mdao.isIdDuplicated(id);
	}
	
	// 회원가입
	public int signUp(MemberDTO dto) {
		return mdao.signUp(dto);
	}
}
