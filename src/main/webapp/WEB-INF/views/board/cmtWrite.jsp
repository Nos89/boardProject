<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cmtWrite</title>

	 <style>
             *{box-sizing: border-box;}
            div{border: 1px solid black;}
            .container{width: 800px; height: 160px;}
            .container2{width: 800px; height: 160px; margin-top:100px;}
            .top{height: 60px;}
            .seq{float: left; width: 100px; height: 100%;}
            .id{float: left; width: 200px; height: 100%;}
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
     
       
<!-- 댓글들 확인 -->
        <div class="container2">
            <div class="top">
                <div class="seq">seq</div> <div class="id">id</div>
            </div>
            <div class="contents">contents</div>
        
        </div>
</body>
</html>