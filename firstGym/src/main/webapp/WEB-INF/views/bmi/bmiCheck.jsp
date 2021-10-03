<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

    <%@include file="../include/header.jsp"%>
    

    <section>
    	<c:set var="userYear" value="${fn:substring(login.userBirth, 0, 4)}" />
    	<c:set var="userMonth" value="${fn:substring(login.userBirth, 4, 6)}" />
    	<c:set var="userDay" value="${fn:substring(login.userBirth, 6, 8)}" />
    	
        <h3 class="bmiCheck-title">나의 BMI지수 검사하기</h3>
        <div class="bmiCheck-main">
            <form action="<c:url value='/bmi/bmiResult' />" name="bmiForm" method="post">
            
            	<input type="hidden" name="userId" value="${login.userId}">
                <table class="bmiCheck-table">
                    <tbody>
                        <tr> 
                            <th>성별</th>
                            <td><input type="radio" name="gender" value="male" class="bmiCheck-td-check" ${login.userGen == 'male' ? 'checked' : ''}> &nbsp;&nbsp;남</td>   
                            <td><input type="radio" name="gender" value="female" class="bmiCheck-td-check" ${login.userGen == 'female' ? 'checked' : ''}>&nbsp;&nbsp;여</td>
                        </tr>
                        <tr>
                            <th>생년월일</th>
                            <td>
                            	<!-- <input type="text" class="bmiCheck-td-text">&nbsp;&nbsp;년 -->
                            	<select class="bmi-select" name="year">
                            		<c:forEach var="num" begin="1930" end="2008">
                            			<option value="${num}" ${num == userYear ? 'selected' : ''}>${num}년</option>
                            		</c:forEach>
                            	</select>
                            </td>
                           
                            <td>
                            	<!-- <input type="text" class="bmiCheck-td-text">&nbsp;&nbsp;월 -->
                            	<select class="bmi-select" name="month">
                            		<c:forEach var="num" begin="1" end="12">
                            			<option value="${num}" ${num == userMonth ? 'selected' : ''}>${num}월</option>
                            		</c:forEach>
                            	</select>
                            </td>
                            <td>
                            	<!-- <input type="text" class="bmiCheck-td-text">&nbsp;&nbsp;일 -->
                            	<select class="bmi-select" name="day">
                            		<c:forEach var="num" begin="1" end="31">
                            			<option value="${num}" ${num == userDay ? 'selected' : ''}>${num}일</option>
                            		</c:forEach>
                            	</select>
                            </td>
                        </tr>
                        <tr>
                            <th>키</th>
                            <td><input type="text" maxlength="3" class="bmiCheck-td-text" id="height" name="height">&nbsp;&nbsp;cm</td>
                        </tr>
                        <tr>
                            <th>몸무게</th>
                            <td><input type="text" maxlength="3" class="bmiCheck-td-text" id="weight" name="weight">&nbsp;&nbsp;kg</td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div> 
        <div class="bmiCheck-calc">
            <button type="button" class="bmiCheck-calc-btn" id="submitBtn">검사하기</button>
        </div>
    </section>
    
    <div id="bmi-info" >
	    <div class="bmi-Main">
	        <h3 class="bmi-h3"><br>나의 BMI 지수 확인</h3><br><br>
	
		        <span class="bmi-writer">키 </span> <input type="hidden" >&nbsp;&nbsp;&nbsp; ${bmiCheck.height}cm<br><br>
		        <span class="bmi-writer">몸무게 </span> <input type="hidden" >&nbsp;&nbsp;&nbsp;  ${bmiCheck.weight}kg<br><br><br>
		        
		        <span class="bmiResult">당신의 비만도(BMI)지수는 <span class="bmiResult2">
		        <c:if test="${bmiResult.bmiResult == 'underweight'}">저체중</c:if>
	            <c:if test="${bmiResult.bmiResult == 'normalweight'}">정상</c:if>
	            <c:if test="${bmiResult.bmiResult == 'overweight'}">과체중</c:if>
	            <c:if test="${bmiResult.bmiResult == 'obesity'}">비만</c:if>
		        </span> &nbsp;입니다</span> <br><br>
		    
		        <div class="bmiBtn">
	                <button type="button" class="bmi-btn" id="bmi-result-re-btn">다시하기</button>
	                <button type="button" class="bmi-cn" id="bmi-to-last-result">지난 기록</button>
	            </div>
		
		</div>
	</div>
    
    <script>
    
    let replaceNotInt = /[^0-9]/gi;
    	
	$(document).ready(function(){
	    
		if('${msg}' !== 'bmiDone'){
			$('#bmi-info').hide();
		}
		
		$('#bmi-result-re-btn').click(function(){
			$('#bmi-info').hide();
		});
		
		$('#bmi-to-last-result').click(function(){
			location.href = '<c:url value="/bmi/bmiList" />';
		});
		
        $("#height").on("focusout", function() {
            const x = $(this).val();
            if(x.length > 0) {
                if(x.match(replaceNotInt)) {
                   x = x.replace(replaceNotInt, "");
                }
                $(this).val(x);
            }
        }).on("keyup", function() {
            $(this).val($(this).val().replace(replaceNotInt, ""));
        });

        $("#weight").on("focusout", function() {
            const x = $(this).val();
            if(x.length > 0) {
                if(x.match(replaceNotInt)) {
                   x = x.replace(replaceNotInt, "");
                }
                $(this).val(x);
            }
        }).on("keyup", function() {
            $(this).val($(this).val().replace(replaceNotInt, ""));
        });
        
        
        $('#submitBtn').click(function() {
			
        	if($('input[name="gender"]:checked').length <= 0) {
        		alert('성별을 체크해 주세요.');
        		return;
        	}
        	
        	const height = $('#height').val();
        	console.log(height);
        	if(height > 230 || height < 1) {
        		alert('올바른 키의 범위를 입력하세요 (1~230cm)');
        		$('#height').val('');
        		return;
        	}
        	
        	const weight = $('#weight').val();
        	console.log(weight);
        	if(weight > 200 || weight < 1) {
        		alert('올바른 몸무게의 범위를 입력하세요 (1~200kg)');
        		$('#weight').val('');
        		return;
        	}
        	
        	const msg = `-선택 정보-

# 성별: ` + $('input[name=gender]').val() + 
`
# 생년월일: ` + $('select[name=year]').val() + `년 ` + $('select[name=month]').val() + `월 ` + $('select[name=day]').val() + `일` + 
`
# 키: ` + $('#height').val() + `cm  # 몸무게: ` + $('#weight').val() + `kg 

입니다. 맞으면 확인버튼을, 틀리면 취소를 눌러주세요.` 
     	
     	
			if(confirm(msg)) {
				document.bmiForm.submit();
			} else {
				return;
			}
        	
		});
        
        
        
        
        
	 
    });
    
    </script>
    

    <%@include file="../include/footer.jsp" %>

</html>



























