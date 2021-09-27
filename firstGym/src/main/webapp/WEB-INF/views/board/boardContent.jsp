<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
    

<body>
    <%@include file="../include/header.jsp" %>

    <!-- 게시글 상세보기 -->
    <div class="boardContent-main-div">
        <div class="boardContent-sub-div">
            <div id="boardContent-page-title">
                게시글 상세보기
            </div>
            <div class="boardContent-content-main-div">
                <hr>
                <div class="boardContent-updonw-padding-div boardContent-clearfix">
                    <div class="boardContent-float-left">
                        <button id="list-btn" class="color-darkskyblue boardContent-btn-big">목록</button>
                    </div>
                    <div class="boardContent-float-right">
                    	<c:if test="${login.userId == article.userId}">
	                        <form id="del-form" action="<c:url value="/board/boardDelete" />" method="post">
	                        	<button id="mod-btn" type="button" class="color-darkskyblue boardContent-btn-big">수정</button>
	                        	<input type="hidden" name="boardNum" value="${article.boardNum}">
	                        	<button id="del-btn" type="button" class="boardContent-del boardContent-btn-big">삭제</button>
	                        </form>
                        </c:if>
                    </div>
                </div>
                <hr>
                <div class="boardContent-updonw-padding-div boardContent-clearfix">
                    <div id="boardContent-content-title" class="boardContent-float-left">
                        <c:if test="${article.boardCategory == 'oxy'}">[유산소 운동]</c:if>
                        <c:if test="${article.boardCategory == 'nonoxy'}">[근력 운동]</c:if>
                        <c:if test="${article.boardCategory == 'yoga'}">[요가, 스트레칭]</c:if>
                        ${article.boardTitle}
                    </div>
                    <div class="boardContent-float-right">
                        <!-- 클릭 시 하트 이미지 바꾸고 좋아요 수 비동기 통신으로 가져오기 -->
                        <button id="boardContent-heart-btn" class="boardContent-btn-heart"><img class="boardContent-heart" src="${pageContext.request.contextPath }/resources/image/heart-empty.svg" alt="heart"> ${article.boardRecom}</button>
                    </div>
                </div>
                <hr>
                <div class="boardContent-updonw-padding-div boardContent-clearfix">
                    <div class="boardContent-float-left">
                        <small>등록일: <fmt:formatDate value="${article.boardDate}" pattern="yyyy.MM.dd HH:mm:ss" /></small>
                    </div>
                    <div class="boardContent-float-right">
                        <small>작성자: ${article.userId}</small>
                    </div>
                </div>
                <hr>
                <div class="boardContent-content-sub-div">
                    <!-- 이미지, 동영상 영역 -->
                    <c:if test="${article.boardThum != null}">
	                    <div class="boardContent-carousel-div boardContent-updonw-margin-div boardContent-updonw-padding-div">
	                        <div id="boardContent-arrow-left" class="boardContent-arrow color-darkskyblue boardContent-float-left">
	                            ◁
	                        </div>
	                        <div class="boardContent-images-div">
	                            <li>
	                            	<c:if test="${article.boardVideo != null}">
	                                	<!-- 동영상.-->
	                                	<ul><div class="boardContent-img boardContent-video-img"><img src="<spring:url value='${article.boardThum}' />" alt="sample"><div class="boardContent-video-text color-darkskyblue">▶</div></div></ul>
	                                </c:if>
	                                <c:forEach var="img" items="${images}">
	                                <!-- 이미지 -->
	                                	<ul><div class="boardContent-img boardContent-img-img"><img src="<spring:url value='${img}' />" alt="sample"></div></ul>
	                                </c:forEach>
	                                
	                            </li>
	                        </div>
	                        <div id="boardContent-arrow-right" class="boardContent-arrow color-darkskyblue boardContent-float-right">
	                            ▷
	                        </div>
	                    </div>
                    </c:if>
                    <!-- 컨텐츠 영역 -->
                    <div class="boardContent-content-area-div">
                        <div class="boardContent-content-div">
                            <!-- 여기에 DB에서 가져온 내용 넣기 -->
	                        ${article.boardContent}
                        </div>
                        <div class="boardContent-report-btn-div">
                            <button id="boardContent-report-btn" class="boardContent-color-white boardContent-btn-small">신고하기</button>
                        </div>
                    </div>
                    <!-- 댓글영역 -->
                    <div id="reply" class="boardContent-reply">
                        <div class="boardContent-reply-area-div">
                            <div class="boardContent-updonw-margin-div boardContent-clearfix">
                                <textarea id="board-reply-input" type="text" placeholder="댓글 입력" class="boardContent-float-left"></textarea>
                                <button id="board-reply-regist-btn" type="button" class="boardContent-float-left boardContent-reg boardContent-color-white boardContent-btn-small">등록</button>
                            </div>
                            <div id="boardContent-reply-area" class="boardContent-reply-list-div">
                                <!-- 댓글 추가 시 아래 div 반복시켜 출력 -->
                                <!-- <div class="boardContent-updonw-margin-div boardContent-each-reply-div boardContent-clearfix">
                                    <div class="boardContent-float-left boardContent-reply-content">
                                        <p><strong>댓글 작성자</strong></p>
                                        <p class="boardContent-updonw-padding-div">댓글 내용~</p>
                                        <p><small>2021.09.01</small></p>
                                    </div>
                                    <div class="boardContent-float-right boardContent-reply-btn-div">
                                        <button class="boardContent-color-white color-darkskyblue boardContent-btn-small">수정</button>
                                        <button class="boardContent-del boardContent-color-black boardContent-btn-small">삭제</button>
                                    </div>
                                </div> -->
                            </div>
                        </div>
                        <!-- 페이징 바 -->
                        <div class="boardList-paging-div boardContent-each-reply-div">
                            <ul id="boardContent-pageing-bar">
                                <!-- 이전버튼  -->
                                <!-- <a href=""><li class="boardList-btn-not-check">&lt;</li></a> -->
                                <!-- 페이지 버튼(체크되면 class이름 변경) -->
                                <!-- <a href=""><li class="boardList-btn-check">1</li></a>
                                <a href=""><li class="boardList-btn-not-check">2</li></a>
                                <a href=""><li class="boardList-btn-not-check">3</li></a>
                                <a href=""><li class="boardList-btn-not-check">4</li></a>
                                <a href=""><li class="boardList-btn-not-check">5</li></a>
                                <a href=""><li class="boardList-btn-not-check">6</li></a>
                                <a href=""><li class="boardList-btn-not-check">7</li></a>
                                <a href=""><li class="boardList-btn-not-check">8</li></a>
                                <a href=""><li class="boardList-btn-not-check">9</li></a>
                                <a href=""><li class="boardList-btn-not-check">10</li></a> -->
                                    
                                <!-- 다음버튼 -->
                                <!-- <a href=""><li class="boardList-btn-not-check">&gt;</li></a> -->

                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
    </div><!--게시글 상세보기 끝-->
    
    <!-- 이미자, 동영상 모달 창 -->
    <div id="boardContent-img-modal">
        <div class="boardContent-modal-div">
            <div class="boardContent-modal-xbtn-div boardContent-clearfix color-skyblue">
                <button id="boardContent-img-modal-xbtn" class="color-darkskyblue boardContent-btn-red boardContent-float-right">x</button>
            </div>
            <div class="boardContent-modal-img">
                <img src="" alt="img">
                <video src="<spring:url value='${article.boardVideo}' />" controls></video>
            </div>
        </div>
    </div>

    <!-- 신고하기 모달 창 -->
    <div id="boardContent-report-modal">
        <div class="boardContent-modal-div">
            <div class="boardContent-modal-xbtn-div boardContent-clearfix color-skyblue">
                <div class="boardContent-modal-title boardContent-float-left">신고하기</div>
                <button id="boardContent-report-modal-xbtn" class="boardContent-btn-red boardContent-float-right">x</button>
            </div>
            <form action="#">
                <div class="boardContent-modal-content">
                    <div id="boardContent-modal-content-title" class="boardContent-updonw-margin-div">
                        신고 사유
                    </div>
                    <div id="boardContent-modal-select" class="boardContent-updonw-margin-div">
                        <select name="" id="">
                            <option value="">---- 신고 사유 옵션 ----</option>
                            <option value="">---- 신고 사유 옵션 ----</option>
                            <option value="">---- 신고 사유 옵션 ----</option>
                            <option value="">---- 신고 사유 옵션 ----</option>
                        </select>
                    </div>
                </div>
                <div class="boardContent-modal-bottombtn boardContent-clearfix">
                    <div class="boardContent-float-right">
                        <button type="button" id="boardContent-report-modal-undobtn" class="boardContent-color-black boardContent-btn-small">취소</button>
                        <button type="submit" class="boardContent-color-white color-darkskyblue boardContent-btn-small">등록</button>
                    </div>    
                </div>
            </form>
        </div>
    </div>
    <%@include file="../include/footer.jsp" %>


