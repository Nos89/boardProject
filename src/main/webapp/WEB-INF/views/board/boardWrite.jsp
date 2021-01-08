<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>BoardWrite</title>
</head>

<style>
* {
	box-sizing: border-box;
}

#writeBtn {
	float: right;
}

#toIndex {
	float: right;
}

.board {
	width: 700px;
	height: 500px;
	margin: auto;
}

.top {
	height: 5%;
}

.title {
	height: 8%;
}

.bottom {
	height: 7%;
}

.center {
	height: 80%;
}

.text {
	width: 100%;
	height: 100%;
}

.contents {
	width: 100%;
	height: 100%;
}
</style>

<!-- 게시판 글쓰는 곳 -->
<body>
			<!-- 그냥 글쓰기  -->
			<form action="/board/write.board" method=post>
				<table border=1 class=board>
					<tr class=top>
						<th colspan=5>자유게시판 글 쓰기</th>
					</tr>
					<tr class=title>
						<td><input type=text class=text name=title
							placeholder="제목을 입력하세요" required></td>
					</tr>
					<tr class=center>
						<td colspan=5><textarea type=text name=contents
								class=contents placeholder="내용을 입력하세요." required></textarea></td>
					</tr>
					<tr class=bottom>
						<td colspan=5><input type=button value=목록으로 id=toIndex>
							<input type=submit value="글 등록" id=writeBtn></td>
					</tr>
				</table>
			</form>

	<script>

        //목록으로
        document.getElementById("toIndex").onclick = function(){
        	location.href='/board/showBoard.brd?cpage=1';
        }
        </script>

</body>
</html>