<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <%@include file="../include/header.jsp" %>
    

    <div class="dailyCheck-main-div">
        <div id="check">출석체크</div>
        <div id="span">
            <button class="button1">&lt;</button>
            <span>9월</span>
            <button class="button1">&gt;</button>
        </div>
        <div>
            <table>
                <tbody>
                    <tr>
                        <td>1일차</td>
                        <td>2일차</td>
                        <td>3일차</td>
                        <td>4일차</td>
                        <td>5일차</td>
                        <td>6일차</td>
                        <td>7일차</td>
                    </tr>
                    <tr>
                        <td>8일차</td>
                        <td>9일차</td>
                        <td>10일차</td>
                        <td>11일차</td>
                        <td>12일차</td>
                        <td>13일차</td>
                        <td>14일차</td>
                    </tr>
                    <tr>
                        <td>15일차</td>
                        <td>16일차</td>
                        <td>17일차</td>
                        <td>18일차</td>
                        <td>19일차</td>
                        <td>20일차</td>
                        <td>21일차</td>
                    </tr>
                    <tr>
                        <td>22일차</td>
                        <td>23일차</td>
                        <td>24일차</td>
                        <td>25일차</td>
                        <td>26일차</td>
                        <td>27일차</td>
                        <td>28일차</td>
                    </tr>
                    <tr>
                        <td>29일차</td>
                        <td>30일차</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="button">
            <button class="buttonColor">출석하기</button>
        </div>
    </div>

    <%@include file="../include/footer.jsp" %>
</html>