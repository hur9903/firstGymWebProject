<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../include/header.jsp" %>
    
    <section>
        <h3 class="mypageMain-h3">내 정보</h3>
        <div class="mypageMain-main">
            
            <table class="mypageMain-table" >
            
                <tbody>
	                <div class="delete">
	               		<button class="deleteBtn" id="deleteBtn"> 회원 탈퇴 </button>
	                </div>
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
                    <a href="<c:url value='/board/boardListPage' />?category=none&condition=myBoard&keyword=${login.userId}">
                         내가 쓴 게시글 보기
                    </a>
                </div>
                <div class="right">
                    <a href="#" id="mypageMain-bmiBtn">
                          BMI 검사 기록
                    </a><br><br>
                    <a href="/myweb/order/orderListPage">
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
               <br><br>
            </div>
            <div class="second">
                <form action="<c:url value='/user/modifyInfo' />" method="post" id="modifyForm">
                <table class="mypageModify-table" >
                    <tbody>
                        <tr>
                            <td>아이디</td>
                            <td><input class="mypageModify-id" name="userId" value="${login.userId }" readonly style="background: rgb(232, 240, 254)"></td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td><input type="password" class="mypageModify-pw" name="userPw" id="userPw"><span id="checkUserPw"></span></td>
                        </tr>
                        <tr>
                            <td>비밀번호확인</td>
                            <td><input type="password" class="mypageModify-pwCk" id="userPwCk"><span id="checkUserPwCk"></span></td>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td><input class="mypageModify-name" name="userName" id="userName" value="${login.userName}"><span id="checkName"></span></td>
                        </tr>
                        <tr>
                        	<td>생년월일</td>
                        	 <td><input class="mypageModify-birth" name="userBirth" id="userBirth" value="${login.userBirth}"><span id="checkBirth"></span></td>
                        </tr>
                        <tr>
                            <td>성별</td>
                            <td >
                                &nbsp;&nbsp;<input type="radio" class="mypageModify-gender" value="male" name="userGen" id="userGen" ${login.userGen == 'male'?'checked': ''}><label>&nbsp;남</label>
                                &nbsp;&nbsp;<input type="radio" class="mypageModify-gender" value="female" name="userGen" id="userGen2" ${login.userGen == 'female'?'checked': ''}><label>&nbsp;여</label>
                            </td>
                        </tr>
                        
                        <tr>
                            <td>E-mail</td>
                            <td>
                                <input class="mypageModify-email" name="userEmail" id="userEmail" value="${login.userEmail}" readonly style="background: rgb(232, 240, 254)">
                            </td>
                        </tr>
                        <tr>
                            <td>휴대전화</td>
                            <td>
                                <input class="mypageModify-phone" name="userPhone" id="userPhone" value="${login.userPhone}"><span id="checkPhone"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>우편번호</td>
                            <td><input class="mypageModify-mail" size=20 id="userMail" name="userMail" readonly value="${login.userMail}"><span id="checkMail"></span>
                                <button type="button" class="mypageModify-mailFind" onclick="searchAddress()">주소찾기</button>
                            </td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td><input class="mypageModify-add" name="userAddr1" size=30 id="userAddr1" readonly value="${login.userAddr1}"><span id="checkAddr1"></span></td>
                        </tr>
                        <tr>
                            <td>상세주소</td>
                            <td><input class="mypageModify-addDetail" name="userAddr2" size=30 id="userAddr2" value="${login.userAddr2}"><span id="checkAddr2"></span></td>
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
	                            <td>
	                            	<fmt:formatDate value="${results.bmiDate}" pattern="yyyy.MM.dd" /><br>
	                            	<fmt:formatDate value="${results.bmiDate}" pattern="HH시mm분" />
	                            </td>
	                            <td>
	                            <c:if test="${results.bmiResult == 'underweight'}">저체중</c:if>
	                            <c:if test="${results.bmiResult == 'normalweight'}">정상</c:if>
	                            <c:if test="${results.bmiResult == 'overweight'}">과체중</c:if>
	                            <c:if test="${results.bmiResult == 'obesity'}">비만</c:if>
	                            </td>
	                        </tr>
		            	 </c:forEach> 
	                    </tbody>
	                </table>
                <div class="bmiList-paging-div clearfix">
                    <ul class="bmiList-paging-ul">
                        <!-- 이전버튼  -->
                        <c:if test="${pc.prev}">
                        	<a href="<c:url value='/mypage/mainPage?page=${pc.beginPage-1}&msg=bmiModal' />"><li class="bmiList-btn-not-check">&lt;</li></a>
		                </c:if>
		                <c:forEach var="pageNum" begin="${pc.beginPage}" end="${pc.endPage}">
		                	<c:if test="${pageNum == pc.paging.page}">
		                	<a href="<c:url value='/mypage/mainPage?page=${pageNum}&msg=bmiModal' />" style="color:blue;">${pageNum}</a>
		                	</c:if>
		                	<c:if test="${pageNum != pc.paging.page}">
		                	<a href="<c:url value='/mypage/mainPage?page=${pageNum}&msg=bmiModal' />">${pageNum}</a>
		                	</c:if>
		                </c:forEach>
		                
						<!-- 다음버튼 -->
		                <c:if test="${pc.next}">
		                	<a href="<c:url value='/mypage/mainPage?page=${pc.endPage+1}&msg=bmiModal' />"><li class="bmiList-btn-not-check">&gt;</li></a>
		                	<!-- <a href=""><li class="bmiList-btn-not-check">&gt;</li></a>
		                	<a class="next" href="<c:url value='/mypage/mainPage?page=${pc.endPage+1}' />">></a> -->
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
    
    <!-- delete user -->
    
    <div id="delete-modal">
	     <div class="mypage-deleteMain" id="mypage-deleteMain">
	     
	        <div class="mypage-deleteMain-h3">
	            <h3>회원 탈퇴</h3>
	            <button class="del-cancel" id="del-cancel"> X </button>
	        </div>
	        
	            <div id="mypage-delete" class="mypage-delete" >
	                <form action="<c:url value='/user/delete' />" method="post" id="deleteForm" class="deleteForm">
	                    아이디 : <input type="text" size="10" placeholder="아이디" name="userId" id="delUserId" value="${login.userId }" readonly style="background: rgb(232, 240, 254)"><br>
	                    <br><br>
	                    비밀번호 : <input type="password" size="10" placeholder="비밀번호" name="userPw" id="delUserPw"><br>
	                    <br><br><br>
	                    <div class="mypage-delBtn"><button type="button" class="delBtn" id="delBtn">탈퇴하기</button></div>
	                </form>
	            </div> 
	    </div>
   </div> 
    
    
    
    
    
    <!-- 푸터. jsp전환시 삭제 후 include 사용 -->
    <%@ include file="../include/footer.jsp" %>

    <!-- 푸터. jsp전환시 삭제 후 include 사용 -->


    <script>
        //회원 정보 수정 모달
        const $modal_info = $('#info');
        const $modify = $('#mypageMain-modBtn');
        const $mypageModify_can = $('#mypageModify-can');
        const $modal_bmiList = $('#bmiList');
        
        const page = '${pc.paging.page}';
        console.log(page);


        $modal_info.hide();
        $modal_bmiList.hide(); 
        if('${param.msg}' === 'bmiModal') {
        	$modal_bmiList.show();        	
        }

        $modify.click(function(){
            $modal_info.show();
        });

        $mypageModify_can.click(function(){
            $modal_info.hide();
        });

        //BMI 검사 기록 모달
        const $mypageMain_bmiBtn = $('#mypageMain-bmiBtn');
        const $bmiList_confirm = $('#bmiList-btn-confirm');

        
        $mypageMain_bmiBtn.click(function() {
			$modal_bmiList.show();
		})
        
        $bmiList_confirm.click(function() {
	        $modal_bmiList.hide();			
		});
        

        //회원 탈퇴 모달
        const $delete_modal = $('#delete-modal');
        const $deleteBtn = $('#deleteBtn');
        const $del_cancel = $('#del-cancel');
        
        $delete_modal.hide();
        
        $deleteBtn.click(function() {
			$delete_modal.show();
		})
        
		$del_cancel.click(function() {
			$delete_modal.hide();
		})
        //-------------------------------------------
        //유효성 검사
        const getIdCheck = RegExp(/^[a-zA-Z0-9]{5,12}$/);
		const getPwCheck = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/);
		const getNameCheck = RegExp(/^[가-힣]+$/);
		const getBirthCheck = RegExp(/^[0-9]{8}$/);
		const getEmailCheck = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/);
		const getPhoneCheck = RegExp(/^[0-9]{10,11}$/);
		const getAddrCheck = RegExp(/^[a-zA-Z0-9]{1,}$/);
		
		//입력값 중 하나라도 만족하지 못한다면 회원가입처리를 막기 위한 논리형 변수 선언
		let chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false, chk6 = false, chk7 = false, chk8 = false, chk9 = false, chk10 = false;
		
        //회원 정보 수정 이벤트
        $('#mypageModify-mod').click(function() {
        	
        	if($('#userPw').val() === ''){
				alert('비밀번호를 입력하세요');
				$('#userPw').focus();
				return;
        	}else if(!getPwCheck.test($('#userPw').val())){
				alert('영문,숫자,특수문자 포함 8자 이상 입력하세요');
				$('#userPw').focus();
				return;
			}else if($('#userPwCk').val() === '' ){
				alert('비밀번호 확인을 해주세요');
				$('#userPwCk').focus();
				return;
			}else if($('#userPw').val() !== $('#userPwCk').val()){
				alert('비밀번호와 일치하지 않습니다')
				return;
			}else if($('#userName').val() === '' ){
				alert('이름을 입력하세요');
				$('#uesrName').focus();
				return;
			}else if(!getNameCheck.test($('#userName').val())){
				alert('이름은 한글로만 입력하세요');
				$('#uesrName').focus();
				return;
			}else if($('#userBirth').val() === ''){
				alert('생년월일을 입력하세요');
				$('#userBirth').focus();
				return;
			}else if(!getBirthCheck.test($('#userBirth').val())){
				alert('생년월일을 숫자로만 8글자 입력하세요 ex)19941124');
				$('#uesrName').focus();
				return;
			}else if(!$('#userGen').is(":checked") && !$('#userGen2').is(":checked")){
				alert('성별을 체크하세요');
				return;
			}else if($('#userEmail').val() === ''){
				alert('e-mail을 입력 해주세요');
				$('#userEmail').focus();
				return;	
			}else if(!getEmailCheck.test($('#userEmail').val())){
				alert('@을 포함하여 입력하세요')
				
			}else if($('#userPhone').val() === ''){
				alert('휴대폰 번호를 입력 해주세요');
				$('#userPhone').focus();
				return;
			}else if(!getPhoneCheck.test($('#userPhone').val())){
				alert('숫자로만 10~11자리 입력하세요');
				return;
			}else if($('#userMail').val() === ''){
				alert('우편 번호를 입력 해주세요');
				$('#userMail').focus();
				return;
			}else if($('#userAddr1').val() === ''){
				alert('주소를 입력 해주세요');
				$('#userAddr1').focus();
				return;
			}else if($('#userAddr2').val() === ''){
				alert('상세주소를 입력 해주세요');
				$('#userAddr2').focus();
				return;
			}else{
				if(confirm('정말 수정 하시겠습니까?')){
					$('#modifyForm').submit();
				}else{
					return;
				}
			}
		}) //회원정보 수정 이벤트 끝
		
		
	   	
		//PW
		 $('#userPw').keyup(function() {
			if($(this).val() === ''){
				$('#checkUserPw').html('<b style="font-size: 14px; color:red;"> !</b>');
				chk2 = false;
			}else if(!getPwCheck.test($(this).val())){
				$('#checkUserPw').html('<b style="font-size: 14px; color:red;"> !</b>');
				chk2 = false;
			}
			else{
				$('#checkUserPw').html('<b style="font-size: 14px; color:green;"> o</b>');
				chk2 = true;
			}
		})
		
		//PWCheck
		$('#userPwCk').keyup(function() {
			if($(this).val() === ''){
				$('#checkUserPwCk').html('<b style="font-size: 14px; color:red;"> !</b>');
				chk2 = false;
			}else if(!getPwCheck.test($(this).val())){
				$('#checkUserPwCk').html('<b style="font-size: 14px; color:red;"> !</b>');
				chk2 = false;
			}
			else{
				$('#checkUserPwCk').html('<b style="font-size: 14px; color:green;"> o</b>');
				chk2 = true;
			}
		})
		
		//NAME
		$('#userName').keyup(function() {
			if($(this).val() === ''){
				$('#checkName').html('<b style="font-size: 14px; color:red;"> !</b>');
				chk2 = false;
			}else if(!getNameCheck.test($(this).val())){
				$('#checkName').html('<b style="font-size: 14px; color:red;"> !</b>');
				chk2 = false;
			}
			else{
				$('#checkName').html('<b style="font-size: 14px; color:green;"> o</b>');
				chk2 = true;
			}
		})
		
		//BIRTH
		$('#userBirth').keyup(function() {
			if($(this).val() === ''){
				$('#checkBirth').html('<b style="font-size: 14px; color:red;"> !</b>');
				chk2 = false;
			}else if(!getBirthCheck.test($(this).val())){
				$('#checkBirth').html('<b style="font-size: 14px; color:red;"> !</b>');
				chk2 = false;
			}
			else{
				$('#checkBirth').html('<b style="font-size: 14px; color:green;"> o</b>');
				chk2 = true;
			}
		})
		/* 
		//EMAIL
		$('#userEmail').keyup(function() {
			if($(this).val() === ''){
				$('#checkEmail').html('<b style="font-size: 14px; color:red;"> !</b>');
				chk2 = false;
			}else if(!getEmailCheck.test($(this).val())){
				$('#checkEmail').html('<b style="font-size: 14px; color:red;"> !</b>');
				chk2 = false;
			}
			else{
				$('#checkEmail').html('<b style="font-size: 14px; color:green;"> o</b>');
				chk2 = true;
			}
		})
		 */
		//PHONE
		$('#userPhone').keyup(function() {
			if($(this).val() === ''){
				$('#checkPhone').html('<b style="font-size: 14px; color:red;"> !</b>');
				chk2 = false;
			}else if(!getPhoneCheck.test($(this).val())){
				$('#checkPhone').html('<b style="font-size: 14px; color:red;"> !</b>');
				chk2 = false;
			}
			else{
				$('#checkPhone').html('<b style="font-size: 14px; color:green;"> o</b>');
				chk2 = true;
			}
		})
		
		//MAIL
		$('#userMail').on(function() {
			if($(this).val() === ''){	
				$('#checkMail').html('<b style="font-size: 14px; color:red;"> !</b>');
				chk8 = false;
			}else{
				$('#checkMail').html('<b style="font-size: 14px; color:green;">o</b>');
				chk8 = true;
			}
		})
		
		//ADDR1
		$('#userAddr1').keyup(function() {
			if($(this).val() === ''){
				$('#checkAddr1').html('<b style="font-size: 14px; color:red;"> !</b>');
				chk9 = false;
			}else{
				$('#checkAddr1').html('<b style="font-size: 14px; color:green;"> o</b>');
				chk9 = true;
			}
		})
		
		//ADDR2
		$('#userAddr2').keyup(function() {
			if($(this).val() === ''){
				$('#checkAddr2').html('<b style="font-size: 14px; color:red;"> !</b>');
				chk9 = false;
			}else{
				$('#checkAddr2').html('<b style="font-size: 14px; color:green;"> o</b>');
				chk9 = true;
			}
		})
		
	//회원정보 수정 완료
	const msg = '${msg}'
   		if(msg === "modifyOk"){
   			alert('회원 정보가 수정 되었습니다!')
   		}
	
	
	//회원 탈퇴 이벤트
	$('#delBtn').click(function() {
		if($('#delUserPw').val() === ''){
			alert('비밀번호를 입력하세요');
			$('#delUserPw').focus();
		}else{
			alert('정말 탈퇴 하시겠습니까?')
			$('#deleteForm').submit();
		}
	})
	
	const delmsg = '${msg}'
		if(delmsg === "delFail"){
			alert('비밀번호가 다릅니다')
		}
	
	
	//다음 주소 api사용해보기
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
    
    
    
    
    
    
    
    
    
