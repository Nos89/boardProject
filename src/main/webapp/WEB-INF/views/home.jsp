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
<style>
	*{ box-sizing: border-box; }
	#mainContentsWrapper{
		width: 800px;
		margin: auto;
	}
	.loginBox{
		width: 300px;
		height: 140px;
		margin: auto;
		border: 1px solid black;
		text-align: center;
	}
	
	.loginBox div {
		float: left;
	}
	
	.loginTitle{
		width: 100%;
		height: 20%;
		border-bottom: 1px solid black;
	}
	
	.formWrapper{
		width: 100%;
		height: 60%;
	}
	
	.inputWrapper{
		width: 80%;
		height: 100%;
		padding: 0px 5px;
	}
	
	.inputWrapper input{
		width: 100%;
		height: 35px;
		margin-top: 5px;
	}
	.btnWrapper{
		width:20%;
		height: 72px;
		margin-top: 5px;
		padding-right: 5px;
	}
	
	.btnWrapper .btnLogin{
		width:100%;
		height:100%;
	}
	
	.btnSignupWrapper{
		width: 100%;
		height: 20%;
		padding: 2px;
	}
	
</style>
</head>
<body>
	<div id="mainContentsWrapper">
	<c:choose>
		<c:when test="${loginID == null }">
			<c:if test="${loginMsg != null && loginMsg == 'fail' }">
			<script>
				alert("아이디와 비번을 확인 해주세요.");
				location.href="/";
			</script>
			</c:if>
			<div class="loginBox">
				<div class="loginTitle">Login</div>
				<div class="formWrapper">
					<form action="/member/login" method="post">
						<div class="inputWrapper">
							<input type="text" name="id" placeholder="아이디를 입력 해주세요."><br>
							<input type="passwored" name="pw" placeholder="비밀번호를 입력 해주세요.">
						</div>
						<div class="btnWrapper">
							<input type="submit" value="로그인" class="btnLogin">
						</div>
					</form>
				</div>
				<div class="btnSignupWrapper"><button>회원가입</button></div>
			</div>
		</c:when>
		<c:when test="${loginID != null }">
				<button id=logout>로그아웃</button>
		</c:when>
	</c:choose>
	</div>
<button id=board>게시판</button>
	
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