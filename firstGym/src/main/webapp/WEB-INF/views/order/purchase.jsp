<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
    <!-- 헤더. jsp전환시 삭제 후 include 사용 제이쿼리 -->

    <div class="purchase-main-div">
        <div class="purchase-sub-div">
            <form action="<c:url value='/order/purchase?p_num=${product.p_num}' />" name="payForm" method="post">
            	<input type="hidden" name="o_sendId" value="heoheo">
                <div id="purchase-first-table" class="purchase-table-box">
                    
                    
                    <div class="purchase-order">주문서 작성</div><button class="purchase-prevBtn">이전페이지 <span>▶</span></button>
                    ! 상품의 수량 변경은 상품상세 페이지에서 가능합니다.
             
                    <table class="purchase-main-table1">
                            <tr class="purchase-table-tr" >
                                <td class="purchase-table-td2">이미지</td>
                                <td class="purchase-table-td3">판매가</td>
                                <td class="purchase-table-td4">수량</td>
                                <td class="purchase-table-td5">배송구분</td>
                                <td class="purchase-table-td6">배송비</td>
                                <td class="purchase-table-td7">합계</td>
                            </tr>
                            <tr>
                                <td rowspan="3"><div class="purchase-img"><img src="image/sample-image3.jpg" alt=""></div></td>
                                <td><fmt:parseNumber value="${product.p_price}" var="p1" />${p1}원</td>
                                <td><fmt:parseNumber value="1" var="a" />${a}</td>
                                <td>${product.p_method}</td>
                                <td><fmt:parseNumber value="${product.p_sendPrice}" var="p2" />${p2}원</td>
                                <td><input type="number" id="totalPrice1" readonly>원</td>
                                <tr class="purchase-table-tr" >
                                    <td colspan="5" class="purchase-table-td ">상품명</td>
                                </tr>
                                <tr>
                                    <td colspan="5">${product.p_name}</td>
                                
                                </tr>
                            </tr>
                        </table>
                       
                            <div class="purchase-span">상품구매금액&nbsp;(${product.p_price})&nbsp;+ 배송비&nbsp;(${product.p_sendPrice}) =  <span class="purchase-total">합계 : (<input type="number" id="totalPrice2" readonly>) 원</span></div>
                        
                        
                </div>
                <div id="purchase-second-table" class="purchase-table-box">
                    <span class="purchase-order-main">주문자 정보</span>
                    <table class="purchase-main-table2">
                        <tr class="purchase-table-tr">
                            <td class="purchase-table-td">이름</td>
                            <td><input type="text" name="o_sendName" class="purchase-input-full-width"></td>
                        </tr>
                        <tr class="purchase-table-tr">
                            <td class="purchase-table-td">휴대전화</td>
                            <td><input type="text" name="o_pNum" class="purchase-input-full-width"></td>
                        </tr>
                        <tr class="purchase-table-tr">
                            <td class="purchase-table-td">이메일</td>
                            <td><input type="email" name="o_email" class="purchase-input-full-width"></td>
                        </tr>
                    </table>
                </div>
                <div id="purchase-third-table" class="purchase-table-box">
                    <span class="purchase-order-main">배송 정보</span>
                    <table class="purchase-main-table2">
                        
                        <tr class="purchase-table-tr">
                            <td class="purchase-table-td">받으시는 분</td>
                            <td><input type="text" name="o_receiveName" class="purchase-input-full-width"></td>
                        </tr>
                        <tr class="purchase-table-tr">
                            <td class="purchase-table-td">주소</td>
                            <td>
                                <input type="text" name="o_zipcode" class="purchase-input-small-width"><button class="purchase-mailBtn">우편번호</button><br>
                                <input type="text" name="o_address" class="purchase-input-full-width"><br>
                                <input type="text" name="o_detailAddress" class="purchase-input-full-width">
                            </td>
                        </tr>
                        
                        <tr class="purchase-table-tr">
                            <td class="purchase-table-td">배송메시지</td>
                            <td><textarea name="o_message" id="" cols="30" rows="10" placeholder=" 배송시 참고할 사항이 있으면 적어주십시오." class="purchase-input-full-width"></textarea></td>
                        </tr>
                    </table>
                </div>
                <div id="purchase-forth-table" class="purchase-table-box">
                    <span class="purchase-order-main">결제수단</span>
                    <table>
                        <thead>
                            <tr  class="purchase-main-table2">
                                <td colspan="3">
                                    <input type="radio" name="o_method" id="purchase-card" name="card" value="카드"> 신용 카드
                                    <input type="radio" name="o_method" id="purchase-time" name="time" value="계좌"> 실시간 계좌이체
                                    <input type="radio" name="o_method" id="purchase-bk" name="bk" value="무통장"> 무통장 입금
                                    <input type="radio" name="o_method" id="purchase-phone" name="phone" value="휴대폰"> 휴대폰 결제
                                    <input type="radio" name="o_method" id="purchase-kakao" name="kakao" value="카카오"> 카카오페이
                                </td>
                            </tr>
                        </thead>
                        
                        <!--카드결제-->
                            <tbody id="paymethod-card">
                                <tr class="purchase-table-tr purchase-main-table2" >
                                    <td>카드 선택</td>
                                    <td colspan="3">
                                        <select name="" id="">
                                            <option value="">선택해주세요</option>
                                            <option value="">선택해주세요</option>
                                            <option value="">선택해주세요</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr class="purchase-table-tr purchase-main-table2">
                                    <td class="purchase-table-td1">할부 기간</td>
                                    <td class="purchase-table-td2" colspan="3">
                                        <select name="" id="">
                                            <option value="">일시불</option>
                                            <option value="">일시불</option>
                                            <option value="">일시불</option>
                                        </select>
                                    </td>
                                </tr>
                            </tbody>

                            <!--실시간 계좌이체-->
                            <tbody id="paymethod-time">
                                <tr>
                                    <td  class="purchase-table-tr purchase-main-table2">현금영수증 발행</td>
                                    <td colspan="3" class="purchase-main-table2">
                                        <input type="radio" name="pay-time" id="ind">개인
                                        <input type="radio" name="pay-time" id="bus">사업자
                                        <input type="radio" name="pay-time" id="no">신청 안함 <br>
                                        <span id="ind-phone">휴대폰 번호 : <input type="text"><br>입력 시 '-' 없이 숫자만 입력하세요.</span>
                                        <span id="ind-bus">사업자 등록번호 : <input type="text"><br>입력 시 '-' 없이 숫자만 입력하세요.</span>
                                        <span id="ind-no"></span>
                                       
                                    </td>
                                </tr>

                                <tr class="purchase-table-tr purchase-main-table2">
                                    <td class="purchase-table-td1">예금주명</td>
                                    <td class="purchase-table-td2" colspan="3">
                                        <input type="text">
                                    </td>
                                </tr>
                            </tbody>

                            <!--무통장 입금-->
                            <tbody id="paymethod-bk">
                                <tr>
                                    <td class="purchase-table-tr purchase-main-table2">현금영수증 발행</td>
                                    <td colspan="3" class="purchase-main-table2">
                                        <input type="radio" name="pay-bk" id="ind-bk">개인
                                        <input type="radio" name="pay-bk" id="bus-bk">사업자
                                        <input type="radio" name="pay-bk" id="no-bk">신청 안함<br>
                                        <span id="ind-phonebk">휴대폰 번호 : <input type="text"><br>입력 시 '-' 없이 숫자만 입력하세요.</span>
                                        <span id="ind-busbk">사업자 등록번호 : <input type="text"><br>입력 시 '-' 없이 숫자만 입력하세요.</span>
                                        <span id="ind-nobk"></span>
                                    </td>
                                </tr>

                                <tr class="purchase-table-tr purchase-main-table2">
                                    <td class="purchase-table-td1">예금주명 <br> <br>
                                    입금은행
                                    </td>
                                    <td class="purchase-table-td2" colspan="3">
                                        <input type="text"> <br>
                                        <select name="" id="">
                                            <option value="">선택해주세요</option>
                                            <option value="">국민은행123456789 (주) 퍼스트짐</option>
                                            <option value="">신한은행1874216789 (주) 퍼스트짐</option>
                                        </select>
                                    </td>
                                </tr>
                            </tbody>

                        <tr class="purchase-main-table2">
                            <td rowspan="2" class="purchase-table-tr ">
                                최종 결제 금액
                            </td>
                            <td>
                                <input type="number" id="totalPrice3" name="o_totalPrice" readonly><!--(${product.p_price} + ${product.p_sendPrice})--> 원
                            </td>
                        </tr>
                    </table>
                        
                    <div class="purchase-check"><input type="checkbox" class="purchase-checkbox"> 결제서비스 약관에 모두 동의합니다.</div>
                               
                                                

                    <td rowspan="2" class="purchase-table-td3 purchase-align-center">
                        <button id="payBtn" class="purchase-payBtn">결제하기</button>
                    </td>
                </div>
            </form>
        </div>
    </div>

    <!-- 푸터. jsp전환시 삭제 후 include 사용 -->
    
