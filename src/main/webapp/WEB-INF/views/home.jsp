<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>
	<input type="button"  id="boardDetail" value="게시글보기">
</body>
<script>
	$("#boardDetail").on("click", function(){
		location.href="/board/boardDetail?seq=1"; 
	})
</script>
</html>