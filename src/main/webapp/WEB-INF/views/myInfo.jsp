<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyInfo</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style>
	*{ box-sizing: border-box; }
	#mainContentsWrapper{
		width: 800px;
		margin: auto;
	}
	.myInfo{
		margin-top: 20px;
		width: 400px;
		border: 1px solid black;
		margin: auto;
	}
	.btnWrapper{
		width: 400px;
		padding-top: 10px;
		margin: auto;
		text-align: center;
	}
</style>
</head>
<body>
	<div id="mainContentsWrapper">
		<c:choose>
			<c:when test="${flag == 'false'}">
				<table class="myInfo">
					<tr>
						<td>아이디
						<td>${myInfo.id}
					</tr>
					<tr>
						<td>이름
						<td>${myInfo.name}
					</tr>
					<tr>
						<td>이메일
						<td>${myInfo.email}
					</tr>
					<tr>
						<td>가입일
						<td>${myInfo.reg_date }
					</tr>
				</table>
				<div class="btnWrapper">
					<button class="btnModify">정보 수정</button>
					<button class="btnBack">뒤로 가기</button>
				</div>
				<script>
					$(".btnModify").click(function(){
						location.href="/member/myInfo?type=true";
					})
					$(".btnBack").click(function(){
						location.href="/";
					})
				</script>
			</c:when>
			<c:when test="${flag == 'true' }">
				<form action="/member/modify" method="post">
					<table class="myInfo">
						<tr>
							<td>아이디
							<td>${myInfo.id}
						</tr>
						<tr>
							<td>이름
							<td><input type="text" value="${myInfo.name}" name="name">
						</tr>
						<tr>
							<td>이메일
							<td><input type="text" value="${myInfo.email}" name="email">
						</tr>
						<tr>
							<td>가입일
							<td>${myInfo.reg_date }
						</tr>
					</table>
					<div class="btnWrapper">
						<input type="submit" value="수정하기"></button>
						<button class="btnBack">뒤로 가기</button>
					</div>
				</form>
				<script>
					$("input[type=submit]").click(function(){
						if( $("input[name=name]").val() == "" ){
							alert("이름을 입력해주세요.");
							return false;
						}
						if( $("input[name=email]").val() == "" ){
							alert("이메일을 입력해주세요.");
							return false;
						}
					})
					$(".btnBack").click(function(){
						location.href="/member/myInfo?type=false";
					})
				</script>
			</c:when>
		</c:choose>		
	</div>
	<c:if test="${result != null && result == 'true' }">
				<script>
					alert("회원 정보가 변경 되셨습니다.");
					location.href="/";
				</script>
				</c:if>
</body>
</html>