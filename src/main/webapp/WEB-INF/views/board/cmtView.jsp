<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cmtView</title>
	<style>
            *{box-sizing: border-box;}
            div{border: 1px solid black;}
            .container{width: 800px; height: 160px;}
            .container2{width: 800px; height: 160px; margin-top:20px;}
            .top{height: 60px;}
            .seq{float: left; width: 100px; height: 100%;}
            .id{float: left; width: 200px; height: 100%;}
            .reg_date{float: right; width: 200px; height: 100%;}
            .contents{width: 100%; height: 100px;}
        </style>
</head>
<body>
	<!-- 댓글들 확인 -->
	<!-- 게시글 SEQ == 댓 쓸때 mapper에 있는 board_seq -->
	
	<c:forEach var="i" items="${cmtList}">
        <div class="container2">    
            <div class="top">
                <div class="seq">${i.seq}</div> <div class="id">${i.id }</div><div class=reg_date>${i.cmt_date}</div>
            </div>
            <div class="contents">${i.contents }</div>
          	
        </div>
      </c:forEach>
</body>
</html>