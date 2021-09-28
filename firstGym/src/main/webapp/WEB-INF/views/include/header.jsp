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
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

    <!-- 제이쿼리 임시 -->
<!--     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 -->   
    <!-- 부트스트랩 css 사용 --> 
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
	  
	<!-- 주소 api -->    
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2.4.1/dist/email.min.js"></script>

    <link rel="stylesheet" href="owlcarousel/owl.carousel.min.css">

    <script src="jquery.min.js"></script> <!-- 제이쿼리를 기반으로 작동하기 때문에 꼭 걸어준다.  --> 
    <script src="owlcarousel/owl.carousel.min.js"></script> <!-- 업로드한 경로를 지정한다..  --> 
	<link href="./carousel.css" rel="stylesheet"> <!--추가--> 
	<script src="./carousel.min.js" type="text/javascript"></script><!--추가-->

</head>
<body>
    <header>
        <div class='title'>
           <h1> <img src="${pageContext.request.contextPath }/resources/image/logo.png" alt="" class="header-logo"> <span class="header-first">FIRST GYM</span></a></h1>
            <div class="join">
       
            <c:choose>
            
              <c:when test="${login == null}"> 
	          		<c:if test="${noIdLogin == null}">
	          	
			            <a href="<c:url value='/user/loginPage' />">LOGIN</a>
			            <a href="<c:url value='/user/joinPage' />">JOIN</a>
		            
	          		</c:if>
	          		<c:if test="${noIdLogin != null }">
	          
			         	 <a href="<c:url value='/user/joinPage' />">JOIN</a>
		    	     	 <a href="<c:url value='/user/logout' />" onclick="return confirm('정말 로그아웃 하시겠습니까?')" > LOGOUT</a>
     		  		
	          		</c:if>
	          	</c:when>
	          		
	          	<c:when	test="${login != null}"> 
	          		 <a href="<c:url value='/mypage/mypageMainPage' />">MYPAGE</a>
		         	 <a href="<c:url value='/user/logout' />" onclick="return confirm('정말 로그아웃 하시겠습니까?')" > LOGOUT</a>
     		  		
	          	</c:when>	
          		
            </c:choose>

            </div>
        </div>
        <nav class='bar'>
            <ul>
                <li><a href="<c:url value='/bmi/bmiPage' />">BMI 검사</a></li>
                <li><a href="<c:url value='/product/productListPage' />">운동기구</a></li>
                <li><a href="<c:url value='/board/boardListPage' />">게시판</a></li>
                <li><a href="#">마이페이지</a></li>
                <li><a href="#">문의하기</a></li>
            </ul>
        </nav>
        <!-- <nav class='bar' style="background: #0000">
            <ul>
                <li></li>
                <li style="background: red; width: 20%; margin: 0;">운동기구</li>
                <li></li>
                <li></li>
                <li></li>
            </ul>
        </nav>  -->      
    </header>
