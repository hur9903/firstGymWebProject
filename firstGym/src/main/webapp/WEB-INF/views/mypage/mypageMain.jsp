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
                        <td>abc1234</td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td>홍길동</td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td>aaa@naver.com</td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td>123456789</td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>서울특별시 마포구~~~</td>
                    </tr>
                </tbody>
            </table>

            <div class="mypageMain-menu">
                <div class="left">
                    <a href="#" id="mypageMain-modBtn">
                        회원 정보 수정
                    </a> <br><br>
                    <a href="#">
                        출석체크
                    </a>
                </div>
                <div class="right">
                    <a href="#" id="mypageMain-bmiBtn">
                          BMI 검사 기록
                    </a><br><br>
                    <a href="#">
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
                            <td><input class="mypageModify-pw" name="userPw" id="userPw"><span id="checkUserPw"></span></td>
                        </tr>
                        <tr>
                            <td>비밀번호확인</td>
                            <td><input class="mypageModify-pwCk" id="userPwCk"><span id="checkUserPwCk"></span></td>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td><input class="mypageModify-name" name="userName" id="userName" "><span id="checkName"></span></td>
                        </tr>
                        <tr>
                        	<td>생년월일</td>
                        	 <td><input class="mypageModify-birth" name="userBirth" id="userBirth" "><span id="checkBirth"></span></td>
                        </tr>
                        <tr>
                            <td>성별</td>
                            <td >
                                &nbsp;&nbsp;<input type="radio" class="mypageModify-gender" value="male" name="userGen" id="userGen"><label>&nbsp;남</label>
                                &nbsp;&nbsp;<input type="radio" class="mypageModify-gender" value="female" name="userGen" id="userGen"><label>&nbsp;여</label>
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
                                <input class="mypageModify-phone" name="userPhone" id="userPhone" ><span id="checkPhone"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>우편번호</td>
                            <td><input class="mypageModify-mail" size=20 id="userMail" name="userMail"><span id="checkMail"></span>
                                <button type="button" class="mypageModify-mailFind">주소찾기</button>
                            </td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td><input class="mypageModify-add" name="userAddr1" size=30 id="userAddr1"><span id="checkAddr1"></span></td>
                        </tr>
                        <tr>
                            <td>상세주소</td>
                            <td><input class="mypageModify-addDetail" name="userAddr2" size=30 id="userAddr2"><span id="checkAddr2"></span></td>
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
                <table class="bmiList-table" border="1px solid">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>검사 날짜</th>
                            <th>BMI 지수</th>
                        </tr>
                    </thead>
                    <tbody>
                       <tr>
                            <td>ssss</td>
                            <td>sss</td>
                            <td>sss</td>
                        </tr><tr>
                            <td>ssss</td>
                            <td>sss</td>
                            <td>sss</td>
                        </tr><tr>
                            <td>ssss</td>
                            <td>sss</td>
                            <td>sss</td>
                        </tr>
                        <tr>
                            <td>ssss</td>
                            <td>sss</td>
                            <td>sss</td>
                        </tr><tr>
                            <td>ssss</td>
                            <td>sss</td>
                            <td>sss</td>
                        </tr> <tr>
                            <td>ssss</td>
                            <td>sss</td>
                            <td>sss</td>
                        </tr><tr>
                            <td>ssss</td>
                            <td>sss</td>
                            <td>sss</td>
                        </tr><tr>
                            <td>ssss</td>
                            <td>sss</td>
                            <td>sss</td>
                        </tr>
                    </tbody>
            
                </table>
            
                <div class="bmiList-paging-div">
                    <ul class="bmiList-paging-ul">
                        <!-- 이전버튼  -->
                        <a href=""><li class="bmiList-btn-not-check">&lt;</li></a>
                        <!-- 페이지 버튼(체크되면 class이름 변경) -->
                        <a href=""><li class="bmiList-btn-check">1</li></a>
                        <a href=""><li class="bmiList-btn-not-check">2</li></a>
                        <a href=""><li class="bmiList-btn-not-check">3</li></a>
                        <a href=""><li class="bmiList-btn-not-check">4</li></a>
                        <a href=""><li class="bmiList-btn-not-check">5</li></a>
                        <a href=""><li class="bmiList-btn-not-check">6</li></a>
                        <a href=""><li class="bmiList-btn-not-check">7</li></a>
                        <a href=""><li class="bmiList-btn-not-check">8</li></a>
                        <a href=""><li class="bmiList-btn-not-check">9</li></a>
                        <a href=""><li class="bmiList-btn-not-check">10</li></a>
                            
                        <!-- 다음버튼 -->
                        <a href=""><li class="bmiList-btn-not-check">&gt;</li></a>
        
                    </ul>
                </div>
                <div class="bmiList-btn">
                    <button class="bmiList-btn-confirm" id="bmiList-btn-confirm">확인</button>
                </div>
            </div>
        </div>
        <!-- 페이징 바 -->

        </form>
    </div>
    <!-- 푸터. jsp전환시 삭제 후 include 사용 -->
    <%@ include file="../include/footer.jsp" %>

    <!-- 푸터. jsp전환시 삭제 후 include 사용 -->


    <script>
        //회원 정보 수정 모달
        const $modal_info = $('#info');
        const $modify = $('#mypageMain-modBtn');
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

        $mypageMain_bmiBtn.click(function(){
            $modal_bmiList.show()
        })

        $bmiList_confirm.click(function(){
            $modal_bmiList.hide()
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
			}else if(!$('#userGen').is(":checked")){
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
		$('#userMail').keyup(function() {
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
    </script>
