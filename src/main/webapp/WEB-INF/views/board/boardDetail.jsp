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
         .commentsWrapper{width: 800px; height: 160px;}
            .contents{width: 100%; height: 100px;}
            .apply{ height: 60px;}
            .applyBtn{float: right; height: 100%; width: 100px;}
            .txtarea{width: 100%; height: 100%}
            .container2{width: 800px; height: 160px; margin-top:20px; border:1px solid black;}
            .top{height: 60px;border:1px solid black;}
            .seq{float: left; width: 100px; height: 100%;border:1px solid black;}
            .id{float: left; width: 200px; height: 100%;border:1px solid black;}
            .reg_date_cmt{float: right; width: 200px; height: 100%;border:1px solid black;}
            .contents_cmt{width: 100%; height: 100px;border:1px solid black;}
    </style>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<body>
	<div class="mainContentsWrapper">
		<form action="/board/modifyBoard" method="post">
			<div class="title" name="title"><input type="text" name="title" value="${dto.title }" readonly></div>
			<div class="writer" name="writer"><input type="text" name="writer" value="${dto.writer }" readonly></div>
			<div class="reg_date" name="write_date"><input type="text" name="write_date" value="${dto.write_date }" readonly></div>
			<div class="contents">
				<textarea style="resize: none;" id="textarea" name="contents"
					readonly>${dto.contents }</textarea>
			</div>
			<c:choose>
				<c:when test="${dto.writer == loginId }">
					<div class="btnWrapper">
						<input type="hidden" id="seq" name="seq" value="${dto.seq }"><input type="submit" id="modify" value="수정"> <input type="button"
							id="delBtn" value="삭제"> <input type="button"  id="backBtn" value="전체목록으로">
					</div>
				</c:when>
				<c:otherwise>
					<div class="btnWrapper">
						<input type="button" id="backBtn" value="전체목록으로">
					</div>
				</c:otherwise>
			</c:choose>
		</form>
		<!-- 댓글 쓰는 부분 -->
	<form action="/board/writeCmt" method=post>
	 <div class="commentsWrapper">
            <div class="contents"><textarea class=txtarea name=contents placeholder="댓글을 입력하세요."></textarea></div>
            <div class="apply"><input type=submit class=applyBtn value="등록하기"></div>
        </div>
     </form>
     
     <!-- 댓글들 확인 -->
	<!-- 게시글 SEQ == 댓 쓸때 mapper에 있는 board_seq -->
	
	<c:forEach var="i" items="${cmtList}">
        <div class="container2">    
            <div class="top">
                <div class="seq">${i.seq}</div> <div class="id">${i.id }</div><div class=reg_date_cmt>${i.cmt_date}</div>
            </div>
            <div class="contents_cmt">${i.contents }</div>
          	
        </div>
      </c:forEach>
	</div>
	<button id=backBtn>뒤로가기</button>
	
	<script>
	$(document).on('click','#backBtn',function(){
		location.href = "/board/showBoard.brd?cpage=1";
	});
	</script>

</body>
<script>
$(document).on('click','#delBtn', function(){
	let result = confirm("삭제하시겠습니까?");
	if(result){
		let seq = $('#seq').val();
		location.href="/board/deleteBoard?seq="+seq+"";
	}else{
	}
	
	});
	
$(document).on('click','#backBtn',function(){
	location.href="/board/showBoard.brd?cpage=1";
})
</script>
</html>