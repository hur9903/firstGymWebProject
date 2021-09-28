<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="main.css" />


    <!-- summernote cdn (jquery 필수)-->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

    <!-- 제이쿼리 임시 -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>   -->
    <link rel="stylesheet" href="./css/bootstrap.css">
</head>
<body>
    <header>
        <div class='title'>
            <h1>FIRST GYM</h1>
            <div class="join">
                <a href="#">로그인</a>
                <a href="#">회원가입</a>
            </div>
        </div>
        <nav class='bar'>
            <ul>
                <li><a href="#">MBI 검사</a></li>
                <li><a href="#">운동기구</a></li>
                <li><a href="#">게시판</a></li>
                <li><a href="#">마이페이지</a></li>
                <li><a href="#">문의하기</a></li>
            </ul>
        </nav>      
    </header>
