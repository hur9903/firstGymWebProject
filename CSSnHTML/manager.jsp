<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="./include/header.jsp" %>

    <style>
        .orderDetail-main-div{
    min-width: 1000px;
    text-align: center;

}
.manager-sub-div{
    min-width: 600px;
    margin: 100px 20%;
    width: 60%;
    text-align: left;
    padding: 30px;
    position: relative;

    /* background: rgb(232, 246, 255); */
}
.manager-write{
    float: right;
    margin-right: 10px;
    margin-bottom: 10px;
    background-color: rgb(22, 143, 36);
    color: white;
    width: 100px;
    height: 30px;
    font-size: 15px;
    border: none;
    border-radius: 5px;
    font-weight: bold;
}
.manager-write:hover{
    cursor: pointer;
    background-color: rgb(55, 126, 27);
}
/* 테이블 테두리*/
.manager-main-div table{
    width: 100%;
    border: 2px solid rgb(0, 0, 0);
}
.manager-table-tr{
    font-weight: 600;
    text-align: center;
}
.manager-main-div td{
    padding: 5px;
    text-align: center;
}

.manager-main-table2{
    background: rgba(199, 255, 182, 0.3);
    margin-top: 15px;
    
}
.manager-table-td1{
    width: 10%;
    height: 50px;
}
.manager-table-td1-2{
    width: 60%;
    height: 50px;
}
.manager-table-td1-3{
    width: 50px;
    height: 50px;
}
.manager-table-td2{
    height: 40px;
}
.manager-table-td2-1{
    width: 50%;
}
.manager-table-td2-2{
    width: 20%;
}
td{
   width: 200px;
}

/* 상하 마긴 */

.manager-table-box2{
    margin-top: 150px;
}
/* 입력창 길이조절 */
.manager-input-full-width{
    width: 80%;
}
.manager-input-small-width{
    min-width: 150px;
}
/* 인풋창 설정 */
.manager-sub-div input,
.manager-sub-div select{
    padding: 5px;
    margin: 5px;
}
/* 텍스트에리어 설정 */
.manager-sub-div textarea{
    padding: 5px;
    margin: 5px;
    width: 80%;
    height: 60px;
    resize: none;
}
.manager-img{
    position: relative;
    width: 120px;
    height: 120px;
    cursor: pointer;
   
}

.manager-align-center{
    text-align: center;
}
.manager-order{
    text-align: center;
    color: rgb(0, 0, 0);
    font-size: 25px;
    font-weight: bolder;
    margin-bottom: 40px;
    margin-top: -80px;
}

.manager-order-main{
    font-size: 20px;
    font-weight: 600;
    color: rgb(59, 151, 94);
}
.manager-paging-div{
    text-align: center;
    margin-bottom: 30px;
}
.manager-paging-div *{
    display: inline-block;
    margin-top: 10px;
}
.manager-btn-check{
    background: rgb(129, 211, 122);
    border: none;
    color: white;
}
.manager-btn-not-check{
    background: white;
    border: 1px solid rgb(129, 211, 122);
    color: black;
}
.manager-paging-div li{
    height: 30px;
    width: 30px;
    text-align: center;
    line-height: 30px;
    cursor: pointer;
    border-radius: .25em;
}

    </style>
