<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <%@include file="../include/header.jsp" %>
    
    <div class="middle-body">
    <iframe width="720" height="350" src="https://www.youtube.com/embed/QH2-TGUlwu4" title="YouTube video player"
        frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
        allowfullscreen></iframe>
    <hr style="margin-top: 10px;" color="#c0e1f5" size="6px">
    <div class="homeboard clearfix">
        <div class="bestboard">
            <div class="in-box">
                <h4 class="best">인기 게시글</h4>
                <h3 class="best-more"><a href='#' class="moreview">더보기</a></h3>
            </div>
            <ul class="best-list">
                <a href="#">
                    <li class="hot-new clearfix">
                        <p class="writing">
                            인기글
                            <img src="image/icon_hot.png" alt="" width="20px">
                        </p>
                        <p class="date">2022-02-22</p>
                    </li>
                </a>
                <a href="#">
                    <li class="hot-new clearfix">
                        <p class="writing">
                            인기글
                            <img src="image/icon_hot.png" alt="" width="20px">
                        </p>
                        <p class="date">2022-02-22</p>
                    </li>
                </a>
                <a href="#">
                    <li class="hot-new clearfix">
                        <p class="writing">
                            인기글
                            <img src="image/icon_hot.png" alt="" width="20px">
                        </p>
                        <p class="date">2022-02-22</p>
                    </li>
                </a>
                <a href="#">
                    <li class="hot-new clearfix">
                        <p class="writing">
                            인기글
                            <img src="image/icon_hot.png" alt="" width="20px">
                        </p>
                        <p class="date">2022-02-22</p>
                    </li>
                </a>
            </ul>
        </div>
        <div class="recentboard">
            <div class="in-box">
                <h4 class="best">최신 게시글</h4>
                <h3 class="best-more"><a href='#' class="moreview">더보기</a></h3>
            </div>
            <ul class="recent-list">
                <a href="#">
                    <li class="hot-new clearfix">
                        <p class="writing">
                            최신글
                            <img src="image/icon_new.gif" alt="" width="25px">
                        </p>
                        <p class="date">2022-02-22</p>
                    </li>
                </a>
                <a href="#">
                    <li class="hot-new clearfix">
                        <p class="writing">
                            최신글
                            <img src="image/icon_new.gif" alt="" width="25px">
                        </p>
                        <p class="date">2022-02-22</p>
                    </li>
                </a>
                <a href="#">
                    <li class="hot-new clearfix">
                        <p class="writing">
                            최신글
                            <img src="image/icon_new.gif" alt="" width="25px">
                        </p>
                        <p class="date">2022-02-22</p>
                    </li>
                </a>
                <a href="#">
                    <li class="hot-new clearfix">
                        <p class="writing">
                            최신글
                            <img src="image/icon_new.gif" alt="" width="25px">
                        </p>
                        <p class="date">2022-02-22</p>
                    </li>
                </a>
                
            </ul>
        </div>
    </div>
    <hr color="#c0e1f5" size="6px" style="clear: both;">
    <div class="homegigu" style="display: inline-block;">
        <h4 style="float: left;">인기 기구</h4>
        <h3 style="float: right;"><a href='#' class="moreview">더보기</a></h3>
        <ul style="clear: both; display: flex; list-style: none; margin-left: 10px;">
            <li>
                <a href="#">
                    <div>
                        <img src="image/test.jpeg" width="160px" height="200px" alt="기구1">
                        <div class="best-homegigu-pic-box">
                            <h5 style="float: left;">기구명</h5>
                            <h5 style="float: right;">가격</h5>
                        </div>
                    </div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div>
                        <img src="image/test.jpeg" width="160px" height="200px" alt="기구1">
                        <div class="best-homegigu-pic-box">
                            <h5 style="float: left;">기구명</h5>
                            <h5 style="float: right;">가격</h5>
                        </div>
                    </div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div>
                        <img src="image/test.jpeg" width="160px" height="200px" alt="기구1">
                        <div class="best-homegigu-pic-box">
                            <h5 style="float: left;">기구명</h5>
                            <h5 style="float: right;">가격</h5>
                        </div>
                    </div>
                </a>
            </li>
            <li>
                <a href="#">
                    <div>
                        <img src="image/test.jpeg" width="160px" height="200px" alt="기구1">
                        <div class="best-homegigu-pic-box">
                            <h5 style="float: left;">기구명</h5>
                            <h5 style="float: right;">가격</h5>
                        </div>
                    </div>
                </a>
            </li>
        </ul>
    </div>
    <hr class="footerhr" color="gainsboro" size="6px" style="margin-top: 5px;">
</div>
<%@include file="../include/footer.jsp" %>


</html>