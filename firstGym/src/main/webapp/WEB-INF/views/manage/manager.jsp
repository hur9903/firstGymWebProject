<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="../include/header.jsp" %>


    
    <div class="manager-main-div">
        <div class="manager-sub-div">
            <form action="#">
                <div id="manager-first-table" class="manager-table-box">
                    
                    
                    <div class="manager-order">관리자 화면</div>
                    <button class="manager-write">작성하기</button>
                    <div class="manager-table-box">
                        <span class="manager-order-main">공지 사항</span>
                        <table class="manager-main-table2" border="1px solid black">
                            <tr class="manager-table-tr">
                                <td class="manager-table-td1">번호</td>
                                <td class="manager-table-td1-2">제목</td>
                                <td class="manager-table-td1-3">작성일</td>
                            </tr>
                            <tr class="manager-table-tr2">
                                <td class="manager-table-td2">1</td>
                                <td style="font-weight: bold;"><a href="#">안녕하세요</a></td>
                                <td>2021-09-27</td>
                            </tr>
                            <tr class="manager-table-tr2">
                                <td class="manager-table-td2">1</td>
                                <td style="font-weight: bold;"><a href="#">안녕하세요</a></td>
                                <td>2021-09-27</td>
                            </tr>
                            
                            
                        </table>
                    </div>
                    <!-- 페이징 바 -->
                    <div class="manager-paging-div">
                        <ul>
                            <!-- 이전버튼  -->
                            <a href=""><li class="manager-btn-not-check">&lt;</li></a>
                            <!-- 페이지 버튼(체크되면 class이름 변경) -->
                            <a href=""><li class="manager-btn-check">1</li></a>
                            <a href=""><li class="manager-btn-not-check">2</li></a>
                            <a href=""><li class="manager-btn-not-check">3</li></a>
                            <a href=""><li class="manager-btn-not-check">4</li></a>
                            <a href=""><li class="manager-btn-not-check">5</li></a>
                            <a href=""><li class="manager-btn-not-check">6</li></a>
                            <a href=""><li class="manager-btn-not-check">7</li></a>
                            <a href=""><li class="manager-btn-not-check">8</li></a>
                            <a href=""><li class="manager-btn-not-check">9</li></a>
                            <a href=""><li class="manager-btn-not-check">10</li></a>
                                
                            <!-- 다음버튼 -->
                            <a href=""><li class="manager-btn-not-check">&gt;</li></a>

                        </ul>
                    </div>
                    
                    <div class="manager-table-box2">
                        <span class="manager-order-main">신고 목록</span>
                        <table class="manager-main-table2" border="1px solid black">
                            <tr class="manager-table-tr">
                                <td class="manager-table-td1">번호</td>
                                <td class="manager-table-td2-1">제목</td>
                                <td class="manager-table-td2-2">신고자</td>
                                <td class="manager-table-td2-3">신고일</td>
                            </tr>
                            <tr class="manager-table-tr2">
                                <td class="manager-table-td2"></td>
                                <td><a href="#"></a></td>
                                <td  style="font-weight: bold;"></td>
                                <td></td>
                            </tr>
                           
                        </table>                
                    </div>
                    <!-- 페이징 바 -->
                    <div class="manager-paging-div">
                        <ul>
                            <!-- 이전버튼  -->
                            <a href=""><li class="manager-btn-not-check">&lt;</li></a>
                            <!-- 페이지 버튼(체크되면 class이름 변경) -->
                            <a href=""><li class="manager-btn-check">1</li></a>
                            <a href=""><li class="manager-btn-not-check">2</li></a>
                            <a href=""><li class="manager-btn-not-check">3</li></a>
                            <a href=""><li class="manager-btn-not-check">4</li></a>
                            <a href=""><li class="manager-btn-not-check">5</li></a>
                            <a href=""><li class="manager-btn-not-check">6</li></a>
                            <a href=""><li class="manager-btn-not-check">7</li></a>
                            <a href=""><li class="manager-btn-not-check">8</li></a>
                            <a href=""><li class="manager-btn-not-check">9</li></a>
                            <a href=""><li class="manager-btn-not-check">10</li></a>
                                
                            <!-- 다음버튼 -->
                            <a href=""><li class="manager-btn-not-check">&gt;</li></a>

                        </ul>
                    </div>
            </form>
        </div>
    </div>

   
    <%@ include file="../include/footer.jsp" %>