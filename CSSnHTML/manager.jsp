<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="./include/header.jsp" %>


    
    <div class='gongji'>
        <h1>공지사항</h1>
        <div style="overflow: scroll;">
            <table style="margin: auto">
                <th>제목</th>
                <th>작성일자</th>
                <tr>
                    <td><a href="#">제목1</a></td>
                    <td>작성일자1</td>
                </tr>
                <tr>
                    <td><a href="#">제목2</a></td>
                    <td>작성일자2</td>
                </tr>
                <tr>
                    <td><a href="#">제목3</a></td>
                    <td>작성일자3</td>
                </tr>
            </table>
        </div>
        <button onclick="location='#'">전체 보기</button>
        <button onclick="location='#'">공지 작성</button>
    </div>
    <hr color="#3498db" size="10px">
    <div class='report'>
        <h1>신고 목록</h1>
        <div style="overflow: scroll;">
            <table style="margin: auto">
                <th>제목</th>
                <th>작성자</th>
                <th>작성일자</th>
                <tr>
                    <td><a href="#">제목1</a></td>
                    <td>작성자1</td>
                    <td>작성일자1</td>
                </tr>
                <tr>
                    <td><a href="#">제목2</a></td>
                    <td>작성자2</td>
                    <td>작성일자2</td>
                </tr>
                <tr>
                    <td><a href="#">제목3</a></td>
                    <td>작성자3</td>
                    <td>작성일자3</td>
                </tr>
            </table>
        </div>
        <button onclick="location='#'">전체 보기</button>
    </div>
    <hr color="#3498db" size="10px">
    <div class='users'>
        <h1>회원 목록</h1>
        <div style="overflow: scroll;">
            <table style="margin: auto;">
                <th colspan="3">회원 목록</th>
                <!-- <th style="display: none;"></th>
                <th style="display: none;"></th> -->
                <tr>
                    <td>회원이름1</td>
                    <td><button>회원정보</button></td>
                    <td><button>회원탈퇴</button></td>
                </tr>
                <tr>
                    <td>회원이름2</td>
                    <td><button>회원정보</button></td>
                    <td><button>회원탈퇴</button></td>
                </tr>
                <tr>
                    <td>회원이름3</td>
                    <td><button>회원정보</button></td>
                    <td><button>회원탈퇴</button></td>
                </tr>
            </table>
        </div>
    </div>
    <hr class="footerhr" color="#3498db" size="10px">
<%@ include file="./include/footer.jsp" %>