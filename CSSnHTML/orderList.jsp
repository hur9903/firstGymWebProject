<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="./include/header.jsp" %>>
    
    <!-- 헤더. jsp전환시 삭제 후 include 사용 -->

    <div class="orderList-main-div">
        <section class="orderList">
            <div>
                <h3>구매내역</h3>
            </div>
        
        <div class="style">
            <ul class="list">
                    <li class="out-box">
                        <div class="number-box">
                            <a href="#" class="order-number">0004</a>
                        </div>
                        <div class="pic-box">
                            <img src="image/1.png" alt="" class="pic">
                        </div>
                        <div class="order-info">
                            <div class="product-title">
                                <a href="#" class="dumbel">아령 덤벨</a>
                            </div>
                            <div class="product-price">
                                <a class="price">73,200원</a>
                                <a class="date">2021.03.27</a>
                            </div>
                            <div class="type">
                                <a href="#">웨이트</a>
                            </div>
                        </div>
                        <div class="seller-info">
                                <span class="seller">퍼스트짐</span>
                                <a href="#" class="qna-btn">문의하기</a>
                        </div>
                    </li>
                    <li class="out-box">
                        <div class="number-box">
                            <a href="#" class="order-number">0003</a>
                        </div>
                        <div class="pic-box">
                            <img src="image/2.png" alt="" class="pic">
                        </div>
                        <div class="order-info">
                            <div class="product-title">
                                <a href="#" class="dumbel">폼롤러</a>
                            </div>
                            <div class="product-price">
                                <a class="price">20,000원</a>
                                <a class="date">2020.12.19</a>
                            </div>
                            <div class="type">
                                <a href="#">요가필라테스</a>
                            </div>
                        </div>
                        <div class="seller-info">
                                <span class="seller">퍼스트짐</span>
                                <a href="#" class="qna-btn">문의하기</a>
                        </div>
                    </li>
                    <li class="out-box">
                        <div class="number-box">
                            <a href="#" class="order-number">0002</a>
                        </div>
                        <div class="pic-box">
                            <img src="image/3.png" alt="" class="pic">
                        </div>
                        <div class="order-info">
                            <div class="product-title">
                                <a href="#" class="dumbel">요가매트</a>
                            </div>
                            <div class="product-price">
                                <a class="price">224,600원</a>
                                <a class="date">2020.07.24</a>
                            </div>
                            <div class="type">
                                <a href="#">요가필라테스</a>
                            </div>
                        </div>
                        <div class="seller-info">
                                <span class="seller">퍼스트짐</span>
                                <a href="#" class="qna-btn">문의하기</a>
                        </div>
                    </li>
                    <li class="out-box">
                        <div class="number-box">
                            <a href="#" class="order-number">0001</a>
                        </div>
                        <div class="pic-box">
                            <img src="image/4.png" alt="" class="pic">
                        </div>
                        <div class="order-info">
                            <div class="product-title">
                                <a href="#" class="dumbel">스텝퍼</a>
                            </div>
                            <div class="product-price">
                                <a class="price">42,700원</a>
                                <a class="date">2020.01.08</a>
                            </div>
                            <div class="type">
                                <a href="#">유산소</a>
                            </div>
                        </div>
                        <div class="seller-info">
                                <span class="seller">퍼스트짐</span>
                                <a href="#" class="qna-btn">문의하기</a>
                        </div>
                    </li>
            </ul>
        </div>
    </section>
        <div class="paging">
            <div class="pagination">
                <a class="prev" href="#"></a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a class="next" href="#"></a>        
            </div>
        </div>
    
    </div>
    
    <!-- 푸터. jsp전환시 삭제 후 include 사용 -->
    
    <%@ include file="./include/footer.jsp" %>
    <!-- 푸터. jsp전환시 삭제 후 include 사용 -->