<script>
    $(document).ready(function() {

    	//*** 화면 에니메이션 + 모달창 관련  ***//
        //* 이미지바 이동 *//
        let is_mouse_down = false;
        let right_move = false;
        const $img_border_box = $('.boardContent-images-div');
        const $img_box = $('.boardContent-images-div li');

        $('#boardContent-arrow-left').mousedown(function(){
            is_mouse_down = true;
            img_move('left');
        });
        $('#boardContent-arrow-left').mouseup(function(){
            is_mouse_down = false;
        });
        $('#boardContent-arrow-right').mousedown(function(){
            is_mouse_down = true;
            img_move('right');
        });
        $('#boardContent-arrow-right').mouseup(function(){
            is_mouse_down = false;
        });

        function img_move(witch_side){
            if(is_mouse_down){
                if($img_border_box.width() <= $img_box.width()){
                    if(witch_side === 'right'){
                        $img_box.css('left', ($img_box.position().left - 25) + 'px');
                        
                        if($img_box.position().left <= - ($img_box.outerWidth() - $img_border_box.innerWidth())){
                            $img_box.css('left', - ($img_box.outerWidth() - $img_border_box.innerWidth()) + 'px');
                        }
                    }
                    else{
                        $img_box.css('left', ($img_box.position().left + 25) + 'px');
                        if($img_box.position().left >= 0){
                            $img_box.css('left', '0px');
                        }
                    }
                    setTimeout(function() {
                    img_move(witch_side);
                }, 100);
                }
            }
        };

        //* 이미지 모달 *//
        const $img_modal = $('#boardContent-img-modal');
        const $img_modal_img = $('#boardContent-img-modal img');
        const $img_modal_video = $('#boardContent-img-modal video');

        $img_modal.hide();

        $('.boardContent-img-img img').click(function(){
            $img_modal_img.attr("src", $(this).attr("src"));
            $img_modal.show();
            $img_modal_img.show();
            $img_modal_video.hide();
        });

        $('.boardContent-video-img').click(function(){
            $img_modal.show();
            $img_modal_img.hide();
            $img_modal_video.show();
        });

        $('#boardContent-img-modal-xbtn').click(function(){
            $img_modal.hide();
            $img_modal_video.get(0).pause();
        });

        //* 신고하기 모달 *//
        $('#boardContent-report-modal').hide();

        $('#boardContent-report-btn').click(function(){
            $('#boardContent-report-modal').show();
        });

        $('#boardContent-report-modal-xbtn').click(function(){
            $('#boardContent-report-modal').hide();
        });
        $('#boardContent-report-modal-undobtn').click(function(){
            $('#boardContent-report-modal').hide();
        });
        
        
	    //*** 게시글 리스트 이동버튼, 게시글 수정 + 삭제 버튼  ***//
        //* 리스트로 이동 버튼 *//
        $('#list-btn').click(function(){
        	location.href='<c:url value="/board/boardListPage" />';
        });
        
        //* 게시글 수정 버튼 *//
        $('#mod-btn').click(function(){
        	location.href='<c:url value="/board/boardModifyPage?boardNum=${article.boardNum}" />';
        });
        
        //* 게시글 삭제 버튼 *//
        $('#del-btn').click(function(){
        	if(confirm('정말 삭제하시겠습니까?')){
        		$('#del-form').submit();
        	}
        });
        
      	//*** 댓글 관련  ***//
        //* 댓글 등록 버튼 *//
        let registBtnUrl = "<c:url value='/reply/replyUpdate' />";
        
        $('#board-reply-regist-btn').click(function(){
        	if('${login}' === ''){
        		alert('댓글을 등록하려면 로그인해주세요.');
        		return;
        	}
        	
        	const replyContent = $('#board-reply-input').val();
        	const boardNum = '${article.boardNum}';
        	const userId = '${login.userId}';
        	
        	if(replyContent === ''){
        		alert('댓글을 입력해주세요.');
        		return;
        	}
        	
        	if(replyContent.length > 50){
        		alert('댓글은 50자 이내로 작정해주세요. 현재 글자 수: ' + replyContent.length);
        		return;
        	}
        	
        	$.ajax({
				type: "post",
				url: registBtnUrl,
				data: JSON.stringify(
					{
						"boardNum": boardNum,
						"userId": userId,
						"replyContent": replyContent
					}		
				),
				dataType: "text",
				headers: {
					"Content-Type" : "application/json"
				},
				success: function(data) {
					console.log(data);
					$('#board-reply-input').val('');
					
					//댓글 다시 불러오기
					getReplyList(1);
				},
				error: function() {
					alert('댓글 등록 중 오류가 발생했습니다.');
				}
			}); //ajax end	
        });//댓글 등록 이벤트 end
        
        //* 댓글 현재 페이지 변수 *//
        let thisPageNum = 1;
        
        //* 댓글리스트 호출 *// 
        let registListUrl = "<c:url value='/reply/replyList' />" + "/" + ${article.boardNum};
        
        function getReplyList(pageNum){
        	thisPageNum = pageNum;
        	
        	$.getJSON(
        		registListUrl + "/" + pageNum,
        		function(data){
        			
        			//페이징 정보
        			let pageNum = data.page.pageNum;
        			let totalCount = data.page.totalArticleCount;
        			let beginPageNum = data.page.beginPageNum;
        			let endPageNum = data.page.endPageNum;
        			let prev = data.page.prev;
        			let next = data.page.next;
        			
        			//댓글 목록
        			let replyList = data.replyList;

					//댓글 다시 불러오기
					
					let replies = '';
					
					for(let i = 0; i < replyList.length; i++){
						replies += '<div class="boardContent-updonw-margin-div boardContent-each-reply-div boardContent-clearfix">';
						replies += '<div class="boardContent-float-left boardContent-reply-content">';
						replies += '<p><strong>' + replyList[i].userId + '</strong></p>';
						replies += '<input id="reply-content-hidden-' + replyList[i].replyNum + '" type="hidden" value="' + replyList[i].replyContent + '">'
						
						let content = replyList[i].replyContent.replaceAll("\n", "<br/>");
						
				        replies += '<p id="reply-content-num-' + replyList[i].replyNum + '" class="boardContent-updonw-padding-div" style="word-break:break-all;">' + content + '</p>';
				        replies += '<textarea id="reply-mod-num-' + replyList[i].replyNum + '" style="display: none;" value=""></textarea>';
				        replies += '<p><small>' + changeTimeForm(replyList[i].replyDate) + '</small></p>';
				        replies += '</div>';
				        if(replyList[i].userId === '${login.userId}'){
					        replies += '<div class="boardContent-float-right boardContent-reply-btn-div">';
					        replies += '<button id="reply-mod-btn-' + replyList[i].replyNum + '" data-num="' + replyList[i].replyNum + '" class="boardContent-color-white color-darkskyblue boardContent-btn-small boardReply-mod">수정</button>';
					        replies += '<button id="reply-del-btn-' + replyList[i].replyNum + '" data-num="' + replyList[i].replyNum + '" class="boardContent-del boardContent-color-black boardContent-btn-small boardReply-del">삭제</button>';
					        replies += '<button id="reply-mod-do-btn-' + replyList[i].replyNum + '" data-num="' + replyList[i].replyNum + '" class="boardContent-color-white color-darkskyblue boardContent-btn-small reply-mod-do-btn" style="display: none;">수정</button>';
					        replies += '<button id="reply-mod-cancel-btn-' + replyList[i].replyNum + '" data-num="' + replyList[i].replyNum + '" class="boardContent-del boardContent-color-black boardContent-btn-small reply-mod-cancel-btn" style="display: none;">취소</button>';
					        replies += '</div>';
				        }
				        replies += '</div>';
					}
					
					$('#boardContent-reply-area').html(replies);
					
					//페이징 바 불러오기
					let pagingBar = '';
					
					if(prev){
						pagingBar += '<a href="' + (beginPageNum - 1) + '"><li class="boardList-btn-not-check">&lt;</li></a>';
					}
					
					for(let i = beginPageNum; i <= endPageNum; i++){
						if(i == pageNum){
							pagingBar += '<a href="' + i + '"><li class="boardList-btn-check">' + i + '</li></a>';
						} else{
							pagingBar += '<a href="' + i + '"><li class="boardList-btn-not-check">' + i + '</li></a>';
						}
					}
                      
                    if(next){
                    	pagingBar += '<a href="' + (endPageNum + 1) + '"><li class="boardList-btn-not-check">&gt;</li></a>';
                    }
                    
                    $('#boardContent-pageing-bar').html(pagingBar);
        		}
        	); //getJson end
        }; //댓글 호출함수 end
        
      	//날짜 처리 함수
		function changeTimeForm(millis) {
			
			const today = new Date(millis);
			
			let time = today.getFullYear() + '.' + (today.getMonth() + 1) + '.' + today.getDate() + ' ' 
						+ today.getHours() + ':' + today.getMinutes() + ':' + today.getSeconds();
		
			return time;
		}
        
        //* 게시글 상세보기 페이지가 열리면 저절로 댓글 목록 가져오기 *//
        getReplyList(1);
      	
      	//* 댓글 페이징 버튼 *//
      	$('#boardContent-pageing-bar').on('click', 'a', function(event){
      		event.preventDefault();
      		let pageNum = $(this).attr('href');
      		getReplyList(pageNum);
      		location.href = '#reply';
      	});
      	
      	//* 댓글 삭제 *//
      	$('#boardContent-reply-area').on('click', 'button.boardReply-del', function(event){
      		
      		if(confirm('정말로 삭제하시겠습니까?')){
	      		let replyNum = $(this).attr('data-num');      		
	      		let deleteUrl = "<c:url value='/reply/replyDelete' />" + "/" + replyNum;
	      		
	      		$.ajax({
					type: "post",
					url: deleteUrl,
					dataType: "text",
					headers: {
						"Content-Type" : "application/json"
					},
					success: function(data) {
						console.log(data);
						alert('댓글이 삭제되었습니다.');
						//댓글 다시 불러오기
						getReplyList(1);
						location.href = '#reply';
					},
					error: function() {
						alert('댓글 삭제 중 오류가 발생했습니다.');
					}
				}); //ajax end
      		}
      	}); //댓글 삭제 함수end
      	
      	//* 댓글 수정 *//
      	//수정모드로 변경
      	$('#boardContent-reply-area').on('click', 'button.boardReply-mod', function(event){
      			
      		//전환할 태그의 아이디 찾기
      		let modContentId = '#boardContent-reply-area #reply-content-num-' + $(this).attr('data-num');
      		let modInputId = '#boardContent-reply-area #reply-mod-num-' + $(this).attr('data-num');
      		let hiddenContentId = '#boardContent-reply-area #reply-content-hidden-' + $(this).attr('data-num');
      		
      		let modBtnId = '#boardContent-reply-area #reply-mod-btn-' + $(this).attr('data-num');
      		let delBtnId = '#boardContent-reply-area #reply-del-btn-' + $(this).attr('data-num');
      		let modDoBtnId = '#boardContent-reply-area #reply-mod-do-btn-' + $(this).attr('data-num');
      		let modCancelBtnId = '#boardContent-reply-area #reply-mod-cancel-btn-' + $(this).attr('data-num');
      			
      		//컨탠츠창과 입력창 전환
      		$(modInputId).attr('type', 'text');
      		$(modInputId).val($(hiddenContentId).val());
      		$(modInputId).css("display", "inline-block");
      		$(modContentId).css("display", "none");
				
      		//버튼 전환
      		$(modBtnId).css("display", "none");
      		$(delBtnId).css("display", "none");
      		$(modDoBtnId).css("display", "inline-block");
      		$(modCancelBtnId).css("display", "inline-block");
      		
      	});
      	
      	//수정모드 취소
      	$('#boardContent-reply-area').on('click', 'button.reply-mod-cancel-btn', function(event){
      		
      		//전환할 태그 아이디 찾기
      		let modContentId = '#boardContent-reply-area #reply-content-num-' + $(this).attr('data-num');
      		let modInputId = '#boardContent-reply-area #reply-mod-num-' + $(this).attr('data-num');
      		
      		let modBtnId = '#boardContent-reply-area #reply-mod-btn-' + $(this).attr('data-num');
      		let delBtnId = '#boardContent-reply-area #reply-del-btn-' + $(this).attr('data-num');
      		let modDoBtnId = '#boardContent-reply-area #reply-mod-do-btn-' + $(this).attr('data-num');
      		let modCancelBtnId = '#boardContent-reply-area #reply-mod-cancel-btn-' + $(this).attr('data-num');
      		
      		//컨탠츠창과 입력창 전환
      		$(modInputId).css("display", "none");
      		$(modContentId).css("display", "inline-block");
				
      		//버튼 전환
      		$(modBtnId).css("display", "inline-block");
      		$(delBtnId).css("display", "inline-block");
      		$(modDoBtnId).css("display", "none");
      		$(modCancelBtnId).css("display", "none");
      	});
      	
      	//수정 진행
		$('#boardContent-reply-area').on('click', 'button.reply-mod-do-btn', function(event){
      		
			let modInputId = '#boardContent-reply-area #reply-mod-num-' + $(this).attr('data-num');
			const replyContent = $(modInputId).val();
			const replyNum = $(this).attr('data-num');
						
			const modUrl = "<c:url value='/reply/replyModify' />"
			
			if(replyContent === ''){
				alert('댓글을 입력해주세요.');
				return;
			}
			
			if(replyContent.length > 50){
        		alert('댓글은 50자 이내로 작정해주세요. 현재 글자 수: ' + replyContent.length);
        		return;
        	}
			
			$.ajax({
				type: "post",
				url: modUrl,
				data: JSON.stringify(
						{
							"replyNum": replyNum,
							"replyContent": replyContent
						}		
					),
				dataType: "text",
				headers: {
					"Content-Type" : "application/json"
				},
				success: function(data) {
					console.log(data);
					alert('댓글이 수정되었습니다.');
					//댓글 다시 불러오기
					getReplyList(thisPageNum);
				},
				error: function() {
					alert('댓글 수정 중 오류가 발생했습니다.');
				}
			}); //ajax end
      	});
      	
		//* 게시글 추천 *//
		//추천버튼 초기화
		if('${login}' !== ''){
			const recomCheckUrl = "<c:url value='/board/boardLikeCheck' />" + "/" + '${article.boardNum}' + "/" + '${login.userId}';
			
			$.getJSON(
				recomCheckUrl,
				function(data){
					
					if(data === 1){
						
						let buttonText = '<img class="boardContent-heart" src="' + '${pageContext.request.contextPath}' + '/resources/image/heart-full.svg" alt="heart"> ${article.boardRecom}';
						$('#boardContent-heart-btn').html(buttonText);
					}
				}	
			);//postJson end
		}
		
		$('#boardContent-heart-btn').click(function(){
			if('${login}' === ''){
				alert('로그인이 필요한 기능입니다.');
				return;
			}
			
			const recomUrl = "<c:url value='/board/boardLike' />" + "/" + '${article.boardNum}' + "/" + '${login.userId}';
			
			$.getJSON(
				recomUrl,
				function(data){
					//이미지 바꾸기
					if(data.isRecom === 1){
						let buttonText = '<img class="boardContent-heart" src="' + '${pageContext.request.contextPath}' + '/resources/image/heart-full.svg" alt="heart"> ' + data.recomNum;
						$('#boardContent-heart-btn').html(buttonText);				
					}else{
						let buttonText = '<img class="boardContent-heart" src="' + '${pageContext.request.contextPath}' + '/resources/image/heart-empty.svg" alt="heart"> ' + data.recomNum;
						$('#boardContent-heart-btn').html(buttonText);	
					}
				}	
			);//postJson end
		});
    });
</script>
</html>