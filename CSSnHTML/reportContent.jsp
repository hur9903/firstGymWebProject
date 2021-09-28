<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                        
                        <button class="report-btn-big2">삭제</button>
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
                        <small>등록일: 2021.09.01</small>
                    </div>
                    <div class="boardContent-float-right">
                        <small>신고자 : 신고자</small>
                    </div>
                </div>
                <hr>
                <div class="boardContent-content-sub-div">
                   
                    <!-- 컨텐츠 영역 -->
                    <div class="report-content-area-div">
                        <div class="boardContent-content-div">
                           신고 내용
                        
                    </div>
                   
                </div>
            </div>
        </div>        
    </div>
    <%@include file="../include/footer.jsp" %>
</html>