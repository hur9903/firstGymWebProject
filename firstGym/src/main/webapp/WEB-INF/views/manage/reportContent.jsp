<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp" %>
<div class="report">
        <div class="report-sub-div">
            <div class="report-page-title">
                신고 내용
            </div>
            <div class="report-content-main-div">
                <hr>
                <div class="boardContent-updonw-padding-div boardContent-clearfix">
                    <div class="boardContent-float-left">
                        <button class="report-btn-big">목록</button>
                    </div>
                    <div class="boardContent-float-right">
                    	<form id="accept-form" action="<c:url value="/manage/reportAccept" />" method="post" style="display: inline-block;">
                        	<input type="hidden" name="boardNum" value="${report.boardNum}">
                        	<button type="button" class="report-btn-big2" id="accept">승낙</button>
                        </form>
                        <form id="refuse-form" action="<c:url value="/manage/reportRefuse" />" method="post" style="display: inline-block;">
	                        <input type="hidden" name="reportNum" value="${report.reportNum}">
                        	<button type="button" class="report-btn-big2" id="refuse">거절</button>
                        </form>
                    </div>
                </div>
                <hr>
                <div class="report-cat boardContent-clearfix">
                    <div class="report-float-left">
                        신고 사유
                    </div>
                    
                </div>
                <hr>
                <div class="boardContent-updonw-padding-div boardContent-clearfix">
                    <div class="boardContent-float-left">
                        <small>등록일: <fmt:formatDate value="${report.reportDate}" pattern="yyyy.MM.dd HH:mm:ss" /></small>
                    </div>
                    <div class="boardContent-float-right">
                        <small>신고자 : ${report.userId}</small>
                    </div>
                </div>
                <hr>
                <div class="boardContent-content-sub-div">
                   
                    <!-- 컨텐츠 영역 -->
                    <div class="report-content-area-div">
                        <div class="boardContent-content-div">
                           
                             
		            	신고 사유:    
		            <c:if test="${report.reportContent == 'reason1'}">부적절한 홍보 게시글</c:if>
	                <c:if test="${report.reportContent == 'reason2'}">음란성 또는 청소년에게 부적합한 내용</c:if>
	                <c:if test="${report.reportContent == 'reason3'}">비방/욕설 게시글</c:if>
	                <c:if test="${report.reportContent == 'reason4'}">도배성 게시글</c:if>	                  
		            <br><br>        
                	<button class="report-btn-big" id="show-article-btn">게시글 보기</button>
                    </div>
                   
                </div>
            </div>
        </div>        
    </div>
    
    <%@ include file="../include/footer.jsp" %>
    
    <script>
    
    let open;
    
    $('#show-article-btn').click(function(){
    	open = window.open('<c:url value="/board/boardDetailPage" />/${report.boardNum}', '신고된 게시글', 'width=700px,height=800px,scrollbars=yes');
    });
    $('#accept').click(function(){
    	$('#accept-form').submit();
    });
    $('#refuse').click(function(){
    	$('#refuse-form').submit();
    });
    </script>