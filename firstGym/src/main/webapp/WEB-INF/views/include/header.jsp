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
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/main.css" />


    <!-- summernote cdn (jquery 필수)-->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

    <!-- 제이쿼리 임시 -->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>   -->
   
    <!-- 부트스트랩 css 사용 --> 
    <link rel="stylesheet" href="/css/bootstrap.css">


    
    

</head>
<body>
    <header>
        <div class='title'>
            <h1><a href="<c:url value='/' />">FIRST GYM</a></h1>
            <div class="join">
              <%--   
	              <a href="<c:url value='/user/loginPage' />">로그인</a>
	              <a href="<c:url value='/user/joinPage' />">회원가입</a> 
              --%>
                
                <c:if test="${login == null }"> 
	          	
		            <a href="<c:url value='/user/loginPage' />">LOGIN</a>
		            <a href="<c:url value='/user/joinPage' />">JOIN</a>
	          
          		</c:if>
          
          		<c:if test="${login != null }">
	          
		         	 <a href="<c:url value='/mypage/mainPage' />">MYPAGE</a>
		         	 <a href="<c:url value='/user/logout' />" onclick="return confirm('정말 로그아웃 하시겠습니까?')" > LOGOUT</a>
     		  		
          		</c:if>
            </div>
        </div>
        <nav class='bar'>
            <ul>
                <li><a href="#">MBI 검사</a></li>
                <li><a href="<c:url value='/product/productListPage' />">운동기구</a></li>
                <li><a href="#">게시판</a></li>
                <li><a href="<c:url value='/mypage/mainPage' />">마이페이지</a></li>
                <li><a href="#">문의하기</a></li>
            </ul>
        </nav>      
    </header>
