<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp" %>
    <!-- 헤더. jsp전환시 삭제 후 include 사용 제이쿼리 -->

    <div class="purchase-main-div">
        <div class="purchase-sub-div">
            <form action="<c:url value='/order/purchase?proNum=${product.proNum}' />" name="payForm" method="post">
            	<input type="hidden" name="orderSendId" value="${user.userId}">
                <div id="purchase-first-table" class="purchase-table-box">
                    
                    
                    <div class="purchase-order">주문서 작성</div><button type="button" class="purchase-prevBtn" onclick="location.href='<c:url value='/product/productDetailPage?proNum=${product.proNum}' />';">이전페이지 <span>▶</span></button>
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
                                <td><fmt:parseNumber value="${product.proPrice}" var="p1" />${p1}원</td>
                                <td><fmt:parseNumber value="${quantity}" var="a" />${a}</td>
                                <td>${product.proMethod}</td>
                                <td><fmt:parseNumber value="${product.proSendPrice}" var="p2" />${p2}원</td>
                                <td><input type="number" id="totalPrice1" readonly>원</td>
                                <tr class="purchase-table-tr" >
                                    <td colspan="5" class="purchase-table-td ">상품명</td>
                                </tr>
                                <tr>
                                    <td colspan="5">${product.proName}</td>
                                
                                </tr>
                            </tr>
                        </table>
                       
                            <div class="purchase-span">상품구매금액&nbsp;(${product.proPrice})&nbsp; +&nbsp; 수량&nbsp;(${quantity})&nbsp; +&nbsp; 배송비&nbsp;(${product.proSendPrice}) =  <span class="purchase-total">합계 : (<input type="number" id="totalPrice2" readonly>) 원</span></div>
                        
                        
                </div>
                <div id="purchase-second-table" class="purchase-table-box">
                    <span class="purchase-order-main">주문자 정보</span>
                    <table class="purchase-main-table2">
                        <tr class="purchase-table-tr">
                            <td class="purchase-table-td">이름</td>
                            <td><input type="text" name="orderSendName" class="purchase-input-full-width" value="${user.userName}"></td>
                        </tr>
                        <tr class="purchase-table-tr">
                            <td class="purchase-table-td">휴대전화</td>
                            <td><input type="text" name="orderPNum" class="purchase-input-full-width" value="${user.userPhone}"></td>
                        </tr>
                        <tr class="purchase-table-tr">
                            <td class="purchase-table-td">이메일</td>
                            <td><input type="email" name="orderEmail" class="purchase-input-full-width" value="${user.userEmail}"></td>
                        </tr>
                    </table>
                </div>
                <div id="purchase-third-table" class="purchase-table-box">
                    <span class="purchase-order-main">배송 정보</span>
                    <table class="purchase-main-table2">
                        
                        <tr class="purchase-table-tr">
                            <td class="purchase-table-td">받으시는 분</td>
                            <td><input type="text" name="orderReceiveName" class="purchase-input-full-width" value="${user.userName}"></td>
                        </tr>
                        <tr class="purchase-table-tr">
                            <td class="purchase-table-td">주소</td>
                            <td>
                                <input id="userMail" type="text" name="orderZipcode" class="purchase-input-small-width" value="${user.userMail}" readonly><button type="button" id="addBtn" class="purchase-mailBtn" onclick="searchAddress()">우편번호</button><br>
                                <input id="userAddr1" type="text" name="orderAddress" class="purchase-input-full-width" value="${user.userAddr1}" readonly><br>
                                <input id="userAddr2" type="text" name="orderDetailAddress" class="purchase-input-full-width" value="${user.userAddr2}">
                            </td>
                        </tr>
                        
                        <tr class="purchase-table-tr">
                            <td class="purchase-table-td">배송메시지</td>
                            <td><textarea name="orderMessage" id="" cols="30" rows="10" placeholder=" 배송시 참고할 사항이 있으면 적어주십시오." class="purchase-input-full-width"></textarea></td>
                        </tr>
                    </table>
                </div>
                <div id="purchase-forth-table" class="purchase-table-box">
                    <span class="purchase-order-main">결제수단</span>
                    <table>
                        <thead>
                            <tr  class="purchase-main-table2">
                                <td colspan="3">
                                    <input type="radio" name="orderMethod" id="purchase-card" name="card" value="카드"> 신용 카드
                                    <input type="radio" name="orderMethod" id="purchase-time" name="time" value="계좌"> 실시간 계좌이체
                                    <input type="radio" name="orderMethod" id="purchase-bk" name="bk" value="무통장"> 무통장 입금
                                    <input type="radio" name="orderMethod" id="purchase-phone" name="phone" value="휴대폰"> 휴대폰 결제
                                    <input type="radio" name="orderMethod" id="purchase-kakao" name="kakao" value="카카오"> 카카오페이
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
                                <input type="number" id="totalPrice3" name="orderTotalPrice" readonly><!--(${product.proPrice} + ${product.proSendPrice})--> 원
                            </td>
                        </tr>
                    </table>
                        
                    <div class="purchase-check"><input type="checkbox" id="chBox" class="purchase-checkbox"> 결제서비스 약관에 모두 동의합니다.</div>
                               
                                                

                    <td rowspan="2" class="purchase-table-td3 purchase-align-center">
                        <button type="button" id="payBtn" class="purchase-payBtn">결제하기</button>
                    </td>
                </div>
            </form>
        </div>
    </div>

    <!-- 푸터. jsp전환시 삭제 후 include 사용 -->
    
<%@ include file="../include/footer.jsp" %>
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
        const chBox = document.getElementById("chBox");
        payBtn.onclick = function() {
        	if(document.payForm.orderSendName.value === '') {
        		alert('주문자는 필수 항목입니다.');
        		document.payForm.orderSendName.focus();
        		return;
        	}
        	else if(document.payForm.orderPNum.value === '') {
        		alert('휴대폰번호는 필수 항목입니다.');
        		document.payForm.orderPNum.focus();
        		return;
        	}
        	else if(document.payForm.orderEmail.value === '') {
        		alert('이메일는 필수 항목입니다.');
        		document.payForm.orderEmail.focus();
        		return;
        	}
        	else if(document.payForm.orderReceiveName.value === '') {
        		alert('받는 사람은 필수 항목입니다.');
        		document.payForm.orderReceiveName.focus();
        		return;
        	}
        	else if(document.payForm.orderAddress.value === '') {
        		alert('주소는 필수 항목입니다.');
        		document.payForm.orderAddress.focus();
        		return;
        	}
        	else if(document.payForm.orderDetailAddress.value === '') {
        		alert('상세 주소는 필수 항목입니다.');
        		document.payForm.orderDetailAddress.focus();
        		return;
        	}
        	else if(document.payForm.orderMessage.value === '') {
        		alert('메시지는 필수 항목입니다.');
        		document.payForm.orderMessage.focus();
        		return;
        	}
        	else if(chBox.checked === false) {
        		alert('약관에 동의하셔야 합니다.');
        		chBox.focus();
        		return;
        	}
        	else {
        		document.payForm.submit();
        	}
        	
        }
        
        function searchAddress() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수

                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
                   
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('userMail').value = data.zonecode;
                    document.getElementById("userAddr1").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("userAddr2").focus();
                }
            }).open();
        }




    </script>


