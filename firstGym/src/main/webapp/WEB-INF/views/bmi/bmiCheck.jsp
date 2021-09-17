<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <%@include file="../include/header.jsp"%>
    

    <section>
        <h3 class="bmiCheck-title">나의 BMI지수 검사하기</h3>
        <div class="bmiCheck-main">
            <form action="">
                <table class="bmiCheck-table">
                    <tbody>
                        <tr>
                            <th>성별</th>
                            <td><input type="radio" name="#" class="bmiCheck-td-check"> &nbsp;&nbsp;남</td>   
                            <td><input type="radio" name="#" class="bmiCheck-td-check">&nbsp;&nbsp;여</td>
                        </tr>
                        <tr>
                            <th>생년월일</th>
                            <td><input type="text" class="bmiCheck-td-text">&nbsp;&nbsp;년</td>
                            <td><input type="" class="bmiCheck-td-text">&nbsp;&nbsp;월</td>
                            <td><input type="text" class="bmiCheck-td-text">&nbsp;&nbsp;일</td>
                        </tr>
                        <tr>
                            <th>키</th>
                            <td><input type="text" class="bmiCheck-td-text">&nbsp;&nbsp;cm</td>
                        </tr>
                        <tr>
                            <th>몸무게</th>
                            <td><input type="text" class="bmiCheck-td-text">&nbsp;&nbsp;kg</td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div> 
        <div class="bmiCheck-calc">
            <button type="submit" class="bmiCheck-calc-btn">검사하기</button>
        </div>
    </section>

    <%@include file="../include/footer.jsp" %>

</html>