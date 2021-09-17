<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="./include/header.jsp" %>
    
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
    <%@ include file="./include/footer.jsp" %>

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

        $mypageMain_bmiBtn.click(function(){
            $modal_bmiList.show()
        })

        $bmiList_confirm.click(function(){
            $modal_bmiList.hide()
        })

    </script>

