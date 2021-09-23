<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp" %>>
    
    <!-- 헤더. jsp전환시 삭제 후 include 사용 -->

    <div class="orderList-main-div">
        <section class="orderList">
            <div>
                <h3>구매내역</h3>
            </div>
        
        <div class="style">
            <ul class="list">
            	<c:forEach var="vo" items="${OrderProductList}">
                    <li class="out-box">
                        <div class="number-box">
                            <a href="<c:url value='/order/orderDetailPage?o_num=${vo.o_num}' />" class="order-number">${vo.o_num}</a>
                        </div>
                        <div class="pic-box">
                            <img src="image/1.png" alt="" class="pic">
                        </div>
                        <div class="order-info">
                            <div class="product-title">
                                <a href="#" class="dumbel">${vo.p_name}</a>
                            </div>
                            <div class="product-price">
                                <a class="price">${vo.o_productPrice}</a>
                                <a class="date">${vo.o_productDate}</a>
                            </div>
                            <div class="type">
                                <a href="#">${vo.o_productCategory}</a>
                            </div>
                        </div>
                        <div class="seller-info">
                                <span class="seller">퍼스트짐</span>
                                <a href="#" class="qna-btn">문의하기</a>
                        </div>
                    </li>
             	</c:forEach>
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
    
    <%@ include file="../include/footer.jsp" %>
    <!-- 푸터. jsp전환시 삭제 후 include 사용 -->
