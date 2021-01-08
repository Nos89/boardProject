package kh.spring.statics;

import org.springframework.stereotype.Component;

@Component
public class Statics {
	// 페이지당 게시글 수
	public static int recordCountPerPage = 10;
	// 한번에 보여줄 게시글 페이지 수
	public static int naviCountPerPage = 10;
	// 페이지당 댓글 수
	public static int commentsCountPerPage = 10;
	// 한번에 보여줄 댓글 페이지 수
	public static int comNaviCountPerPage = 10;
}