<%@ include file="../include/header.jsp" %>
    <!-- 푸터. jsp전환시 삭제 후 include 사용 -->

    <script>
        const $paymethod_card = $('#paymethod-card');
        const $purchase_card = $('#purchase-card');
        const $paymethod_time = $('#paymethod-time');
        const $purchase_time = $('#purchase-time');
        const $paymethod_bk = $('#paymethod-bk');
        const $purchase_bk = $('#purchase-bk');
        const $paymethod_phone = $('#paymethod-phone');
        const $purchase_phone = $('#purchase-phone');
        const $paymethod_kakao = $('#paymethod-kakao');
        const $purchase_kakao = $('#purchase-kakao');
       
        const $ind = $('#ind');
        const $ind_phone = $('#ind-phone');
        const $bus = $('#bus');
        const $ind_bus = $('#ind-bus');
        const $no = $('#no');
        const $ind_no = $('#ind-no');

        const $indbk = $('#ind-bk');
        const $ind_phonebk = $('#ind-phonebk');
        const $busbk = $('#bus-bk');
        const $ind_busbk = $('#ind-busbk');
        const $nobk = $('#no-bk');
        const $ind_nobk = $('#ind-nobk');
        
        const $tp1 = $('#totalPrice1');
        $tp1.val(${p1} * ${a} + ${p2});
        const $tp2 = $('#totalPrice2');
        $tp2.val(${p1} * ${a} + ${p2});
        const $tp3 = $('#totalPrice3');
        $tp3.val(${p1} * ${a} + ${p2});
        
        $paymethod_card.hide();
        $paymethod_time.hide();
        $paymethod_bk.hide();
        
        $ind_phone.hide();
        $ind_bus.hide();
        $ind_phonebk.hide();
        $ind_busbk.hide();

        //신용카드------------------------------------------
        $purchase_card.click(function(){
            $paymethod_card.show();
            $paymethod_time.hide();
            $paymethod_bk.hide();
        })

        //실시간 계좌이체-----------------------------------
        $purchase_time.click(function(){
            $paymethod_time.show();
            $paymethod_card.hide();
            $paymethod_bk.hide();
        })

        //현금영수증-개인
        $ind.click(function(){
            $ind_phone.show();
            $ind_bus.hide();
        })
        //현금영수증-사업자
        $bus.click(function(){
            $ind_bus.show();
            $ind_phone.hide();
        })
        //현금영수증-안함
        $no.click(function(){
            $ind_phone.hide();
        $ind_bus.hide();
        })

        //무통장 입금-------------------------------------
        $purchase_bk.click(function(){
            $paymethod_bk.show();
            $paymethod_card.hide();
            $paymethod_time.hide();
        })
        //현금영수증-개인
        $indbk.click(function(){
            $ind_phonebk.show();
            $ind_busbk.hide();
        })
        //현금영수증-사업자
        $busbk.click(function(){
            $ind_busbk.show();
            $ind_phonebk.hide();
        })
        //현금영수증-안함
        $nobk.click(function(){
            $ind_phonebk.hide();
        $ind_busbk.hide();
        })

        //휴대폰 결제----------------------------------------------
        $purchase_phone.click(function(){
            $paymethod_card.hide();
            $paymethod_time.hide();
            $paymethod_bk.hide();
        })

        //카카오페이------------------------------------------------
        $purchase_kakao.click(function(){
            $paymethod_card.hide();
            $paymethod_time.hide();
            $paymethod_bk.hide();
        })
        
        const payBtn = document.getElementById("payBtn");
        payBtn.onclick = function() {
        	if(document.payForm.o_sendName.value === '') {
        		alert('주문자는 필수 항목입니다.');
        		document.payForm.o_sendName.focus();
        		return;
        	}
        	else if(document.payForm.o_pNum.value === '') {
        		alert('휴대폰번호는 필수 항목입니다.');
        		document.payForm.o_pNum.focus();
        		return;
        	}
        	else if(document.payForm.o_email.value === '') {
        		alert('이메일는 필수 항목입니다.');
        		document.payForm.o_email.focus();
        		return;
        	}
        	else if(document.payForm.o_receiveName.value === '') {
        		alert('받는 사람은 필수 항목입니다.');
        		document.payForm.o_receiveName.focus();
        		return;
        	}
        	else if(document.payForm.o_address.value === '') {
        		alert('주소는 필수 항목입니다.');
        		document.payForm.o_address.focus();
        		return;
        	}
        	else if(document.payForm.o_detailAddress.value === '') {
        		alert('상세 주소는 필수 항목입니다.');
        		document.payForm.o_detailAddress.focus();
        		return;
        	}
        	else if(document.payForm.o_message.value === '') {
        		alert('메시지는 필수 항목입니다.');
        		document.payForm.o_message.focus();
        		return;
        	}
        	else {
        		document.payForm.submit();
        	}
        	
        }




    </script>


