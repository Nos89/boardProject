<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<style>
* {
	box-sizing: border-box;
}

.btn{
	background-color: #4cc627;
	border : 1px solid #4cc627;
	color : white;
	width: 100px;
	height: 30px;
	outline:0;
}

.btn:hover, .btn:focus{
	background-color: #4cc62740;
	cursor: pointer;
	border : 1px solid #4cc627;
}


div {
	width: 800px;
	margin: auto;
}

.header {
	float: left;
	padding-left:15px;
	width: 100%;
	height: 100px;
    font-weight: 600;
    font-size: 22px;
    line-height: 50px;
    color:white;
    background-color:#4cc627;
}

.amount{
	font-size: 15px;
}

.box1 {
	width: 100%;
	height: 40px;
	line-height: 40px;
	font-size: 18px;
}

.box2 {
	width: 4%;
	height: 100%;
	float: left;
	border-bottom: 1px solid #f2f2f2;
}

.title {
	border-bottom: 1px solid #f2f2f2;
	width: 61%;
	height: 100%;
	text-align: center;
	float: left;
}

.writer {
	border-bottom: 1px solid #f2f2f2;
	float: left;
	text-align: center;
	width: 15%;
	height: 100%;
}

.date {
	border-bottom: 1px solid #f2f2f2;
	float: left;
	width: 20%;
	height: 100%;
	text-align: center;
}

.main {
	float: left;
	width: 100%;
	height: 90%;
	text-align: center;
}

.nav_item {
	display: inline-block;
	width: 37px;
	height: 37px;
	border: 1px solid #dae0e9;
	color: #222;
	line-height: 37px;
	text-align: center;
	background: #fff;
	margin-right: 8px;
	cursor: pointer;
	border-radius: 50px;
}

.nav_item:hover, .nav_item:focus {
	color: #6f7180;
	background-color: #5fed34;
}

.nav {
	text-align: center;
}

a {
	text-decoration: none;
}

#anc:hover{
	text-decoration: underline;
}

#anc{
	color:black;
}

#footer {
	height: 7.5%;
	text-align: right;
}

.box3 {
	width: 100%;
	height: 40px;
	line-height: 40px;
}

.header2{
	border: 1px solid #4cc627;
	height: 542px;
	box-shadow: 0 0 24px 0 rgba(0, 0, 0, 0.12);
}

</style>
</head>
<body>

		<div class=header2>
			<div class=header>
				자유 게시판<br><span class="amount">${amount }개의 글</span>
			</div>
			<div class="box1">
				<div class=box2></div>
				<div class=title>제목</div>
				<div class=writer>작성자</div>
				<div class=date>날짜</div>
			</div>
			<div class=main>

				<c:if test="${list != null}">
					<c:forEach var="i" items="${list}">
						<div class=box3>
							<div class=box2>${i.seq}</div>
							<div class=title>
								<a id=anc name=title
									href="/board/boardDetail?cpage=1&seq=${i.seq }">${i.title}</a>
							</div>
							<div class=writer>${i.writer}</div>
							<div class=date>${i.formedDate}</div>
							<br>
						</div>
					</c:forEach>
				</c:if>

				<c:if test="${empty list}">
					<div class=box3>글이 없습니다.</div>
				</c:if>
			</div>
			<div class=nav>${navi}</div>
		</div>
	<div id=footer>
		<button class=btn id=write>글쓰기</button>
		<button class=btn id=back>돌아가기</button>
	</div>
	
	<script>
		$('#back').click(function(){
			location.href="/";
		});
	</script>
</body>
</html>