package kh.spring.dto;

import java.sql.Date;

public class CommentDTO {
	private int seq;
	private int board_seq;
	private String id;
	private String contents;
	private Date cmt_date;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getBoard_seq() {
		return board_seq;
	}
	public void setBoard_seq(int board_seq) {
		this.board_seq = board_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getCmt_date() {
		return cmt_date;
	}
	public void setCmt_date(Date cmt_date) {
		this.cmt_date = cmt_date;
	}
	public CommentDTO(int seq, int board_seq, String id, String contents, Date cmt_date) {
		super();
		this.seq = seq;
		this.board_seq = board_seq;
		this.id = id;
		this.contents = contents;
		this.cmt_date = cmt_date;
	}
	public CommentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
