<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
	<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <style>
        .container{
            border: 1px solid black;
            width: 400px;
            margin: auto;
            margin-top: 50px;
            padding: 10px;
        }
        p{
            display: inline-block;
            width: 90px;
            font-size: 14px;
            font-weight: 800;
        }
        #idCheck{font-size: 12px;}
        #pwCheck{
            width: 170px;
            font-size: 12px;
        }
        div[class^="row_"]:last-child{float: left;}
        div[class^="row_"] input{
            width: 120px;
            height: 25px;
            border:1px solid gray;
            border-radius: 5px;
            padding-left: 3px;
        }
        #email{width: 200px;}
        .button{margin: 10px 0px;}
        button[id^="btn_"]:not(#btn_duplChk){
            width: 100px;
            height: 30px;
            border-radius: 30px;
        }
        #btn_signup{margin-left: 98px;}
        button:hover{
            cursor: pointer;
            background-color:gainsboro;
        }
    </style>
</head>
<body>
    <form action="/member/signUp" method="post" id="signUpForm">
        <div class="container">
            <div class="row_id">
                <p>아이디</p>
                <input type="text" id="id" name="id" placeholder="ID">
                <button type="button" id="btn_duplChk">중복 확인</button>
                <p id="idCheck"></p>
            </div>
            <div class="row_pw">
                <p>비밀번호</p>
                <input type="password" id="pw" name="pw" placeholder="PW">
            </div>
            <div class="row_pwCheck">
                <p>비밀번호 확인</p>
                <input type="password" id="chkPw" name="chkPw" placeholder="PW">
                <p id="pwCheck"></p>
            </div>
            <div class="row_name">
                <p>이름</p>
                <input type="text" id="name" name="name" placeholder="NAME">
            </div>
            <div class="row_email">
                <p>이메일</p>
                <input type="text" id="email" name="email" placeholder="userID@email.com">
            </div>
            <div class="button">
                <button id="btn_signup">Sign Up</button>
                <button type="button" id="btn_reset">Reset</button>
            </div>
            <input type="hidden" id="idCheckFlag" value="false">
        </div>
        <script>
            // 아이디 중복검사
            $("#btn_duplChk").click(function(){
                let id = document.getElementById("id").value;
                $("#btn_duplChk").hide();
                $("#idCheck").width('170');
                $("#idCheckFlag").val('true');
                $.ajax({
                    url:"/member/idCheck",
                    type:"post",
                    data:{id:id},
                }).done(function(resp){
                    if(resp=="이미 사용 중인 아이디입니다."){
                        $("#idCheck").html(resp);
                        idCheck.style.color = "red";
                    }else {
                        $("#idCheck").html(resp);
                        idCheck.style.color = "blue";
                    }
                })
            })
            
            // 아이디 입력 시 중복검사 하지 않은 것으로 초기화
            document.getElementById("id").oninput = function() {
                $("#idCheckFlag").val('false');
                $("#idCheck").html('');
                $("#idCheck").width('0');
                $("#btn_duplChk").show();
            }
            
            // 패스워드 일치 여부
            let pwCheck = document.getElementById("pwCheck");
            document.getElementById("chkPw").oninput = function(){
                let oriPw = document.getElementById("pw").value;
                let chkPw = document.getElementById("chkPw").value;
                
                if(oriPw == chkPw){
                    pwCheck.innerHTML = "패스워드가 일치합니다.";
                    pwCheck.style.color ="blue";
                }else {
                    pwCheck.innerHTML = "패스워드가 일치하지 않습니다.";
                    pwCheck.style.color = "red";
                }
            }
                        
            // 아이디 중복검사 했는지 확인 후  submit
            let form = document.getElementById("signUpForm");
            form.onsubmit = function(){
                if($("#idCheckFlag").val()=="false"){
                    alert("아이디 중복확인을 해주세요.");
                    return false;	// submit 안 함
                }else {
                    return true;	// submit
                }
            }
            
            // 폼 리셋
            $("#btn_reset").click(function(){
                $("input").val('');
                $("#idCheck").html('');
                $("#idCheckFlag").val("false");
                $("#pwCheck").html('');
            });
        </script>
	</form>
</body>
</html>