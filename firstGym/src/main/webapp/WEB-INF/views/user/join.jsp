<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <%@include file="../include/header.jsp" %>
    

    <div class="join-main-div">
        <div class="join-sub-div">
            <div id="join-title">
                회원 가입
            </div>
            <hr>
            <form action="<c:url value='/user/join' />" method="post" id="joinForm">
                <div class="join-clearfix">
                    <span class="join-float-left">아이디</span>
                    <span class="join-float-right"><input type="text" name="userId" id="userId" placeholder="아이디 (영문,숫자 포함 5~12자)">
                    <button type="button" class="join-color-pruple" id="idCheckBtn">중복확인</button><br><span id="CheckId"></span></span>
                    <span class="joinCheck" id="idCheck"></span>
                </div>
                <div class="join-clearfix">
                    <span class="join-float-left">비밀번호</span>
                    <span class="join-float-right"><input type="password" placeholder="비밀번호(영문,숫자,특수문자 포함 8자이상)" name="userPw" id="userPw"></span>
                    <span class="joinCheck" id="pwCheck"></span><br>
                </div>
                <div class="join-clearfix">
                    <span class="join-float-left">비밀번호확인</span>
                    <span class="join-float-right"><input type="password" placeholder="비밀번호확인" id="userPwCk"><span class="pwCheckOk" id="pwCheckOk"></span><br></span>
                    <span class="joinCheck" id="pwCheck2"></span><br>
                </div>
                <div class="join-clearfix">
                    <span class="join-float-left">이름</span>
                    <span class="join-float-right"><input type="text" placeholder="이름" name="userName" id="userName"></span>
                    <span class="joinCheck" id="nameCheck"></span><br>
                </div>
                <div class="join-clearfix">
                    <span class="join-float-left">생년월일</span>
                    <span class="join-float-right"><input type="text" placeholder="생년월일 8자리  ex)19950425" name="userBirth" id="userBirth" ></span>
                     <span class="joinCheck" id="birthCheck"></span><br>
                </div>
                <div class="join-clearfix">
                    <span class="join-float-left">성별</span>
                    <span class="join-float-right"><input type="radio" name="userGen" id="userGen" value="male">&nbsp;&nbsp;&nbsp;남&nbsp;&nbsp;&nbsp;<input type="radio" name="userGen" id="userGen2" value="female">&nbsp;&nbsp;&nbsp;여</span>
                </div>
                <div class="join-clearfix">
                    <span class="join-float-left">E-mail</span>
                    <span class="join-float-right"><input type="email" placeholder="입력시 @까지 함께 입력하세요" name="userEmail" id="userEmail"><button type="button" class="join-color-pruple" id="emailCheckBtn">중복확인</button><br><span id="Checkemail"></span></span>
                	<span class="joinCheck" id="emailCheck"></span>
                </div>
                <div class="join-clearfix">
                    <span class="join-float-left">휴대전화</span>
                    <span class="join-float-right"><input type="text" name="userPhone" id="userPhone" placeholder="입력 시 '-' 없이 숫자만 입력하세요"> <span class="join-other"></span></span>
                	<span class="joinCheck" id="phoneCheck"></span><br>
                </div>
                <div class="join-clearfix">
                    <span class="join-float-left">우편번호</span>
                    <span class="join-float-right"><input type="text" placeholder="우편번호" name="userMail" id="userMail" readonly><button type="button" class="mypageModify-mailFind" onclick="searchAddress()" id="selAdd">주소찾기</button></span>
                </div>
                <div class="join-clearfix">
                    <span class="join-float-left">주소</span>
                    <span class="join-float-right"><input type="address" placeholder="주소" name="userAddr1" id="userAddr1" readonly></button></span>
                    <span class="joinCheck" id="addrCheck"></span><br>
                </div>
                <div class="join-clearfix">
                    <span class="join-float-left">상세주소</span>
                    <span class="join-float-right"><input type="address" placeholder="상세주소" name="userAddr2" id="userAddr2"></button></span>
                    <span class="joinCheck" id="addr2Check"></span><br>
                </div>
                <div class="join-center">
                	<span class="join-agree"> <input type="checkbox" id="agree">&nbsp;&nbsp;개인정보 수집,이용 동의 (필수) </span>
                </div>
                <div class="join-center"><button type="button" class="color-darkskyblue" id="joinBtn">가입하기</button></div>
            </form>
        </div>
    </div>
    <%@include file="../include/footer.jsp" %>
    
    <script>
    
  	//회원가입 버튼 클릭
      $('#joinBtn').click(function() {
   	  	if($('#userId').val() === ''){
			alert('아이디는 필수 값 입니다');
			$('#userId').focus();
			return;
		}else if(!$('#userId').attr('readonly')) { 
            alert('아이디 중복체크는 필수입니다.');
            return;
        }else if($('#userPw').val() === ''){
			alert('비밀번호는 필수 값 입니다');
			$('#userPw').focus();
			return;
		}else if($('#userPwCk').val() === ''){
			alert('비밀번호 확인은 필수 입니다');
			$('#userPwCk').focus();
			return;
		}else if($('#userName').val() === ''){
			alert('이름은 필수 값 입니다');
			$('#userName').focus();
			return;
		}else if($('#userBirth').val() === ''){
			alert('생년월일은 필수 값 입니다');
			$('#userBirth').focus();
			return;
		}else if(!$('#userGen').is(":checked")){
			alert('성별을 체크 해주세요');
			$('#userGen').focus();
			return;
		}else if($('#userEmail').val() === ''){
			alert('이메일을 입력 해주세요');
			$('#userEmail').focus();
			return;	
		}else if(!$('#userEmail').attr('readonly')) { 
            alert('이메일 중복체크는 필수입니다.');
            return;
        }else if($('#userPhone').val() === ''){
			alert('휴대폰 번호를 입력 해주세요');
			$('#userPhone').focus();
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
		}else if(!$('#agree').is(":checked")){
			alert('약관에 동의하셔야 회원가입이 완료됩니다');
			$('#agree').focus();
			return;
		}else{
			$('#joinForm').submit();
			alert('회원가입이 완료 되었습니다!')
		}
	})
	
	
	//---------------------유효성 검사
	//각 입력값들의 유효성 검증을 위한 정규 표현식을 변수로 선언
	const getIdCheck = RegExp(/^[a-zA-Z0-9]{5,12}$/);
	const getPwCheck = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/);
	const getNameCheck = RegExp(/^[가-힣]+$/);
	const getBirthCheck = RegExp(/^[0-9]{8}$/);
	const getEmailCheck = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/);
	const getPhoneCheck = RegExp(/^[0-9]{10,11}$/);
	const getAddrCheck = RegExp(/^[a-zA-Z0-9]{1,}$/);
	
   	//입력값 중 하나라도 만족하지 못한다면 회원가입처리를 막기 위한 논리형 변수 선언
	let chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false, chk6 = false, chk7 = false, chk8 = false, chk9 = false, chk10 = false;
   	
	//ID입력값 검증
	$('#userId').keyup(function() {
		
		if($(this).val() === ''){
			$(this).css('background-color', 'rgb(255, 234, 255)');
			$('#idCheck').html('<b style="font-size: 14px; color:red;  "> [아이디를 입력하세요]</b>');
			chk1 = false;
		}else if(!getIdCheck.test($(this).val())){
			$(this).css('background-color', 'rgb(255, 234, 255)');
			$('#idCheck').html('<b style="font-size: 14px; color:red;"> [영문,숫자 조합 5~12자로 입력하세요]</b>');
			chk1 = false;
		}else{
			$(this).css('background-color', 'rgb(240, 240, 240)');
			$('#idCheck').html('');
			chk1 = true;
			
			//ID 중복 확인
		    $('#idCheckBtn').click(function() {
				if($('#userId').val() === ''){
					alert('아이디를 입력하세요');
					$('#userId').focus();
					return;
				}else{

				    const userId = $('#userId').val();
				    
				    $.ajax({
				        type: "POST",
				        url: "<c:url value='/user/idCheck' />",
				        headers: {
				           "Content-type" : "application/json"
				        },
				        dataType: "text",
				        data: userId,
				        success: function(data) {
				           if(data === 'idCheckOk') {
				        	  $('#userId').attr('readonly', true);
				              $('#CheckId').html('<b style="font-size: 14px; color:green;"> [사용 가능한 아이디입니다]</b>');
				           } else {
				              $('#CheckId').html('<b style="font-size: 14px; color:red;"> [중복된 아이디입니다]</b>');
				           }
				        },
				        error: function(request,status,error) {
				        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				        }
				  	}); 
				  	
				}
			});//중복확인 이벤트 끝
		}
	});
	
   
	
  
    //PW 검증
    $('#userPw').keyup(function() {
		if($(this).val() === ''){
			$(this).css('background-color', 'rgb(255, 234, 255)');
			$('#pwCheck').html('<b style="font-size: 14px; color:red;"> [비밀번호를 입력하세요]</b>');
			chk2 = false;
		}else if(!getPwCheck.test($(this).val())){
			$(this).css('background-color', 'rgb(255, 234, 255)');
			$('#pwCheck').html('<b style="font-size: 14px; color:red;"> [영문,숫자,특수문자 조합 8자이상 입력하세요]</b>');
			chk2 = false;
		}
		else{
			$(this).css('background-color', 'rgb(240, 240, 240)');
			$('#pwCheck').html('');
			chk2 = true;
		}
	}); 
    
    //PW확인 검증
    $('#userPwCk').keyup(function() {
		//공백 확인
		if($(this).val() === ''){
			$(this).css('background-color', 'rgb(255, 234, 255)');
			$('#pwCheck2').html('<b style="font-size: 14px; color:red;"> [비밀번호는 확인은 필수입니다]</b>');
			chk3 = false;
		}
		//유효성 검사
		else if($(this).val() !== $('#userPw').val()){
			$(this).css('background-color', 'rgb(255, 234, 255)');
			$('#pwCheck2').html('<b style="font-size: 14px; color:red;"> [비밀번호와 일치하지 않습니다]</b>');
			$('#pwCheckOk').html('');
			chk3 = false;
		}
		//통과
		else{
			$(this).css('background-color', 'rgb(240, 240, 240)');
			$('#pwCheck2').html('');
			$('#pwCheckOk').html('<b style="font-size: 14px; color:green;"> [비밀번호 확인 완료]</b>');
			chk3 = true;
		}
	});
    
  	//이름 입력값 검증
	$('#userName').keyup(function() {
		//공백 확인
		if($(this).val() === ''){
			$(this).css('background-color', 'rgb(255, 234, 255)');
			$('#nameCheck').html('<b style="font-size: 14px; color:red;"> [이름을 입력하세요] </b>');
			chk4 = false;
		}
		//유효성 검사
		else if(!getNameCheck.test($(this).val())){
			$(this).css('background-color', 'rgb(255, 234, 255)');
			$('#nameCheck').html('<b style="font-size: 14px; color:red;"> [한글로만 작성하세요]</b>');	
			chk4 = false;
		}
		//통과
		else{
			$(this).css('background-color', 'rgb(240, 240, 240)');
			$('#nameCheck').html('');	
			chk4 = true;
		}
	});
  	
    //생년월일 검증
    $('#userBirth').keyup(function() {
		//공백 확인
		if($(this).val() === ''){
			$(this).css('background-color', 'rgb(255, 234, 255)');
			$('#birthCheck').html('<b style="font-size: 14px; color:red;"> [생년월일을 입력하세요] </b>');
			chk5 = false;
		}else if(!getBirthCheck.test($(this).val())){
			$(this).css('background-color', 'rgb(255, 234, 255)');
			$('#birthCheck').html('<b style="font-size: 14px; color:red;"> [정확히 숫자로만 8글자 입력하세요] </b>');
			chk5 = false;
		}else{
			$(this).css('background-color', 'rgb(240, 240, 240)');
			$('#birthCheck').html('');	
			chk5 = true;
		}
	})
    
	//이메일 검증
	$('#userEmail').keyup(function() {
		if($('#userEmail').val() === ''){
			$('#userEmail').css('background-color', 'rgb(255, 234, 255)');
			$('#emailCheck').html('<b style="font-size: 14px; color:red;"> [이메일을 입력하세요] </b>');
			chk6 = false;
		}else if(!getEmailCheck.test($(this).val())){
			$('#userEmail').css('background-color', 'rgb(255, 234, 255)');
			$('#emailCheck').html('<b style="font-size: 14px; color:red;"> [이메일 형식에 어긋납니다] </b>');
			chk6 = false;
		}else{
			$('#userEmail').css('background-color', 'rgb(240, 240, 240)');
			$('#emailCheck').html('');	
			chk6 = true;
			
			//email 중복 확인
		    $('#emailCheckBtn').click(function() {
				if($('#userEmail').val() === ''){
					alert('이메일을 입력하세요');
					$('#userEmail').focus();
					return;
				}else{

				    const userEmail = $('#userEmail').val();
				    
				    $.ajax({
				        type: "POST",
				        url: "<c:url value='/user/emailCheck' />",
				        headers: {
				           "Content-type" : "application/json"
				        },
				        dataType: "text",
				        data: userEmail,
				        success: function(data) {
				           if(data === 'emailCheckOk') {
				        	  $('#userEmail').attr('readonly', true);
				              $('#Checkemail').html('<b style="font-size: 14px; color:green;"> [사용 가능한 이메일입니다]</b>');
				           } else {
				              $('#Checkemail').html('<b style="font-size: 14px; color:red;"> [중복된 이메일입니다]</b>');
				           }
				        },
				        error: function(request,status,error) {
				        	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				        }
				  	}); 
				  	
				}
			});//중복확인 이벤트 끝
		}
	})
	
	//휴대전화 검증
	$('#userPhone').keyup(function() {
		if($(this).val() === ''){
			$(this).css('background-color', 'rgb(255, 234, 255)');
			$('#phoneCheck').html('<b style="font-size: 14px; color:red;"> [핸드폰번호를 입력하세요] </b>');
			chk7 = false;
		}else if($(this).val().includes('-')){
			$(this).css('background-color', 'rgb(255, 234, 255)');
			$('#phoneCheck').html('<b style="font-size: 14px; color:red;"> ["-"를 빼고 입력하세요] </b>');
			chk7 = false;
		}else if(!getPhoneCheck.test($(this).val())){
			$(this).css('background-color', 'rgb(255, 234, 255)');
			$('#phoneCheck').html('<b style="font-size: 14px; color:red;"> [숫자로만 10~11자리 입력하세요]</b>');	
			chk4 = false;
		}else{
			$(this).css('background-color', 'rgb(240, 240, 240)');
			$('#phoneCheck').html('');	
			chk7 = true;
		}
	})
	
	//우편 번호 검증
 	$('#userMail').on("propertychange change keyup paste input" ,function() {
 		console.log($(this).val());
		if($(this).val() !== ''){
			$(this).css('background-color', 'rgb(240, 240, 240)');
			chk8 = false;
		
		}
		
	})  

	
	
	//주소 검증
	$('#userAddr1').keyup(function() {
		if($(this).val() === ''){
			$(this).css('background-color', 'rgb(255, 234, 255)');
			$('#addrCheck').html('<b style="font-size: 14px; color:red;"> [주소를 입력하세요] </b>');
			chk9 = false;
		}else{
			$(this).css('background-color', 'rgb(240, 240, 240)');
			$('#addrCheck').html('');	
			chk9 = true;
		}
	})
	//상세주소 검증
	$('#userAddr2').keyup(function() {
		if($(this).val() === ''){
			$(this).css('background-color', 'rgb(255, 234, 255)');
			$('#addr2Check').html('<b style="font-size: 14px; color:red;"> [상세주소를 입력하세요] </b>');
			chk10 = false;
		}else{
			$(this).css('background-color', 'rgb(240, 240, 240)');
			$('#addr2Check').html('');	
			chk10 = true;
		}
	})
	
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
</html>