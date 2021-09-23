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
                <form action="#">
                    <input type="text" placeholder="이름" name=""><br>
                    <span class="nonIdCheck" id="nonIdCheck"></span><br>
                    <input type="text" placeholder="전화번호" name=""><br>
                    <span class="nonPhCheck" id="nonPhCheck"></span><br>
                    
                    <button type="button" class="color-darkskyblue">로그인</button>
                </form>
            </div>
        </div>
        <div id="login-links-div" >
            <a href="#" id="login-find-pw">비밀번호 찾기</a> | <a href="#" id="login-find-id">아이디 찾기</a> | <a href="#" id="login-join">회원가입</a>
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
                    <form action="#">            
                        <div class="login-modal-content-text">
                            이름 입력
                        </div>
                        <input type="text" name="" placeholder="이름">
                        <div class="login-modal-content-text">
                            이메일 입력
                        </div>
                        <div id="login-modal-id-numbermake-btn" class="login-clearfix">
                            <input type="text" name="" placeholder="이메일" class="login-float-left">
                            <button type="button" class="login-float-right login-color-white color-darkskyblue login-btn-small">인증번호 발송</button>
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
            $('#userId').css('background-color', 'rgb(229, 241, 221)');
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
            $('#pwCheck').html('<b style="font-size: 14px; color:red;"> [특수문자 포함 8자 이상 입력하세요]</b>');
            chk2 = false;
         }
         else{
            $(this).css('background-color', 'rgb(229, 241, 221)');
            $('#pwCheck').html('<b style="font-size: 14px; color:green;"> [비밀번호 입력 완료]</b>');
            chk2 = true;
         }
      }); //PW 검증 끝   
      
   //로그인 버튼 클릭 이벤트
      /*
      ID, PW 가져와서 객체로 포장.
      비동기 통신 진행하여 서버로 객체를 json 형태로 전송.
      console.log로 서버가 보내온 데이터를 확인 후 ID없다, PW틀렸다 , 로그인 성공이라는 메세지 브라우저에서 출력.
      서버에서 클라이언트로 데이터 전송은 text로 이루어지며 idFail, pwFail, loginSuccess라는 문자열 리턴.
      전송방싱: POST, url: /user/loginCheck
      */
      $('#loginBtn').click(function() {
         if(chk1 && chk2){
            const id = $('#userId').val();  
            const pw = $('#userPw').val();
            console.log('id:' + id);
            console.log('pw:' + pw);
            
            const userInfo = { 
                  "userId": id, //""는 단순 변수명
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
               /* console.log('아이디가 없습니다') */
               $('#userId').css('background-color', 'rgb(255, 234, 255)');
               $('#idCheck').html('<b style="font-size: 14px; color: red;">[존재하지 않는 아이디입니다]</b>');
               $('#userPw').val(''); //값 바꿀땐 ()안에 ''으로 작성
               $('#userId').focus(); //커서를 이동시키고, 스크롤도 해당 위치로 이동
               chk1 = false, chk2 = false;
               
            }else if(data === 'pwFail'){
               /* console.log('비밀번호가 틀렸습니다') */
               $('#userPw').css('background-color', 'rgb(255, 234, 255)');
               $('#pwCheck').html('<b style="font-size: 14px; color: red;">[비밀번호가 틀렸습니다]</b>');
               $('#userPw').val(''); 
               $('#userPw').focus(); 
               chk2 = false;
               
            }else if(data === 'loginOk'){
               /* console.log('로그인 성공') */
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
   
         

         
</script>