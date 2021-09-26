<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp" %>
    
    <section>
        <h3 class="mypageMain-h3">내 정보</h3>
        <div class="mypageMain-main">
            
            <table class="mypageMain-table" >
                <tbody>
                    <tr>
                        <th>아이디</th>
                        <td>${user.userId}</td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td>${user.userName}</td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>${user.userEmail}</td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td>${user.userPhone}</td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>${user.userAddr1} <br>
                        	${user.userAddr2}
                        </td>
                    </tr>
                </tbody>
            </table>

            <div class="mypageMain-menu">
                <div class="left">
                    <a href="#" id="mypageMain-modBtn">
                        회원 정보 수정
                    </a> <br><br>
                    <a href="#">
                      내가 쓴 게시글 보기
                    </a>
                </div>
                <div class="right">
                    <a href="#" id="mypageMain-bmiBtn">
                          BMI 검사 기록
                    </a><br><br>
                    <a href="/order/orderListPage">
                         구매목록
                    </a>
                </div>
            </div>
        </div>
    </section>


    <!-----------------modify-->
    <div id="info" >
        <div class="mypageModify-Main">
            <div class="first">
                <h3 class="mypageModify-h3">회원 정보 수정</h3>
                <p>*표시는 필수 입력 표시입니다</p>
            </div>
            <div class="second">
                <form action="#" id="modifyForm">
                <table class="mypageModify-table" >
                    <tbody>
                        <tr>
                            <td>아이디</td>
                            <td><input class="mypageModify-id"></td>
                        </tr>
                        <tr>
                            <td>*비밀번호</td>
                            <td><input class="mypageModify-pw"></td>
                        </tr>
                        <tr>
                            <td>*비밀번호확인</td>
                            <td><input class="mypageModify-pwCk"></td>
                        </tr>
                        <tr>
                            <td>*이름</td>
                            <td><input class="mypageModify-name" ></td>
                        </tr>
                        <tr>
                            <td>*성별</td>
                            <td >
                                &nbsp;&nbsp;<input type="checkbox" class="mypageModify-gender" ><label>&nbsp;남</label>
                                &nbsp;&nbsp;<input type="checkbox" class="mypageModify-gender" ><label>&nbsp;여</label>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>*E-mail</td>
                            <td>
                                <input class="mypageModify-email" >
                            </td>
                        </tr>
                        <tr>
                            <td>*휴대전화</td>
                            <td>
                                <input class="mypageModify-phone">
                            </td>
                        </tr>
                        <tr>
                            <td>우편번호</td>
                            <td><input class="mypageModify-mail" size=20>
                                <button type="button" class="mypageModify-mailFind">주소찾기</button>
                            </td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td><input class="mypageModify-add" size=40></td>
                        </tr>
                        <tr>
                            <td>상세주소</td>
                            <td><input class="mypageModify-addDetail" size=40></td>
                        </tr>
        
        
                    </tbody>
        
                </table>
                </form>
            </div>
            <div class="mypageModify-button">
                <button class="mypageModify-mod" id="mypageModify-mod">수정</button>
                <button class="mypageModify-can" id="mypageModify-can">취소</button>
            </div>
        
        </div>
    </div>

    <!--BMI list-->
    <div id="bmiList">
        <div class="bmiList-Main">
            <div class="first">
                <h3>내 BMI 기록</h3>
            </div>
            <div class="second">
	                <table class="bmiList-table">
	                    <thead>
	                        <tr>
	                            <th>번호</th>
	                            <th>검사날짜</th>
	                            <th>BMI 지수</th>
	                        </tr>
	                    </thead>
	                    <tbody id="bmiList-body">
	                    <c:forEach var="results" items="${list}"> 
	                    	<tr>
	                            <td>${results.bmiNum}</td>
	                            <td>${results.bmiDate}</td>
	                            <td>${results.bmiResult}</td>
	                        </tr>
		            	 </c:forEach> 
	                    </tbody>
	                </table>
                <div class="bmiList-paging-div clearfix">
                    <ul class="bmiList-paging-ul">
                        <!-- 이전버튼  -->
                        <c:if test="${pc.prev}">
		                	<a class="prev" href="<c:url value='/mypage/mainPage?page=${pc.beginPage-1}' />">이전</a>
		                </c:if>
		                <c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
		                	<a href="<c:url value='/mypage/mainPage?page=${pageNum}' />" class="active">${pageNum}</a>
		                </c:forEach>
		                
		                <c:if test="${pc.next}">
		                	<a class="next" href="<c:url value='/mypage/mainPage?page=${pc.endPage+1}' />">다음</a>
		                </c:if>   

                    </ul>
                </div>
                <div class="bmiList-btn">
                    <button class="bmiList-btn-confirm" id="bmiList-btn-confirm">확인</button>
                </div>
            </div>
        </div>
        <!-- 페이징 바 -->

    </div>
    <!-- 푸터. jsp전환시 삭제 후 include 사용 -->
    <%@ include file="../include/footer.jsp" %>

    <!-- 푸터. jsp전환시 삭제 후 include 사용 -->


    <script>
        //회원 정보 수정 모달
        const $modal_info = $('#info');
        const $modify = $('#mypageMain-modBtn');
        const $mypageModify_mod = $('#mypageModify-mod');
        const $mypageModify_can = $('#mypageModify-can');

        $modal_info.hide();

        $modify.click(function(){
            $modal_info.show();
        })

        $mypageModify_can.click(function(){
            $modal_info.hide()
        })

        //BMI 검사 기록 모달
        const $modal_bmiList = $('#bmiList');
        const $mypageMain_bmiBtn = $('#mypageMain-bmiBtn');
        const $bmiList_confirm = $('#bmiList-btn-confirm');

        $modal_bmiList.hide();
        
        
        
        let strAdd = '';
        
        
        $mypageMain_bmiBtn.click(function(){
            $modal_bmiList.show()
        })

        $bmiList_confirm.click(function(){
            $modal_bmiList.hide()
        })
		    
	    

       
    </script>

