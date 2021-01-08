<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>

	<button id=board>게시판</button>
	<button id=logout>로그아웃</button>
	
	<script>
		$(document).on('click','#board',function(){
			location.href="/board/showBoard.brd?cpage=1";
		});
		
		$(document).on('click','#logout',function(){
			location.href = "/member/logout.mem";
		});
	</script>

<a href="/board/toWrite">글쓰기</a>
<a href="/board/toCommet">댓글</a>

</body>
</html>