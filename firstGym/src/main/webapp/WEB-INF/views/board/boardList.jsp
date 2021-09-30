<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

    <%@include file="../include/header.jsp" %>
    

    <div class="boardList-main-div">
        <div class="boardList-sub-div">
            <div id="boardList-page-title">
            <c:if test="${page.condition == 'myBoard'}">내가 쓴 게시글</c:if>
            <c:if test="${page.condition != 'myBoard'}">
     			<c:if test="${page.category == 'info'}">공지사항</c:if>       
     			<c:if test="${page.category != 'info'}">게시글 목록</c:if>
            </c:if>
            </div>
            <hr>
            <!-- 상단 검색창 -->
            <c:if test="${page.condition != 'myBoard' && page.category != 'info'}">
            <div id="boardList-top-search-div">
                <form action="<c:url value="/board/boardListPage" />">
                    <div class="boardList-search-div">
                        <select name="category" id="">
                            <option value="none" ${page.category == 'none' ? 'selected' : ''}>--- 운동 카테고리 ---</option>
                            <option value="oxy" ${page.category == 'oxy' ? 'selected' : ''}>유산소 운동</option>
                            <option value="nonoxy" ${page.category == 'nonoxy' ? 'selected' : ''}>근력 운동</option>
                            <option value="yoga" ${page.category == 'yoga' ? 'selected' : ''}>요가, 스트레칭</option>
                        </select>
                        <select name="condition" id="">
                            <option value="title" ${page.condition == 'title' ? 'selected' : ''}>제목</option>
                            <option value="writer" ${page.condition == 'writer' ? 'selected' : ''}>작성자</option>
                            <option value="content" ${page.condition == 'content' ? 'selected' : ''}>내용</option>
                        </select>
                        <div>
                            <input name="keyword" type="text" value="${page.keyword}">
                            <button class="color-darkskyblue">검색</button>
                        </div>
                    </div>
                </form>
            </div>
            </c:if>
            <!-- 게시판 목록 -->
            <div id="boardList-list-div">
                <table>
                    <tr>
                        <th class="boardList-list-left-td">no.</th>
                        <th>content</th>
                        <th class="boardList-list-right-td">comment</th>
                    </tr>
                    <!-- 게시글 목록은 아래 tr을 복사 -->
                    <c:forEach var="article" items="${board}">
	                    <tr>
	                        <td class="boardList-list-left-td">${article.boardNum}</td>
	                        <td class="boardList-clearfix">
	                            <div class="boardList-content-div boardList-float-left">
	                                <div class="boardList-content-title">
	                                	<a href="<c:url value="/board/boardDetailPage/${article.boardNum}" />?category=${page.category}&condition=${page.condition}&keyword=${page.keyword}&pageNum=${page.pageNum}">
	                                		<c:if test="${article.boardCategory == 'oxy'}">[유산소 운동]</c:if>
                        					<c:if test="${article.boardCategory == 'nonoxy'}">[근력 운동]</c:if>
                       						<c:if test="${article.boardCategory == 'yoga'}">[요가, 스트레칭]</c:if>
	                                		${article.boardTitle}<br><br>
	                                	</a>
	                                </div>
	                                <div class="boardList-content-info">
	                                    <span>${article.userId}</span>
	                                    <span>조회수 ${article.boardView}</span>
	                                    <span><img src="${pageContext.request.contextPath }/resources/image/heart-full.svg" alt="heart"> ${article.boardRecom}</span>
	                                </div>
	                                <div class="boardList-content-date"><small><fmt:formatDate value="${article.boardDate}" pattern="yyyy.MM.dd" /></small></div>
	                            </div>
	                            <!-- 썸네일 이미지가 없으면 아래 div 표시x -->
	                            <c:if test="${article.boardThum != null}">
		                            <div class="boardList-content-img boardList-float-right" style="cursor: auto;">
		                                <img src="<spring:url value='${article.boardThum}' />" alt="img">
		                            </div>
	                            </c:if>
	                        </td>
	                        <td class="boardList-list-right-td"><img src="${pageContext.request.contextPath }/resources/image/talk.svg" alt="talk"> ${article.replyCnt}</td>
	                    </tr>
                    </c:forEach>
            	</table>
            </div>
            <!-- 게시글 등록 버튼 -->
            <c:if test="${page.condition != 'myBoard' && page.category != 'info'}">
	            <c:if test="${login != null}">
		            <div class="boardList-update-btn-div boardList-clearfix">
		                <button id="regist-btn" class="registBtn boardList-float-right">게시글 등록</button>
		            </div>
	            </c:if>
            </c:if>
            <!-- 페이징 바 -->
            <div class="boardList-paging-div">
	            <form action="<c:url value="/board/boardListPage" />" id="page-form">
	            	<input type="hidden" name="category" value="${page.category}">
	            	<input type="hidden" name="condition" value="${page.condition}">
	            	<input type="hidden" name="keyword" value="${page.keyword}">
	            	<input id="page-pn" type="hidden" name="pageNum" value="${page.pageNum}">
	                <ul>
	                    <!-- 이전버튼  -->
	                    <c:if test="${page.prev}">
	                    	<a href=""><li class="boardList-btn-not-check" data-pn="${page.beginPageNum-1}">&lt;</li></a>
	                    </c:if>
	                    <!-- 페이지 버튼(체크되면 class이름 변경) -->
	                    <c:forEach var="num" begin="${page.beginPageNum}" end="${page.endPageNum}">
		                    <a href="#"><li class="${page.pageNum == num ? 'boardList-btn-check' : 'boardList-btn-not-check'}" data-pn="${num}">${num}</li></a>
		                </c:forEach>
	                    <!-- 다음버튼 -->
	                    <c:if test="${page.next}">
	                    	<a href=""><li class="boardList-btn-not-check" data-pn="${page.endPageNum+1}">&gt;</li></a>
						</c:if>
	                </ul>
                </form>
            </div>
            <!-- 하단 검색창 -->
            <c:if test="${page.condition != 'myBoard' && page.category != 'info'}">
            <div id="boardList-bottom-search-div">
                <form action="<c:url value="/board/boardListPage" />">
                    <div class="boardList-search-div">
                        <select name="category" id="">
                            <option value="none" ${page.category == 'none' ? 'selected' : ''}>--- 운동 카테고리 ---</option>
                            <option value="oxy" ${page.category == 'oxy' ? 'selected' : ''}>유산소 운동</option>
                            <option value="nonoxy" ${page.category == 'nonoxy' ? 'selected' : ''}>근력 운동</option>
                            <option value="yoga" ${page.category == 'yoga' ? 'selected' : ''}>요가, 스트레칭</option>
                        </select>
                        <select name="condition" id="">
                            <option value="title" ${page.condition == 'title' ? 'selected' : ''}>제목</option>
                            <option value="writer" ${page.condition == 'writer' ? 'selected' : ''}>작성자</option>
                            <option value="content" ${page.condition == 'content' ? 'selected' : ''}>내용</option>
                        </select>
                        <div>
                            <input name="keyword" type="text" value="${page.keyword}">
                            <button class="color-darkskyblue">검색</button>
                        </div>
                    </div>
                </form>
            </div>
            </c:if>    
        </div>
    </div>
    <%@include file="../include/footer.jsp" %>
    <script>
    	$(document).ready(function(){
    		
    		//글 삭제여부 체크
    		if('${msg}' === 'deleteSuccess'){
    			alert('게시글이 삭제되었습니다.');
    		}
    		
    		//글 등록 버튼
	    	$('#regist-btn').click(function(){
	    		location.href = '<c:url value="/board/boardUpdatePage" />?category=${page.category}&condition=${page.condition}&keyword=${page.keyword}&pageNum=1';
	    	});
    		
    		//페이지버튼
    		
    		$('#page-form a').click(function(event){
    			event.preventDefault();
	    		$('#page-pn').val(event.target.getAttribute("data-pn"));
	    		$('#page-form').submit();
    		});
    		
    	});
    </script>
</html>