<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<form action="/board/modifyBoardProc" method=post>
				<table border=1 class=board>
					<tr class=top>
						<th colspan=5>글 수정</th>
					</tr>
					<tr class=title>
						<td><input type=text class=text name=title
							value="${dto.title }"></td>
					</tr>
					<tr class=center>
						<td colspan=5><textarea type=text name=contents
								class=contents >${dto.contents }</textarea></td>
					</tr>
					<tr class=bottom>
						<td colspan=5><input type=button value=목록으로 id=toIndex>
							<input type=submit value="글 수정" id=modifyBtn></td>
					</tr>
				</table>
				<input type="hidden" value="${dto.seq }" name="seq">
			</form>

	<script>

        //목록으로
        document.getElementById("toIndex").onclick = function(){
        	location.href='/';
        }
        </script>

</body>
</html>