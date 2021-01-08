<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
    </head>
    <style>
        *{box-sizing: border-box; }
        .mainContentsWrapper{width: 800px; margin:auto; border: 1px solid black;}
        .title{width: 50%; height: 30px; border: 1px solid black; float:left}
        .writer{width: 20%; height: 30px; float:left; border:1px solid black;}
        .reg_date{width: 30%; height: 30px; float:left; border:1px solid black;}
        .contents{height:500px;}
        .btnWrapper{text-align: right;}
        textarea{width: 100%; height: 100%;}
        .cmtContentsWrapper{width: 90%; height: 60px; float:left; }
        .cmtBtnWrapper{width: 10%;  height: 60px; float:left; }
        #cmtBtn{width: 100%; height:100%;}
    </style>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<body>
	<div class="mainContentsWrapper">
		<form>
			<div class="title" name="title">${dto.title }</div>
			<div class="writer" name="writer">${dto.writer }</div>
			<div class="reg_date" name="write_date">${dto.write_date }</div>
			<div class="contents">
				<textarea style="resize: none;" id="textarea" name="textarea"
					readonly>${dto.contents }</textarea>
			</div>
			<c:choose>
				<c:when test="${dto.writer == loginId }">
					<div class="btnWrapper">
						<input type="button" value="수정"> <input type="submit"
							value="삭제">
					</div>
				</c:when>
				<c:otherwise>
					<div class="btnWrapper">
						<input type="button" value="목록으로">
					</div>
				</c:otherwise>
			</c:choose>
		</form>
		<div class="commentsWrapper">
			<div class="cmtContentsWrapper">
				<textarea class="commentsContents" id="commentsContents"></textarea>
			</div>
			<div class="cmtBtnWrapper">
				<input type="button" id="cmtBtn" value="글쓰기">
			</div>
			<div class="viewComments"></div>
		</div>
	</div>

</body>
</html>