<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cmtWrite</title>

	 <style>
             *{box-sizing: border-box;}
            div{border: 1px solid black;}
            .container{width: 800px; height: 160px;}
            .contents{width: 100%; height: 100px;}
            .apply{ height: 60px;}
            .applyBtn{float: right; height: 100%; width: 100px;}
            .txtarea{width: 100%; height: 100%}
        </style>
</head>
<body>

<!-- 댓글 쓰는 부분 -->
	<form action="/board/writeCmt" method=post>
	 <div class="container">
            <div class="contents"><textarea class=txtarea name=contents placeholder="댓글을 입력하세요."></textarea></div>
            <div class="apply"><input type=submit class=applyBtn value="등록하기"></div>
        </div>
     </form>
     
       

      
</body>
</html>