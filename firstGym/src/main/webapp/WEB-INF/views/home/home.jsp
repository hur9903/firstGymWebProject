<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

    <%@include file="../include/header.jsp" %>
        <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 slide-list">
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <div class="item active">
                            	<a href='<c:url value="/product/productDetailPage?proNum=44"/>'>
                                <img src="${pageContext.request.contextPath }/resources/image/slide1.png" alt="슬라이드1">
                                </a>
                            </div>
                            <div class="item">
                                <a href='<c:url value="/product/productDetailPage?proNum=16"/>'>
                                <img src="${pageContext.request.contextPath }/resources/image/slide2.png" alt="슬라이드2">
                                </a>
                            </div>
                            <div class="item">
                                <a  href='<c:url value="/product/productListPage"/>'>
                                <img src="${pageContext.request.contextPath }/resources/image/slide3.png" alt="슬라이드3">
                                </a>
                            </div>
                             
                        </div>

                        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                            <span class="sr-only"> < </span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                            <span class="sr-only"> > </span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!--슬라이드 끝-->
        
    </section>
    <!--  -->
    
    <div class="middle-body">
    
    <hr class="homeboard-main" style: color="#c0e1f5" size="6px">
    <div class="homeboard clearfix">
        <div class="bestboard">
            <div class="in-box">
                <h4 class="best">인기 게시글</h4>
                <h3 class="best-more"><a href="<c:url value='/board/boardListPage' />" class="moreview">더보기</a></h3>
            </div>
            <ul class="best-list">
            	<c:forEach var="vo" items="${bestList}">
	                <a href='<c:url value="/board/boardDetailPage/${vo.boardNum}"/>'>
	                    <li class="hot-new clearfix">
	                        <p class="writing">
	                            ${vo.boardTitle}
	                            <img src="image/icon_hot.png" alt="" width="20px">
	                        </p>
	                        <p class="date"><fmt:formatDate value="${vo.boardDate}" pattern="yyyy.MM.dd HH:mm" /></p>
	                    </li>
	                </a>
                </c:forEach>
            </ul>
        </div>
        <div class="recentboard">
            <div class="in-box">
                <h4 class="best">최신 게시글</h4>
                <h3 class="best-more"><a href='<c:url value='/board/boardListPage' />' class="moreview">더보기</a></h3>
            </div>
            <ul class="recent-list">
            	<c:forEach var="vo" items="${recentList}">
                <a href='<c:url value="/board/boardDetailPage/${vo.boardNum}"/>'>
                    <li class="hot-new clearfix">
                        <p class="writing">
                            ${vo.boardTitle}
                            <img src="image/icon_new.gif" alt="" width="25px">
                        </p>
                        <p class="date"><fmt:formatDate value="${vo.boardDate}" pattern="yyyy.MM.dd HH:mm" /></p>
                    </li>
                </a>
                </c:forEach>
            </ul>
        </div>
    </div>
    <hr color="#c0e1f5" size="6px" >
    <div class="homegigu" style="display: inline-block;">
        <h4 style="float: left;">인기 기구</h4>
        <h3 style="float: right;"><a href='<c:url value="/product/productListPage"/>' class="moreview">더보기</a></h3>
        <ul style="clear: both; display: flex; list-style: none; margin-left: 10px;">
        <c:forEach var="vo" items="${bestProduct}">
            <li>
                <a href='<c:url value="product/productDetailPage?proNum=${vo.proNum}"/>'>
                    <div>
                        <img src="<c:url value='/product/display?filePath=${vo.proImage}' />" alt="" class="product">
                        <div class="best-homegigu-pic-box">
                            <h5 style="float: left;">${vo.proName}</h5>
                            <h5 style="float: right;">${vo.proPrice}</h5>
                        </div>
                    </div>
                </a>
            </li>
        </c:forEach>
        </ul>
    </div>
    
    
    <hr class="footerhr" color="gainsboro" size="6px" style="margin-top: 5px;">
</div>
<%@include file="../include/footer.jsp" %>


</html>

 <script>
 

	const msg = '${msg}'
   		if(msg === "success"){
   			alert('회원 정보 수정 완료')
   		}else if(msg === "logoutSuccess"){
   			alert('로그아웃이 완료되었습니다')
   		}
   			
	const delmsg = '${msg}'
   		if(delmsg === "delSuccess"){
   			alert('회원 탈퇴가 완료되었습니다.')
   		
   		}
	</script>