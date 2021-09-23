<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp" %>
  
    <div class="orderDetail-main-div">
        <div class="orderDetail-sub-div">
            <form action="#">
                <div id="orderDetail-first-table" class="orderDetail-table-box">
                    
                    
                    <div class="orderDetail-order">주문 상세 내역</div>
                    <button type="button" class="orderDetail-prevBtn" onclick="location.href='<c:url value="/order/orderListPage" />'">주문 목록 보기<span>▶</span></button>
                    <div id="orderDetail-second-table" class="orderDetail-table-box">
                        <span class="orderDetail-order-main">주문 정보</span>
                        <table class="orderDetail-main-table2"  >
                            <tr class="orderDetail-table-tr">
                                <td class="orderDetail-table-td">주문 번호</td>
                                <td>${OrderProduct.o_num}</td>
                            </tr>
                            <tr class="orderDetail-table-tr">
                                <td class="orderDetail-table-td">주문 날짜</td>
                                <td>${OrderProduct.o_date}</td>
                            </tr>
                            <tr class="orderDetail-table-tr">
                                <td class="orderDetail-table-td">주문한 사람</td>
                                <td>${OrderProduct.o_sendId}</td>
                            </tr>
                        </table>
                    </div>

                    <div id="orderDetail-second-table" class="orderDetail-table-box">
                        <span class="orderDetail-order-main">배송지 정보</span>
                        <table class="orderDetail-main-table2">
                            <tr class="orderDetail-table-tr">
                                <td class="orderDetail-table-td">수취인</td>
                                <td>${OrderProduct.o_receiveName}</td>
                            </tr>
                            <tr class="orderDetail-table-tr">
                                <td class="orderDetail-table-td">주소</td>
                                <td>${OrderProduct.o_address}&nbsp;${OrderProduct.o_detailAddress}</td>
                            </tr>
                            <tr class="orderDetail-table-tr">
                                <td class="orderDetail-table-td">연락처</td>
                                <td>${OrderProduct.o_pNum}</td>
                            </tr>
                        </table>
                    </div>
                    <div id="orderDetail-third-table" class="orderDetail-table-box">
                        <span class="orderDetail-order-main">결제 정보</span>
                        <table class="orderDetail-main-table2">
                            
                            <tr class="orderDetail-table-tr">
                                <td class="orderDetail-table-td">결제 금액</td>
                                <td>${OrderProduct.o_totalPrice}</td>
                            </tr>
                            <tr class="orderDetail-table-tr">
                                <td class="orderDetail-table-td">결제 방법</td>
                                <td>${OrderProduct.o_method}</td>
                            </tr>
                            
                            
                        </table>
                    </div>
                                      
                </div>
            </form>
        </div>
    </div>




<!-- 푸터 -->
    <%@ include file="../include/footer.jsp" %>