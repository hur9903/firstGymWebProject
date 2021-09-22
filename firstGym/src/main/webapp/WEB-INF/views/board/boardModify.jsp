<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <%@include file="../include/header.jsp" %>

    <div class="boardModify-main-div">
        <div class="boardModify-sub-div">
            <div id="boardModify-title">
                게시글 등록
            </div>
            <form action="<c:url value='/board/boardUpdate'/>" method="post" enctype="multipart/form-data">
                <hr>
                <div class="boardModify-form-div">               
                    <select name="boardCategory" id="">
                        <option value="none">-- 운동 카테고리 --</option>
                        <option value="oxy">유산소 운동</option>
                        <option value="nonoxy">근력 운동</option>
                        <option value="yoga">요가, 스트레칭</option>
                    </select><br>
                    <input type="text" name="boardTitle" placeholder="제목 입력">
                    <div class="boardModify-form-content-div">
                        <textarea id="boardModify-summernote" name="boardContent"></textarea>
                    </div>
                    <div class="boardModify-fileupload-div">
                        <!-- 다수 이미지 업로드 가능. -->
                        <div class="boardModify-imageupload">
                            <label for="boardModify-image-upload">이미지 등록</label>
                            <input type="file" id="boardModify-image-upload" name="images" accept=".png, .jpg, .jpeg" multiple>
                            <input class="boardModify-uploaded-file-name" placeholder="이미지(png,jpg)" disabled="disabled">  
                        </div>
                        <!-- 동영상 1개만 업로드 가능 -->
                        <div class="boardModify-videoupload">
                            <label for="boardModify-video-upload">동영상 등록</label>
                            <input type="file" id="boardModify-video-upload" name="video" accept=".mp4">
                            <input class="boardModify-uploaded-file-name" placeholder="동영상(mp4)" disabled="disabled">        
                        </div>
                    </div>
                </div>
                <hr>
                <div class="boardModify-button-div">
                    <button id="list-btn" type="button" class="boardModify-list">목록</button>
                    <button type="submit" class="boardModify-reg">등록</button>
                </div>
            </form>
        </div>
    </div>
    <%@include file="../include/footer.jsp" %>
<script>
    $(document).ready(function() {

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
        	location.href = '<c:url value="/board/boardListPage" />';
        });
    });
</script>
</html>