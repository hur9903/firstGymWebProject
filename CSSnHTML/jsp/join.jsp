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
            <form action="#">
                <div class="join-clearfix">
                    <span class="join-float-left">*아이디</span>
                    <span class="join-float-right"><input type="text" placeholder="아이디" name=""><button type="button" class="join-color-pruple">중복확인</button></span>
                </div>
                <div class="join-clearfix">
                    <span class="join-float-left">*비밀번호</span>
                    <span class="join-float-right"><input type="password" placeholder="비밀번호" name=""></span>
                </div>
                <div class="join-clearfix">
                    <span class="join-float-left">*비밀번호확인</span>
                    <span class="join-float-right"><input type="password" placeholder="비밀번호" name=""></span>
                </div>
                <div class="join-clearfix">
                    <span class="join-float-left">*이름</span>
                    <span class="join-float-right"><input type="text" placeholder="이름" name=""></span>
                </div>
                <div class="join-clearfix">
                    <span class="join-float-left">*생년월일</span>
                    <span class="join-float-right"><input type="text" placeholder="생년월일" name=""></span>
                </div>
                <div class="join-clearfix">
                    <span class="join-float-left">*성별</span>
                    <span class="join-float-right"><input type="checkbox" name="#" id="">&nbsp;&nbsp;&nbsp;남&nbsp;&nbsp;&nbsp;<input type="checkbox" name="#">&nbsp;&nbsp;&nbsp;여</span>
                </div>
                <div class="join-clearfix">
                    <span class="join-float-left">*E-mail</span>
                    <span class="join-float-right"><input type="email" placeholder="본인 확인 이메일" name=""><button type="button" class="join-color-pruple">중복확인</button></span>
                </div>
                <div class="join-clearfix">
                    <span class="join-float-left">*휴대전화</span>
                    <span class="join-float-right"><input type="text" placeholder="휴대전화"> <span class="join-other">(입력 시 '-' 없이 숫자만 입력하세요)</span></span>
                </div>
                <div class="join-clearfix">
                    <span class="join-float-left">*우편번호</span>
                    <span class="join-float-right"><input type="text" placeholder="우편번호"><button type="button" class="mypageModify-mailFind">주소찾기</button></span>
                </div>
                <div class="join-clearfix">
                    <span class="join-float-left">*주소</span>
                    <span class="join-float-right"><input type="address" placeholder="주소"></button></span>
                </div>
                <div class="join-clearfix">
                    <span class="join-float-left">*상세주소</span>
                    <span class="join-float-right"><input type="address" placeholder="상세주소"></button></span>
                </div>
                <div class="join-center"><button type="submit" class="color-darkskyblue">가입하기</button></div>
            </form>
        </div>
    </div>
    <%@include file="../include/footer.jsp" %>
</html>