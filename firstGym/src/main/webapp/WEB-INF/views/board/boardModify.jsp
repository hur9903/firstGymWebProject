<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <%@include file="../include/header.jsp" %>

    <div class="boardModify-main-div">
        <div class="boardModify-sub-div">
        	<input id="modify-check" type="hidden" value="${msg}">
            <div id="boardModify-title">
                게시글 등록
            </div>
            <form id="article-form" action="<c:url value='/board/boardUpdate'/>" method="post" enctype="multipart/form-data">
	        	<c:if test="${msg == 'boardModify'}">
	        		<input name="boardNum" type="hidden" value="${article.boardNum}">
	        		<input name="userId" type="hidden" value="${article.userId}">
	        	</c:if>
	        		<input type="hidden" name="category" value="${page.category}">
	            	<input type="hidden" name="condition" value="${page.condition}">
	            	<input type="hidden" name="keyword" value="${page.keyword}">
	            	<input type="hidden" name="pageNum" value="${page.pageNum}">
                <hr>
                <div class="boardModify-form-div">               
                    <select name="boardCategory" id="">
                    	<c:if test="${page.category != 'info'}">
                        <option value="none" <c:if test="${msg == 'boardModify'}">${article.boardCategory == 'none' ? 'selected' : ''}</c:if>>-- 운동 카테고리 --</option>
                        <option value="oxy" <c:if test="${msg == 'boardModify'}">${article.boardCategory == 'oxy' ? 'selected' : ''}</c:if>>유산소 운동</option>
                        <option value="nonoxy" <c:if test="${msg == 'boardModify'}">${article.boardCategory == 'nonoxy' ? 'selected' : ''}</c:if>>근력 운동</option>
                        <option value="yoga" <c:if test="${msg == 'boardModify'}">${article.boardCategory == 'yoga' ? 'selected' : ''}</c:if>>요가, 스트레칭</option>
                    	</c:if>
                        <option value="info">공지사항</option>
                    	<c:if test="${page.category == 'info'}">
                    	
                    	</c:if>
                    </select><br>
                    <input type="text" name="boardTitle" id="board-title" placeholder="제목 입력" value="<c:if test="${msg == 'boardModify'}">${article.boardTitle}</c:if>">
                    <div class="boardModify-form-content-div">
                        <textarea id="boardModify-summernote" name="boardContent">
                        	<c:if test="${msg == 'boardModify'}">${article.boardContent}</c:if>
                        </textarea>
                    </div>
                    <div class="boardModify-fileupload-div">
                    	<div id="image-del-check">
                    		<input type="checkbox" name="imageDelCheck" value="true"> 기존 이미지 삭제
                    	</div>
                        <!-- 다수 이미지 업로드 가능. -->
                        <div class="boardModify-imageupload">
                            <label id="board-image-label" for="boardModify-image-upload">이미지 등록</label>
                            <input type="file" id="boardModify-image-upload" name="images" accept=".png, .jpg, .jpeg" multiple>
                            <input class="boardModify-uploaded-file-name" placeholder="이미지(png,jpg)" disabled="disabled">  
                        </div>
                        <!-- 동영상 1개만 업로드 가능 -->
                        <div class="boardModify-videoupload">
                            <label id="board-video-label" for="boardModify-video-upload">동영상 등록</label>
                            <input type="file" id="boardModify-video-upload" name="video" accept=".mp4">
                            <input class="boardModify-uploaded-file-name" placeholder="동영상(mp4)" disabled="disabled">        
                        </div>
                    </div>
                </div>
                <hr>
                <div class="boardModify-button-div">
                    <button id="list-btn" type="button" class="boardModify-list">목록</button>
                    <button id="submit-btn" type="button" class="boardModify-reg">등록</button>
                </div>
            </form>
        </div>
    </div>
    <%@include file="../include/footer.jsp" %>
<script>
    $(document).ready(function() {

    	$('#image-del-check').hide();
    	
    	//수정요청시 수정페이지로.
    	if($('#modify-check').val() === 'boardModify'){
    		$('#boardModify-title').text('게시글 수정');
    		$('#article-form').attr('action', '<c:url value="/board/boardModify"/>');
    		$('#submit-btn').text('수정');
    		$('#board-image-label').text('이미지 추가 등록');
    		$('#board-video-label').text('동영상 재등록');
    		$('#image-del-check').show();
    	}
    	
        //summernote start
        $('#boardModify-summernote').summernote({
            lang: 'ko-KR',
            toolbar: [
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['font', ['strikethrough', 'superscript', 'subscript']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']]
            ],
            focus: true,
            disableResizeEditor: true,
            placeholder: '게시글을 입력하세요.',
            height: 600
        }); //summernote end

        //이미지 등록시 옆에 업로드한 이미지 이름 띄우기
        $('.boardModify-imageupload #boardModify-image-upload').change(function(){
            
            let filename = '';
            if(window.FileReader){ // modern browser 
                if($(this)[0].files[0] === undefined){
                    filename = '';
                }
                else{
                    let flag = false;
                    for(let i of $(this)[0].files){
                        if(flag){
                            filename += ', ';
                        }
                        else{
                            flag = true;
                        }
                        filename += i.name;
                    }
                    //filename = $(this)[0].files[0].name; 
                }
            }
             
             // 파일명 화면에 표시 
             $(this).siblings('.boardModify-uploaded-file-name').val(filename);
        }); //이미지 이름 띄우기 end

        //동영상 등록시 옆에 업로드한 동영상 이름 띄우기
        $('.boardModify-videoupload #boardModify-video-upload').change(function(){
            
            let filename = '';
            if(window.FileReader){ // modern browser 
                if($(this)[0].files[0] === undefined){
                    filename = '';
                }
                else{
                    filename = $(this)[0].files[0].name; 
                }
            }
             
             // 파일명 화면에 표시 
             $(this).siblings('.boardModify-uploaded-file-name').val(filename);
        }); //이미지 이름 띄우기 end
		
        //글 목록으로 이동 버튼
        $('#list-btn').click(function(){
        	location.href = '<c:url value="/board/boardListPage" />?category=${page.category}&condition=${page.condition}&keyword=${page.keyword}&pageNum=${page.pageNum}';
        });
        
        //글 등록버튼
        $('#submit-btn').click(function(){
        	if($('#board-title').val() === ''){
        		alert('제목을 입력해주세요.');
        	} else{
        		$('#article-form').submit();
        	}
        });
        
    });
</script>
</html>