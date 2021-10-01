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
                            <a href="<c:url value='/order/orderDetailPage?orderNum=${vo.orderNum}' />" class="order-number">${vo.orderNum}</a>
                        </div>
                        <div class="pic-box">
                            <img src="<c:url value='/product/display?filePath=${vo.proImage}' />" alt="" class="pic">
                        </div>
                        <div class="order-info">
                            <div class="product-title">
                                <a href="#" class="dumbel">${vo.proName}</a>
                            </div>
                            <div class="product-price">
                                <a class="price">${vo.orderTotalPrice}</a>
                                <a class="date">${vo.orderDate}</a>
                            </div>
                            <div class="type">
                                <a href="#">${vo.orderCategory}</a>
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
        <div class="boardList-paging-div">
	            <form action="<c:url value="/order/orderListPage" />" id="page-form">
	            	<input id="page-pn" type="hidden" name="pageNum" value="${page.pageNum}">
	                <ul>
	                    <!-- 이전버튼  -->
	                    <c:if test="${page.prev}">
	                    	<a href=""><li class="boardList-btn-not-check" data-pn="${page.beginPageNum-1}">&lt;</li></a>
	                    </c:if>
	                    <!-- 페이지 버튼(체크되면 class이름 변경) -->
	                    <c:forEach var="num" begin="${page.beginPageNum}" end="${page.endPageNum}">
		                    <a href="#"><li class="${page.pageNum == num ? 'boardList-btn-check' : 'boardList-btn-not-check'}" data-pn="${num}">${num}</li></a>
		                </c:forEach>
	                    <!-- 다음버튼 -->
	                    <c:if test="${page.next}">
	                    	<a href=""><li class="boardList-btn-not-check" data-pn="${page.endPageNum+1}">&gt;</li></a>
						</c:if>
	                </ul>
                </form>
            </div>
    
    </div>
    
    <!-- 푸터. jsp전환시 삭제 후 include 사용 -->
    
    <%@ include file="../include/footer.jsp" %>
    <!-- 푸터. jsp전환시 삭제 후 include 사용 -->
    
    <script>
    const noOrderMsg = '${noOrderMsg}'
    if(noOrderMsg === 'noOrderMsg') {
    	alert("존재하지 않는 주문번호입니다.");
    }
    
  //페이지버튼
	
	$('#page-form a').click(function(event){
		event.preventDefault();
		$('#page-pn').val(event.target.getAttribute("data-pn"));
		$('#page-form').submit();
	});
	</script>
