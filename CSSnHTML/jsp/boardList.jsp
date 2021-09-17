<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <%@include file="../include/header.jsp" %>
    

    <div class="boardList-main-div">
        <div class="boardList-sub-div">
            <div id="boardList-page-title">
                게시글 목록
            </div>
            <hr>
            <!-- 상단 검색창 -->
            <div id="boardList-top-search-div">
                <form action="#">
                    <div class="boardList-search-div">
                        <select name="" id="">
                            <option value="">--- 카테고리 ---</option>
                            <option value="">--- 카테고리 ---</option>
                            <option value="">--- 카테고리 ---</option>
                        </select>
                        <select name="" id="">
                            <option value="">제목</option>
                            <option value="">작성자</option>
                            <option value="">내용</option>
                        </select>
                        <div>
                            <input type="text">
                            <button class="color-darkskyblue">검색</button>
                        </div>
                    </div>
                </form>
            </div>
            <!-- 게시판 목록 -->
            <div id="boardList-list-div">
                <table>
                    <tr>
                        <th class="boardList-list-left-td">no.</th>
                        <th>content</th>
                        <th class="boardList-list-right-td">comment</th>
                    </tr>
                    <!-- 게시글 목록은 아래 tr을 복사 -->
                    <tr>
                        <td class="boardList-list-left-td">1234</td>
                        <td class="boardList-clearfix">
                            <div class="boardList-content-div boardList-float-left">
                                <div class="boardList-content-title"><a href="#">[카테고리] 제목</a></div>
                                <div class="boardList-content-info">
                                    <span>작성자</span>
                                    <span>조회수 0</span>
                                    <span><img src="image/heart-full.svg" alt="heart"> 0</span>
                                </div>
                                <div class="boardList-content-date"><small>2021.09.01</small></div>
                            </div>
                            <!-- 썸네일 이미지가 없으면 아래 div 표시x -->
                            <div class="boardList-content-img boardList-float-right">
                                <img src="image/sample-image.jpg" alt="img">
                            </div>
                        </td>
                        <td class="boardList-list-right-td"><img src="image/talk.svg" alt="talk"> 0</td>
                    </tr>
                    <!-- 예시용 리스트. 실제 구현시 삭제 -->
                    <tr>
                        <td class="boardList-list-left-td">1234</td>
                        <td class="boardList-clearfix">
                            <div class="boardList-content-div boardList-float-left">
                                <div class="boardList-content-title"><a href="#">[카테고리] 제목</a></div>
                                <div class="boardList-content-info">
                                    <span>작성자</span>
                                    <span>조회수 0</span>
                                    <span><img src="image/heart-full.svg" alt="heart"> 0</span>
                                </div>
                                <div class="boardList-content-date"><small>2021.09.01</small></div>
                            </div>
                            
                        </td>
                        <td class="boardList-list-right-td"><img src="image/talk.svg" alt="talk"> 0</td>
                    </tr>
                    <tr>
                        <td class="boardList-list-left-td">1234</td>
                        <td class="boardList-clearfix">
                            <div class="boardList-content-div boardList-float-left">
                                <div class="boardList-content-title"><a href="#">[카테고리] 제목</a></div>
                                <div class="boardList-content-info">
                                    <span>작성자</span>
                                    <span>조회수 0</span>
                                    <span><img src="image/heart-full.svg" alt="heart"> 0</span>
                                </div>
                                <div class="boardList-content-date"><small>2021.09.01</small></div>
                            </div>
                            <!-- 썸네일 이미지가 없으면 아래 div 표시x -->
                            <div class="boardList-content-img boardList-float-right">
                                <img src="image/sample-image.jpg" alt="img">
                            </div>
                        </td>
                        <td class="boardList-list-right-td"><img src="image/talk.svg" alt="talk"> 0</td>
                    </tr>
                    <tr>
                        <td class="boardList-list-left-td">1234</td>
                        <td class="boardList-clearfix">
                            <div class="boardList-content-div boardList-float-left">
                                <div class="boardList-content-title"><a href="#">[카테고리] 제목제목제목제목제목</a></div>
                                <div class="boardList-content-info">
                                    <span>작성자</span>
                                    <span>조회수 0</span>
                                    <span><img src="image/heart-full.svg" alt="heart"> 0</span>
                                </div>
                                <div class="boardList-content-date"><small>2021.09.01</small></div>
                            </div>
                            <!-- 썸네일 이미지가 없으면 아래 div 표시x -->
                            <div class="boardList-content-img boardList-float-right">
                                <img src="image/sample-image.jpg" alt="img">
                            </div>
                        </td>
                        <td class="boardList-list-right-td"><img src="image/talk.svg" alt="talk"> 0</td>
                    </tr>
                    <tr>
                        <td class="boardList-list-left-td">1234</td>
                        <td class="boardList-clearfix">
                            <div class="boardList-content-div boardList-float-left">
                                <div class="boardList-content-title"><a href="#">[카테고리] 제목제목제목제목제목</a></div>
                                <div class="boardList-content-info">
                                    <span>작성자</span>
                                    <span>조회수 0</span>
                                    <span><img src="image/heart-full.svg" alt="heart"> 0</span>
                                </div>
                                <div class="boardList-content-date"><small>2021.09.01</small></div>
                            </div>
                            <!-- 썸네일 이미지가 없으면 아래 div 표시x -->
                            <div class="boardList-content-img boardList-float-right">
                                <img src="image/sample-image.jpg" alt="img">
                            </div>
                        </td>
                        <td class="boardList-list-right-td"><img src="image/talk.svg" alt="talk"> 0</td>
                    </tr>
                    <tr>
                        <td class="boardList-list-left-td">1234</td>
                        <td class="boardList-clearfix">
                            <div class="boardList-content-div boardList-float-left">
                                <div class="boardList-content-title"><a href="#">[카테고리] 제목제목제목제목제목</a></div>
                                <div class="boardList-content-info">
                                    <span>작성자</span>
                                    <span>조회수 0</span>
                                    <span><img src="image/heart-full.svg" alt="heart"> 0</span>
                                </div>
                                <div class="boardList-content-date"><small>2021.09.01</small></div>
                            </div>
                            <!-- 썸네일 이미지가 없으면 아래 div 표시x -->
                            <div class="boardList-content-img boardList-float-right">
                                <img src="image/sample-image.jpg" alt="img">
                            </div>
                        </td>
                        <td class="boardList-list-right-td"><img src="image/talk.svg" alt="talk"> 0</td>
                    </tr>
                    <tr>
                        <td class="boardList-list-left-td">1234</td>
                        <td class="boardList-clearfix">
                            <div class="boardList-content-div boardList-float-left">
                                <div class="boardList-content-title"><a href="#">[카테고리] 제목제목제목제목제목</a></div>
                                <div class="boardList-content-info">
                                    <span>작성자</span>
                                    <span>조회수 0</span>
                                    <span><img src="image/heart-full.svg" alt="heart"> 0</span>
                                </div>
                                <div class="boardList-content-date"><small>2021.09.01</small></div>
                            </div>
                            <!-- 썸네일 이미지가 없으면 아래 div 표시x -->
                            <div class="boardList-content-img boardList-float-right">
                                <img src="image/sample-image.jpg" alt="img">
                            </div>
                        </td>
                        <td class="boardList-list-right-td"><img src="image/talk.svg" alt="talk"> 0</td>
                    </tr>
                    </table>
            </div>
            <!-- 게시글 등록 버튼 -->
            <div class="boardList-update-btn-div boardList-clearfix">
                <button class="color-darkskyblue boardList-float-right">게시글 등록</button>
            </div>
            <!-- 페이징 바 -->
            <div class="boardList-paging-div">
                <ul>
                    <!-- 이전버튼  -->
                    <a href=""><li class="boardList-btn-not-check">&lt;</li></a>
                    <!-- 페이지 버튼(체크되면 class이름 변경) -->
                    <a href=""><li class="boardList-btn-check">1</li></a>
                    <a href=""><li class="boardList-btn-not-check">2</li></a>
                    <a href=""><li class="boardList-btn-not-check">3</li></a>
                    <a href=""><li class="boardList-btn-not-check">4</li></a>
                    <a href=""><li class="boardList-btn-not-check">5</li></a>
                    <a href=""><li class="boardList-btn-not-check">6</li></a>
                    <a href=""><li class="boardList-btn-not-check">7</li></a>
                    <a href=""><li class="boardList-btn-not-check">8</li></a>
                    <a href=""><li class="boardList-btn-not-check">9</li></a>
                    <a href=""><li class="boardList-btn-not-check">10</li></a>
                        
                    <!-- 다음버튼 -->
                    <a href=""><li class="boardList-btn-not-check">&gt;</li></a>

                </ul>
            </div>
            <!-- 하단 검색창 -->
            <div id="boardList-bottom-search-div">
                <form action="#">
                    <div class="boardList-search-div">
                        <select name="" id="">
                            <option value="">--- 카테고리 ---</option>
                            <option value="">--- 카테고리 ---</option>
                            <option value="">--- 카테고리 ---</option>
                        </select>
                        <select name="" id="">
                            <option value="">제목</option>
                            <option value="">작성자</option>
                            <option value="">내용</option>
                        </select>
                        <div>
                            <input type="text">
                            <button class="color-darkskyblue">검색</button>
                        </div>
                    </div>
                </form>
            </div>    
        </div>
    </div>
    <%@include file="../include/footer.jsp" %>
</html>