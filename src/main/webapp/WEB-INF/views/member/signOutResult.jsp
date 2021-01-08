<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Out</title>
</head>
<body>
	<c:choose>
		<c:when test="${signOut==1}">
			<script>
				alert("회원탈퇴에 성공했습니다.");
				location.href="/";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("회원탈퇴를 하지 못했습니다.");
				location.href="/";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>