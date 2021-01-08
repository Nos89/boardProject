<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign Out</title>
    <style>
        .container{
            border: 1px solid black;
            width: 400px;
            margin: auto;
            margin-top: 50px;
            text-align: center;
        }
        p{font-weight: 800; font-size: 14px;}
        input{
            width: 180px; 
            height: 25px; 
            border: 1px solid gray; 
            border-radius: 5px;
            padding: 5px;
        }
        #btn_signout{
            width: 100px;
            height: 30px;
            border-radius: 30px;
            margin: 20px;
        }
        #btn_signout:hover{
            cursor: pointer;
            background-color:gainsboro;
        }
    </style>
</head>
<body>
    <form action="/member/signOut" method="post">
        <div class="container">
            <p>회원탈퇴를 하시려면 비밀번호를 입력해주세요.</p>
            <input type="password" id="pw" name="pw" placeholder="PW"><br>
            <button id="btn_signout">SignOut</button>
        </div>
    </form>
</body>
</html>