
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp" %>

    <div id="productDetail-div">
        <!-- 상단 제품 정보 -->
        <div class="product-detail">
           <div class="product-imgArea">
               <div class="keyImg">
                   <img class="image" src="<c:url value='/product/display?filePath=${itemInfo.proImage}' />">
               </div>
           </div>
           <div class="info-area">
            <h3>${itemInfo.proName}</h3>
            <div class="detail">
                <table class="basic-info" summary>
                    <caption>기본 정보</caption>
                    <tbody>
                        <tr class="record">
                            <th scope="row">
                                <span class="product-title">상품명</span>
                            </th>
                            <td class="title">${itemInfo.proName}</td>
                        </tr>
                        <tr class="record">
                            <th scope="row">
                                <span>제조사</span>
                            </th>
                            <td>${itemInfo.proCompany}</td>
                        </tr>
                        <tr class="record">
                            <th scope="row">
                                <span>원산지</span>
                            </th>
                            <td>${itemInfo.proCountry}</td>
                        </tr>
                        <tr class="record">
                            <th scope="row">
                                <span>배송비</span>
                            </th>
                            <td>${itemInfo.proSendPrice}원</td>
                        </tr>
                        <tr class="record">
                            <th scope="row">
                                <span>판매가</span>
                            </th>
                            <td>${itemInfo.proPrice}원</td>
                        </tr>
                    </tbody>
                </table>
                <div class="total-products">
                    <p class="info">
                        <img src="${pageContext.request.contextPath }/resources/image/ExclamationMark.gif" alt="">
                        수량을 선택해 주세요.
                    </p>
                    <table summary>
                        <caption>상품목록</caption>
                        <colgroup>
                            <col style="width: 202px;">
                            <col style="width: 85px;">
                            <col style="width: 85px;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th scope="col">상품명</th>
                                <th scope="col">상품수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>${itemInfo.proName}</td>
                                <td>
                                    <span class="quantity">
                                        <input id="quantity" name="quantity-opt" value="1" type="text" readonly>
                                        <a href="#" id="quantity-up">
                                        <img src="${pageContext.request.contextPath }/resources/image/quantityUp.gif" alt="수량증가" class="quantity-up">
	                                    </a>
	                                    <a href="#" id="quantity-down">
	                                        <img src="${pageContext.request.contextPath }/resources/image/quantityDown.gif" alt="수량감소" class="quantity-down">
	                                    </a>

                                    </span>
                                </td>
                                <td class="right" style="width: 70px;">
                                    <span class="quantity-price">                                    
                                        <input type="hidden" id="total-price" name="option-box-price" class="option-box-price" value="${itemInfo.proPrice}">
                                    </span>
                                </td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="3">
                                    <strong>총 상품금액</strong>
                                    (수량) :
                                    <span class="total">
                                        <strong>
                                            <em id="price">${itemInfo.proPrice}원</em>
                                        </strong>
                                         <small id="total-quantity">(1개)</small>
                                    </span>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <div class="purchase-btn">
                    <div class="btn-area">
                        <!--  <a href="<c:url value='/order/purchasePage?proNum=${itemInfo.proNum}&quantity=3'/>" id="order_purchase">
                            
                        </a> -->
                        <form action="<c:url value='/order/purchasePage'/>">
                        	<input name="proNum" value="${itemInfo.proNum}" type="hidden">
                        	<input name="quantity" value="1" id="quan" type="hidden">
                        	<button class="purchaseDirect">바로 구매하기</button>
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
        <div class="add-detail">
            <!-- 상품상세정보 -->
            <div class="prd-detail">
                <ul class="link">
                    <li class="selected">
                        <a href="#prd-detail">상품상세정보</a>
                    </li>
                    <li>
                        <a href="#prd-change">교환 및 반품정보</a>
                    </li>
                    <li>
                        <a href="#prd-review">상품사용후기</a>
                    </li>
                </ul>
                <div class="cont" id="prd-detail">
                    <h3>상품상세정보</h3>
                    <p> </p>
                    <table>
                        <tbody>
                            <tr>
                                <td>
                                    <img src="<c:url value='/product/display?filePath=${itemInfo.proInfo}' />" alt="">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <p></p>
                </div>
            </div>
            <!-- 상품상세정보 -->
            <!-- 교환 및 반품정보 -->
            <div class="prd-change">
                <ul class="link">
                    <li>
                        <a href="#prd-detail">상품상세정보</a>
                    </li>
                    <li class="selected">
                        <a href="#prd-change">교환 및 반품정보</a>
                    </li>
                    <li>
                        <a href="#prd-review">상품사용후기</a>
                    </li>
                </ul>
                <div class="cont" id="prd-change">
                    <h3>교환 및 반품정보</h3>
                    <b>교환 및 반품이 가능한 경우</b>
                    <br>
                    - 상품을 공급 받으신 날로부터 7일이내 단, 가전제품의
                    <br>
                    &nbsp;&nbsp;경우 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우에는 교환/반품이 불가능합니다.
                    <br>
                    - 공급받으신 상품 및 용역의 내용이 표시.광고 내용과
                    <br>
                    &nbsp;&nbsp;다르거나 다르게 이행된 경우에는 공급받은 날로부터 3월이내, 그사실을 알게 된 날로부터 30일이내
                    <br>
                    <br>
                    <b>교환 및 반품이 불가능한 경우</b>
                    <br>
                    - 고객님의 책임 있는 사유로 상품등이 멸실 또는 훼손된 경우. 단, 상품의 내용을 확인하기 위하여
                    <br>
                    &nbsp;&nbsp;포장 등을 훼손한 경우는 제외
                    <br>
                    - 포장을 개봉하였거나 포장이 훼손되어 상품가치가 상실된 경우
                    <br>
                     &nbsp;&nbsp;(예 : 가전제품, 식품, 음반 등, 단 액정화면이 부착된 노트북, LCD모니터, 디지털 카메라 등의 불량화소에
                     <br>
                    &nbsp;&nbsp;따른 반품/교환은 제조사 기준에 따릅니다.)
                    <br>
                    - 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 단, 화장품등의 경우 시용제품을
                    <br>
                    &nbsp;&nbsp;제공한 경우에 한 합니다.
                    <br>
                    - 시간의 경과에 의하여 재판매가 곤란할 정도로 상품등의 가치가 현저히 감소한 경우
                    <br>
                    &nbsp;&nbsp;- 복제가 가능한 상품등의 포장을 훼손한 경우
                    <br>
                    &nbsp;&nbsp;(자세한 내용은 고객만족센터 1:1 E-MAIL상담을 이용해 주시기 바랍니다.)
                    <br>
                    <br>
					※ 고객님의 마음이 바뀌어 교환, 반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.
                    <br>
                    &nbsp;&nabla;(색상 교환, 사이즈 교환 등 포함)
                    <br>
                </div>
            </div>
            <!-- 교환 및 반품정보 -->
            <!-- 상품사용후기 -->
            <div class="review-box" id="prd-review">
            	<ul class="link">
                    <li>
                        <a href="#prd-detail">상품상세정보</a>
                    </li>
                    <li>
                        <a href="#prd-change">교환 및 반품정보</a>
                    </li>
                    <li class="selected">
                        <a href="#prd-review">상품사용후기</a>
                    </li>
                </ul>
                <div class="review-option">
                	<img class="reviewImg" src="${pageContext.request.contextPath }/resources/image/review.gif" alt="상품리뷰" class="">
                </div>
                <ul class="review-list">
                    <li class="review-item">
                        <div class="review-area">
                            <div class="comment-box">
                                <div class="id-box">
                                    <div class="id-info">
                                        <a class="id">짱구</a>
                                    </div>
                                </div>
                                <div class="review-info">
                                    <span class="review-date">
                                        2021.05.03
                                    </span>
                                </div>
                                <div class="text-box">
                                    <p class="text-view">
                                        <span class="text-comment">
                                            튼튼하고 좋아요!
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="review-item">
                        <div class="review-area">
                            <div class="comment-box">
                                <div class="id-box">
                                    <div class="id-info">
                                        <a class="id">철수</a>
                                    </div>
                                </div>
                                <div class="review-info">
                                    <span class="review-date">
                                        2021.05.22                                </span>
                                </div>
                                <div class="text-box">
                                    <p class="text-view">
                                        <span class="text-comment">
                                            배송 빨라요!
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
                <div class="review-writer">
                    <div class="review-inbox">
                        <strong class="blind">후기를 입력하세요</strong>
                        <em class="inbox-id">맹구</em>
                        <textarea class="comment">후기를 남겨보세요.</textarea>
                    </div>
                </div>
                <p class="btn-area">
                    <a href="#" class="review-register">
                        <button type="submit" class="review">상품후기등록</button>
                    </a>
                </p>
            </div>
            <!-- 상품사용후기 -->
            <!-- 상품 Q&A 
            <div class="prdQnA" id="prd-qna">
                <div class="board">
                    <div class="item-title">
                        <a class="qna">상품문의</a>
                    </div>
                    <p class="desc">상품에 대해 궁금한 점을 해결해 드립니다.</p>
                    <p class="nodata">게시물이 없습니다.</p>
                    <p class="btn-area">
                        <a href="#">
                            <button class="review">상품문의하기</button>
                        </a>
                    </p>
                </div>
            </div>-->
        </div>
    </div>
    
    <!-- 
    <span class="quantity">
       <input id="quantity" name="quantity-opt" value="1" type="text">
       <a href="none">
         <img src="image/수량증가.gif" alt="수량증가" class="quantity-up" id="plus">
       </a>
       <a href="none">
         <img src="image/수량감소.gif" alt="수량감소" class="quantity-down" id="minus">
       </a>
    </span>
     -->
    
    <script>
    let $total = document.getElementById('quantity');
    console.log($total);
    const upBtn = document.getElementById('quantity-up');
    const downBtn = document.getElementById('quantity-down');
    const $price = document.getElementById('total-price');
    const original_price = $price.value;
    const $quan = document.getElementById('quan');
    console.log('원금: ' + original_price);
    console.log('총액: ' + $price.value);

    upBtn.addEventListener('click', function(e) {
        e.preventDefault();
        console.log('수량 증가 버튼 클릭됨!');
        let value = $total.getAttribute('value');
        console.log('value: ' + value);
        value++;
        $total.setAttribute('value', value);
        $quan.setAttribute('value', value);
        console.log('변경된 value: ' + value);
        $price.setAttribute('value', original_price * value);
        console.log('총액: ' + $price.value);
        document.getElementById('price').textContent = $price.value.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + "원";
        document.getElementById('total-quantity').textContent = '(' + value + '개' + ')';
    });

    downBtn.addEventListener('click', function(e) {
        console.log('수량 감소 버튼 클릭됨!');
        if(+$total.value === 1) {
            alert('1 미만으로 내릴 수 없습니다.');
            return;
        } 
        let value = $total.getAttribute('value');
        console.log('value: ' + value);
        value--;
        $total.setAttribute('value', value);
        $quan.setAttribute('value', value);
        console.log('변경된 value: ' + value);
        $price.setAttribute('value', original_price * value);
        console.log('총액: ' + $price.value);
        document.getElementById('price').textContent = $price.value.replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","); + "원";
        document.getElementById('total-quantity').textContent = '(' +  value + '개' + ')';
    });

    </script>           
       
    
<%@ include file="../include/footer.jsp" %>
    
    
    
    
