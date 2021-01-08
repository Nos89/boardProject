<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<body>
	<c:choose>
		<c:when test="${signUp == 1}">
			<script>
				alert("회원가입에 성공했습니다.");
				location.href = "/";
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("회원가입을 하지 못했습니다.");
				location.href = "/";
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>