</head>
    <header>
        <div class='title'>
            <h1>FIRST GYM</h1>
            <div class="join">
                <a href="#">로그인</a>
                <a href="#">회원가입</a>
            </div>
        </div>
        <nav class='bar'>
            <ul>
                <li><a href="#">MBI 검사</a></li>
                <li><a href="#">운동기구</a></li>
                <li><a href="#">게시판</a></li>
                <li><a href="#">마이페이지</a></li>
                <li><a href="#">문의하기</a></li>
            </ul>
        </nav>      
    </header>
    
    <div class="manager-main-div">
        <div class="manager-sub-div">
            <form action="#">
                <div id="manager-first-table" class="manager-table-box">
                    
                    
                    <div class="manager-order">관리자 화면</div>
                    <button class="manager-write">작성하기</button>
                    <div class="manager-table-box">
                        <span class="manager-order-main">공지 사항</span>
                        <table class="manager-main-table2" border="1px solid black">
                            <tr class="manager-table-tr">
                                <td class="manager-table-td1">번호</td>
                                <td class="manager-table-td1-2">제목</td>
                                <td class="manager-table-td1-3">작성일</td>
                            </tr>
                            <tr class="manager-table-tr2">
                                <td class="manager-table-td2">1</td>
                                <td style="font-weight: bold;"><a href="#">안녕하세요</a></td>
                                <td>2021-09-27</td>
                            </tr>
                            <tr class="manager-table-tr2">
                                <td class="manager-table-td2">1</td>
                                <td style="font-weight: bold;"><a href="#">안녕하세요</a></td>
                                <td>2021-09-27</td>
                            </tr>
                            
                            
                        </table>
                    </div>
                    <!-- 페이징 바 -->
                    <div class="manager-paging-div">
                        <ul>
                            <!-- 이전버튼  -->
                            <a href=""><li class="manager-btn-not-check">&lt;</li></a>
                            <!-- 페이지 버튼(체크되면 class이름 변경) -->
                            <a href=""><li class="manager-btn-check">1</li></a>
                            <a href=""><li class="manager-btn-not-check">2</li></a>
                            <a href=""><li class="manager-btn-not-check">3</li></a>
                            <a href=""><li class="manager-btn-not-check">4</li></a>
                            <a href=""><li class="manager-btn-not-check">5</li></a>
                            <a href=""><li class="manager-btn-not-check">6</li></a>
                            <a href=""><li class="manager-btn-not-check">7</li></a>
                            <a href=""><li class="manager-btn-not-check">8</li></a>
                            <a href=""><li class="manager-btn-not-check">9</li></a>
                            <a href=""><li class="manager-btn-not-check">10</li></a>
                                
                            <!-- 다음버튼 -->
                            <a href=""><li class="manager-btn-not-check">&gt;</li></a>

                        </ul>
                    </div>
                    
                    <div class="manager-table-box2">
                        <span class="manager-order-main">신고 목록</span>
                        <table class="manager-main-table2" border="1px solid black">
                            <tr class="manager-table-tr">
                                <td class="manager-table-td1">번호</td>
                                <td class="manager-table-td2-1">제목</td>
                                <td class="manager-table-td2-2">신고자</td>
                                <td class="manager-table-td2-3">신고일</td>
                            </tr>
                            <tr class="manager-table-tr2">
                                <td class="manager-table-td2"></td>
                                <td><a href="#"></a></td>
                                <td  style="font-weight: bold;"></td>
                                <td></td>
                            </tr>
                           
                        </table>                
                    </div>
                    <!-- 페이징 바 -->
                    <div class="manager-paging-div">
                        <ul>
                            <!-- 이전버튼  -->
                            <a href=""><li class="manager-btn-not-check">&lt;</li></a>
                            <!-- 페이지 버튼(체크되면 class이름 변경) -->
                            <a href=""><li class="manager-btn-check">1</li></a>
                            <a href=""><li class="manager-btn-not-check">2</li></a>
                            <a href=""><li class="manager-btn-not-check">3</li></a>
                            <a href=""><li class="manager-btn-not-check">4</li></a>
                            <a href=""><li class="manager-btn-not-check">5</li></a>
                            <a href=""><li class="manager-btn-not-check">6</li></a>
                            <a href=""><li class="manager-btn-not-check">7</li></a>
                            <a href=""><li class="manager-btn-not-check">8</li></a>
                            <a href=""><li class="manager-btn-not-check">9</li></a>
                            <a href=""><li class="manager-btn-not-check">10</li></a>
                                
                            <!-- 다음버튼 -->
                            <a href=""><li class="manager-btn-not-check">&gt;</li></a>

                        </ul>
                    </div>
            </form>
        </div>
    </div>

   
    <%@ include file="./include/footer.jsp" %>