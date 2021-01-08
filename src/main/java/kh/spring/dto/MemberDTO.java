package kh.spring.dto;

import java.sql.Date;

public class MemberDTO {
	private String id;
	private String pw;
	private String name;
	private String email;
	private Date reg_date;
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberDTO(String id, String pw, String name, String email, Date reg_date) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.reg_date = reg_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
}
