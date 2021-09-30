<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<footer >
    <div class="footer-container">
        <div class="row">
            <div class="col-md-7 col-sm-12">
                <img src="${pageContext.request.contextPath }/resources/image/firstgymLogo.png" alt="" class="footer-logo">
                <div class="copyright">
                    
                    <ul>
                        <li>FIRST GYM 정보</li><br>
                        <li> (주) FIRST GYM </li>
                        <li>주소: 서울특별시 마포구 신촌로 176 (대흥동)</li>
                        <li>PRODUCE BY: 문두영, 이도영, 임예슬, 허건 </li>
                        <li>COPYRIGHT &copy; 2021. FRISTGYM ALL RIGHTS RESERVED</li>
                    </ul>
                </div>
            </div>
      
        </div>
        <div class="footer-menu">
            <ul>
                <li>고객센터</li><br>
                <li><img src="${pageContext.request.contextPath }/resources/image/mail.png" alt="" class="footer-mail"> E-MAIL: firstGymSpringProject@gmail.com</li>
                <li><button class="footer-manager" id="footer-manager">문의하기</button></li>
            </ul>
            
        </div>
    </div>
</footer>
</html>

<!-- email문의 -->
<div id="email-info" >
    <div class="email-Main">
        <h3 class="email-h3">이메일 문의하기</h3><br><br>

		<form id="emailForm">
	        <span class="email-writer">작성자 아이디 </span> <input type="hidden" name="sending" value="${login.userEmail }">&nbsp; ${login.userId }
	        
	        <textarea class="email-text" placeholder="문의 하실 내용을 입력하세요." name="content" id="emailContent"></textarea>
	    
	        <button type="button" class="email-btn" id="email-btn">보내기</button>
	        <button type="button" class="email-cn" id="email-cn">취소</button>
		</form>


<script>



	const $emailInfo = $('#email-info');
	const $managerEmail = $('#footer-manager');
	const $emailBtn = $('#email-btn');
	const $emailCn = $('#email-cn');
	const $content = $('#emailContent');
	
	$emailInfo.hide();
	$managerEmail.click(function() {
		$emailInfo.show();
	})
	
	$emailCn.click(function() {
		$emailInfo.hide();
	})


	emailjs.init('user_f2hBQR6PwERboMjhfS91J');
	
	$emailBtn.click(function() {
		if($content.val() === '' ){
			alert('문의 내용이 작성되지 않았습니다.');
			$content.focus();
		}else{

		         emailjs.sendForm('service_fkwpacb', 'template_tnmux4k', '#emailForm').then(function(response) {
		               console.log('메일 발송 성공', response.status, response.text);         
		            	alert('문의가 성공적으로 접수되었습니다');
		            	$content.val('');
		            	$emailInfo.hide();
		         }, function(error) {
		               console.log('문의 실패', error);
		               	alert('실패')
		            });
		}

	 });
	
</script>


