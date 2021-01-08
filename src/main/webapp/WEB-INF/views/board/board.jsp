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

div {
	width: 800px;
	margin: auto;
	border: 1px solid black;
}

.header {
	float: left;
	text-align: center;
	width: 100%;
	height: 5%;
}

.box1 {
	float: left;
	width: 100%;
	height: 5%;
}

.box2 {
	width: 4%;
	height: 100%;
	float: left;
}

.title {
	border: 1px solid black;
	width: 61%;
	height: 100%;
	text-align: center;
	float: left;
}

.writer {
	float: left;
	text-align: center;
	width: 15%;
	height: 100%;
}

.date {
	border: 1px solid black;
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

.nav_item:hover{
	color: #6f7180;
	background-color: #149ddd;
}

.active{
	color: #6f7180;
	background-color: #149ddd;
	background: red;
}

.nav{
	text-align: center;
}

a {
	text-decoration: none;
}

#footer {
	border: 1px solid black;
	height: 7.5%;
	text-align: right;
}

.box3 {
	width: 100%;
	height: 30px;
}
</style>
</head>
<body>
	<div id=container>
		<div class=header2>
			<div class=header>자유 게시판</div>
			<div class="box1">
				<div class=box2></div>
				<div class=title>Title</div>
				<div class=writer>Writer</div>
				<div class=date>Date</div>
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

		</div>
	</div>
	<div class=nav>${navi}</div>
	<div id=footer>
		<button id=write>글쓰기</button>
		<button id=back>돌아가기</button>
	</div>
	
	<script>
	 $(document).on('click','.nav_item', function(){
		$(this).addClass("active");
		});
	
	</script>
</body>
</html>