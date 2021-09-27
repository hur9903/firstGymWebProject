<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp" %>

<head profile="http://www.w3.org/2005/10/profile" />

    <div class="login-main-div">
        <div class="login-change-div">
            <ul>
                <li id="login-user-login-modifier" class="login-change-mode login-active">회원</li>
                <li id="login-nonuser-login-modifier" class="login-change-mode login-right-inactive">비회원</li>
            </ul>
        </div>
        <div class="login-input-div">
            <!-- 회원 로그인 -->
            <div id="login-user-login-input" class="login-active" >
                <form action="#" method="post" id="loginForm">
                    <input type="text" placeholder="아이디" name="userId" id="userId"><br>
                    <span class="idCheck" id="idCheck"></span><br>
                    <input type="password" placeholder="비밀번호" name="userPw" id="userPw"><br>
                    <span class="pwCheck" id="pwCheck"></span><br>
                    <button type="button" class="color-darkskyblue" id="loginBtn">로그인</button>
                </form>
            </div>
            <!-- 비회원 로그인 -->
            <div id="login-nonuser-login-input">
                <form action="<c:url value='/user/nonidLogin' />" method="post" id="nonIdloginForm">
                    <input type="text" placeholder="이름" name="nonUserName" id="noUserName"><br>
                    <span class="nonIdCheck" id="nonIdCheck"></span><br>
                    <input type="text" placeholder="전화번호" name="nonUserPhone" id="noUserPhone"><br>
                    <span class="nonPhCheck" id="nonPhCheck"></span><br>
                    
                    <button type="button" class="color-darkskyblue" id="nonIdLoginBtn">로그인</button>
                </form>
            </div>
        </div>
        <div id="login-links-div" >
            <a href="#" id="login-find-id">아이디 찾기</a> | <a href="#" id="login-find-pw">비밀번호 찾기</a> | <a href="<c:url value='/user/joinPage' />" id="login-join">회원가입</a>
        </div>
    </div>
    <!-- 아이디, 비번 찾기 모달 -->
    <div id="login-modal">
        <div class="login-modal-div">
            <div class="login-modal-xbtn-div login-clearfix color-skyblue">
                <div id="login-modal-title" class="login-float-left">아이디 찾기</div>
                <button id="login-modal-xbtn" class="login-btn-red login-float-right">x</button>
            </div>
            <div class="login-modal-content">
                <!-- 아이디 찾기 -->
                <div id="login-id-modal">
                    <form action="<c:url value='/user/findId' /> "  method="post" id="loginFindId">            
                        <div class="login-modal-content-text">
                            이름 입력
                        </div>
                        <input type="text" name="findIdName" id="findIdName" placeholder="이름"> <span id="nameCheck"></span>
                        <div class="login-modal-content-text">
                            이메일 입력
                        </div>
                        <div id="login-modal-id-numbermake-btn" class="login-clearfix">
                            <input type="text" name="findIdEmail" id="findIdEmail" placeholder="이메일" class="login-float-left"> <span id="emailCheck"></span>
                            <button type="button" class="login-float-right login-color-white color-darkskyblue login-btn-small" id="findId-emailNum">인증번호 발송</button>
                        </div>
                    </form>
                </div>
                <!-- 비밀번호 찾기 -->
                <div id="login-pw-modal">
                    <form action="#">            
                        <div class="login-modal-content-text">
                            아이디 입력
                        </div>
                        <div id="login-modal-id-numbermake-btn" class="login-clearfix">
                            <input type="text" name="" placeholder="아이디" class="login-float-left">
                            <button type="button" class="login-float-right login-color-white color-darkskyblue login-btn-small">인증번호 발송</button>
                        </div>
                    </form>
                </div>
                <!-- 인증번호 맞는지 확인 -->
                <div id="login-make-number-modal">
                    <hr>
                    <form action="#">            
                        <div class="login-modal-content-text">
                            인증번호 입력
                        </div>
                        <div id="login-modal-id-numberckeck" class="login-clearfix">
                            <input type="text" name="" placeholder="인증번호" class="login-float-left">
                            <button type="button" id="login-numbercheck-btn" class="login-float-right login-color-white color-darkskyblue login-btn-small">인증번호 확인</button>
                        </div>
                    </form>
                </div>
                
                <!-- 결과 모달(비밀번호면 text부분을 js로 변경)) -->
                <div id="login-result-modal">
                    <div id="login-result-title" class="login-modal-content-text">
                        아이디
                    </div>
                    <div id="login-check-result">
                        abc1234
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 푸터. jsp전환시 삭제 후 include 사용 -->
    <%@ include file="../include/footer.jsp" %>
    
    
