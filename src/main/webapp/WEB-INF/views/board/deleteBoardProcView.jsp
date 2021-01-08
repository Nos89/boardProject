<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${result == 1 }">
		<script>alert("수정성공"); location.href="/board/showBoard.brd?cpage=1";</script>
	</c:when>
	<c:otherwise><script>alert("실패"); location.href="/"</script></c:otherwise>
</c:choose>

</body>
</html>