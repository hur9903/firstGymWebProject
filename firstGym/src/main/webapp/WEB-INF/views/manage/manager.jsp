<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../include/header.jsp" %>


    
    <div class="manager-main-div">
        <div class="manager-sub-div">
            
                <div id="manager-first-table" class="manager-table-box">
                   
                    <div class="manager-order">관리자 화면</div>
                    <div class="manager-table-box2">
                        <span class="manager-order-main">신고 목록</span>
                        <table class="manager-main-table2" border="1px solid black">
                            <tr class="manager-table-tr">
                                <td class="manager-table-td1">번호</td>
                                <td class="manager-table-td2-1">내용</td>
                                <td class="manager-table-td2-2">신고자</td>
                                <td class="manager-table-td2-3">신고일</td>
                            </tr>
                            <c:forEach var="report" items="${reports}">
	                            <tr class="manager-table-tr2">
	                                <td class="manager-table-td2">${report.reportNum}</td>
	                                <td><a href="<c:url value='/manage/reportPage' />?reportNum=${report.reportNum}">
	                                	<c:if test="${report.reportContent == 'reason1'}">부적절한 홍보 게시글</c:if>
	                                	<c:if test="${report.reportContent == 'reason2'}">음란성 또는 청소년에게 부적합한 내용</c:if>
	                                	<c:if test="${report.reportContent == 'reason3'}">비방/욕설 게시글</c:if>
	                                	<c:if test="${report.reportContent == 'reason4'}">도배성 게시글</c:if>	                                
	                                </a></td>
	                                <td  style="font-weight: bold;">${report.userId}</td>
	                                <td><fmt:formatDate value="${report.reportDate}" pattern="yyyy.MM.dd HH:mm:ss" /></td>
	                            </tr>
                           </c:forEach>
                        </table>                
                    </div>
                    <form id="page-form" action="">
           		<!-- 페이징 바 -->
                    <div class="manager-paging-div">
                        <ul>
                            <!-- 이전버튼  -->
                            <c:if test="${page.prev}">
                            <a href=""><li class="manager-btn-not-check">&lt;</li></a>
                            </c:if>
                            <!-- 페이지 버튼(체크되면 class이름 변경) -->
	                    	<c:forEach var="num" begin="${page.beginPageNum}" end="${page.endPageNum}">
		                    	<a href=""><li class="${page.pageNum == num ? 'manager-btn-check' : 'manager-btn-not-check'}" data-pn="${num}">${num}</li></a>
		                	</c:forEach>
	                    	<!-- 다음버튼 -->
	                    	<c:if test="${page.next}">
	                    		<a href=""><li class="manager-btn-not-check" data-pn="${page.endPageNum+1}">&gt;</li></a>
							</c:if>
                            

                        </ul>
                    </div>
                    <input id="page-pn" type="hidden" name="pageNum" value="${page.pageNum}">    
            </form>
                    
                    <hr>
                </div>
            
                    <button id="write-info-btn" type="button" class="manager-write">공지사항 등록</button>                    
            		<button id="to-info-btn" type="button" class="manager-write">공지사항 목록</button>  
        </div>
    </div>

   
    <%@ include file="../include/footer.jsp" %>
    
    <script>
    	//공지로 이동
    	$('#to-info-btn').click(function(){
			location.href = '<c:url value="/board/boardListPage" />?category=info&condition=title&keyword=&pageNum=1';
		});
    	
    	//공지작성
		$('#write-info-btn').click(function(){
			location.href = '<c:url value="/board/boardUpdatePage"/>?category=info&condition=title&keyword=&pageNum=1';
		});
		
    	//페이징
		$('#page-form a').click(function(event){
			event.preventDefault();
    		$('#page-pn').val(event.target.getAttribute("data-pn"));
    		$('#page-form').submit();
		});
	</script>