<script>
    // 회원로그인, 비회원 로그인 전환
    const $user_login_modifier = $('#login-user-login-modifier');
    const $nonuser_login_modifier = $('#login-nonuser-login-modifier');
    const $user_login_input = $('#login-user-login-input');
    const $nonuser_login_input = $('#login-nonuser-login-input');
    
    $user_login_modifier.click(function(){
        if(! $user_login_modifier.hasClass('login-active')){
            $user_login_modifier.toggleClass('login-active');
            $nonuser_login_modifier.toggleClass('login-active');
            $user_login_modifier.toggleClass('login-left-inactive');
            $nonuser_login_modifier.toggleClass('login-right-inactive');
            $user_login_input.toggleClass('login-active');
            $nonuser_login_input.toggleClass('login-active')
        }
    });

    $nonuser_login_modifier.click(function(){
        if(! $nonuser_login_modifier.hasClass('login-active')){
            $user_login_modifier.toggleClass('login-active');
            $nonuser_login_modifier.toggleClass('login-active');
            $user_login_modifier.toggleClass('login-left-inactive');
            $nonuser_login_modifier.toggleClass('login-right-inactive');
            $user_login_input.toggleClass('login-active');
            $nonuser_login_input.toggleClass('login-active')
        }
    });

    // 아이디, 비번 찾기 모달
    const $modal = $('#login-modal');
    const $find_pw_btn = $('#login-find-pw');
    const $find_id_btn = $('#login-find-id');
    const $modal_xbtn = $('#login-modal-xbtn');
    const $numbercheck_btn = $('#login-numbercheck-btn');
    const $id_modal = $('#login-id-modal');
    const $pw_modal = $('#login-pw-modal');
    const $make_number_modal = $('#login-make-number-modal');
    const $result_modal = $('#login-result-modal');

    $modal.hide();
    
    $find_pw_btn.click(function(){
        event.preventDefault();
        $('#login-modal-title').text('비밀번호 찾기');
        $('#login-result-title').text('비밀번호');

        $modal.show();
        $id_modal.hide();
        $pw_modal.show();
        $make_number_modal.show();
        $result_modal.hide();
    });

    $find_id_btn.click(function(){
        event.preventDefault();
        $('#login-modal-title').text('아이디 찾기');
        $('#login-result-title').text('아이디');
        $modal.show();
        $id_modal.show();
        $pw_modal.hide();
        $make_number_modal.show();
        $result_modal.hide();
    });

    $modal_xbtn.click(function(){
        $modal.hide();
    });

    $numbercheck_btn.click(function(){
        
        $modal.show();
        $id_modal.hide();
        $pw_modal.hide();
        $make_number_modal.hide();
        $result_modal.show();
    });

      //---------------------------------


   //각 입력값들의 유효성 검증을 위한 정규 표현식을 변수로 선언
   const getIdCheck = RegExp(/^[a-zA-Z0-9]{5,12}$/);
   const getPwCheck = RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/);
   const getNameCheck = RegExp(/^[가-힣]+$/);
   const getPhoneCheck = RegExp(/^[0-9]{10,11}$/);
   const getEmailCheck = RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/);

   
      //입력값 중 하나라도 만족하지 못한다면 회원가입처리를 막기 위한 논리형 변수 선언
   let chk1 = false, chk2 = false, chk3 = false, chk4 = false;
      
      //ID 입력값 검증
      $('#userId').keyup(function() {
         if($('#userId').val() === ''){
            $('#userId').css('background-color', 'rgb(255, 234, 255)');
            $('#idCheck').html('<b style="font-size: 14px; color:red;"> [아이디를 입력하세요!]</b>');
            chk1 = false;
         }else if(!getIdCheck.test($(this).val())){
            $('#userId').css('background-color', 'rgb(255, 234, 255)');
            $('#idCheck').html('<b style="font-size: 14px; color:red;"> [영문,숫자 조합 5~12자로 입력하세요]</b>');
            chk1 = false;
         }else {
            $('#userId').css('background-color', 'rgb(232, 240, 254)');
            $('#idCheck').html('<b style="font-size: 14px; color: green;">[아이디 입력 완료]</b>');
            chk1 = true;
         }
      });//ID입력값 검증 끝   
         
   //PW 입력값 검증
      $('#userPw').keyup(function() {
         if($(this).val() === ''){
            $(this).css('background-color', 'rgb(255, 234, 255)');
            $('#pwCheck').html('<b style="font-size: 14px; color:red;"> [비밀번호를 입력하세요!]</b>');
            chk2 = false;
         }else if(!getPwCheck.test($(this).val())){
            $(this).css('background-color', 'rgb(255, 234, 255)');
            $('#pwCheck').html('<b style="font-size: 14px; color:red;"> [영문,숫자,특수문자 조합 8자 이상 입력하세요]</b>');
            chk2 = false;
         }
         else{
            $(this).css('background-color', 'rgb(232, 240, 254)');
            $('#pwCheck').html('<b style="font-size: 14px; color:green;"> [비밀번호 입력 완료]</b>');
            chk2 = true;
         }
      }); //PW 검증 끝   
      
   //로그인 버튼 클릭 이벤트
  
      $('#loginBtn').click(function() {
         if(chk1 && chk2){
            const id = $('#userId').val();  
            const pw = $('#userPw').val();
            console.log('id:' + id);
            console.log('pw:' + pw);
            
            const userInfo = { 
                  "userId": id, 
                  "userPw": pw,
            };
            console.log(userInfo);
            
      //ajax 시작
      $.ajax({
         type:"POST",
         url: "<c:url value='/user/loginCheck' />",
         headers: {
            "Content-Type" : "application/json"
         },
         dataType: "text",
         data: JSON.stringify(userInfo),
         success: function(data) { 
            if(data === 'idFail'){

               $('#userId').css('background-color', 'rgb(255, 234, 255)');
               $('#idCheck').html('<b style="font-size: 14px; color: red;">[존재하지 않는 아이디입니다]</b>');
               $('#userPw').val(''); 
               $('#userId').focus();               
               chk2 = false;
               
            }else if(data === 'pwFail'){

            	$('#userPw').css('background-color', 'rgb(255, 234, 255)');
               $('#pwCheck').html('<b style="font-size: 14px; color: red;">[비밀번호가 틀렸습니다]</b>');
               $('#userPw').val(''); 
               $('#userPw').focus(); 
               chk2 = false;
               
            }else if(data === 'loginOk'){
               location.href='/myweb';
            }
         },
         error: function() {
            console.log('통신 실패')
         }
      
      }); //ajax 끝
   }else{
      alert('입력값을 다시 확인하세요')
   }

   }); //로그인 이벤트 끝   
   
  //비회원 로그인 
  $('#nonIdLoginBtn').click(function() {
	if($('#noUserName').val() === '' ){
		alert('이름을 입력하세요');
		$('#noUserName').focus();
	}else if(!getNameCheck.test($('#noUserName').val())){
		alert('이름은 한글로만 작성하세요');
		$('#noUserName').focus();
	}else if($('#noUserPhone').val() === ''){
		alert("전화번호를 입력하세요");
		$('#noUserPhone').focus();
	}else if(!getPhoneCheck.test($('#noUserPhone').val())){
		alert("'-'를 제외한 숫자로만 10~11자리로 입력하세요");
		$('#noUserPhone').focus();
	}else{
		$('#nonIdloginForm').submit();
	}
})

	//-------------------------------------
	//아이디 찾기  
	$('#findId-emailNum').click(function() {
		if($('#findIdName').val() === ''){
			alert('이름을 입력하세요');
			$('#findIdName').focus();
		}else if(!getNameCheck.test($('#findIdName').val())){
			alert('이름은 한글로만 작성하세요');
			$('#findIdName').focus();
		}else if($('#findIdEmail').val() === ''){
			alert('이메일을 입력하세요');
			$('#findIdEmail').focus();
		}else if(!getEmailCheck.test($('#findIdEmail').val())){
			alert('@를 포함하여 작성하세요')
			$('#findIdEmail').focus();
		}else{
	
	
		      const name = $('#findIdName').val();  
		      const email = $('#findIdEmail').val();
		      
		      
		      const findInfo = { 
		            "findIdName": name, 
		            "findIdEmail": email,
		      };
		      console.log(findInfo);
			
		      //ajax 시작
		      $.ajax({
		         type:"POST",
		         url: "<c:url value='/user/findId' />" + "/" + email + "/" + name,
		         data: JSON.stringify(findInfo),
		         dataType: "text",
		         headers: {
		            "Content-Type" : "application/json"
		         },
		         success: function(data) { 
		           
		         },
		         error: function() {
		            console.log('통신 실패')
		         }
		      
		      }); //ajax 끝
		
		}
	})
	 

  
	
</script>