<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    

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
                        <button class="color-darkskyblue boardContent-btn-big">목록</button>
                    </div>
                    <div class="boardContent-float-right">
                        <button class="color-darkskyblue boardContent-btn-big">수정</button>
                        <button class="boardContent-del boardContent-btn-big">삭제</button>
                    </div>
                </div>
                <hr>
                <div class="boardContent-updonw-padding-div boardContent-clearfix">
                    <div id="boardContent-content-title" class="boardContent-float-left">
                        [카테고리] 제목
                    </div>
                    <div class="boardContent-float-right">
                        <!-- 클릭 시 하트 이미지 바꾸고 좋아요 수 비동기 통신으로 가져오기 -->
                        <button class="boardContent-btn-heart"><img class="boardContent-heart" src="image/heart-empty.svg" alt="heart"> 0</button>
                    </div>
                </div>
                <hr>
                <div class="boardContent-updonw-padding-div boardContent-clearfix">
                    <div class="boardContent-float-left">
                        <small>등록일: 2021.09.01</small>
                    </div>
                    <div class="boardContent-float-right">
                        <small>작성자: 작성자</small>
                    </div>
                </div>
                <hr>
                <div class="boardContent-content-sub-div">
                    <!-- 이미지, 동영상 영역 -->
                    <div class="boardContent-carousel-div boardContent-updonw-margin-div boardContent-updonw-padding-div">
                        <div id="boardContent-arrow-left" class="boardContent-arrow color-darkskyblue boardContent-float-left">
                            ◁
                        </div>
                        <div class="boardContent-images-div">
                            <li>
                                <!-- 동영상. data-videourl에 동영상 주소 넣기-->
                                <ul><div class="boardContent-img boardContent-video-img"><img src="image/sample-image2.jpg" alt="sample" data-videourl="image/sample-video.mp4"><div class="boardContent-video-text color-darkskyblue">▶</div></div></ul>
                                <!-- 이미지 -->
                                <ul><div class="boardContent-img boardContent-img-img"><img src="image/sample-image.jpg" alt="sample"></div></ul>
                                <ul><div class="boardContent-img boardContent-img-img"><img src="image/sample-image2.jpg" alt="sample"></div></ul>
                                <ul><div class="boardContent-img boardContent-img-img"><img src="image/sample-image3.jpg" alt="sample"></div></ul>
                                <ul><div class="boardContent-img boardContent-img-img"><img src="image/sample-image2.jpg" alt="sample"></div></ul>
                                <ul><div class="boardContent-img boardContent-img-img"><img src="image/sample-image.jpg" alt="sample"></div></ul>
                            </li>
                        </div>
                        <div id="boardContent-arrow-right" class="boardContent-arrow color-darkskyblue boardContent-float-right">
                            ▷
                        </div>
                    </div>
                    <!-- 컨텐츠 영역 -->
                    <div class="boardContent-content-area-div">
                        <div class="boardContent-content-div">
                            <!-- 여기에 DB에서 가져온 내용 넣기(임시로 로렘입숨) -->
                            이미지를 누르면 크게 볼 수 있습니다.
                            <br><br>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sagittis erat id vestibulum fringilla. Nam ut bibendum
                            augue, eget sodales metus. Aenean vitae interdum purus. Proin faucibus tellus id risus ultricies, sit amet blandit nisi
                            pretium. Maecenas cursus risus massa, nec scelerisque sem pellentesque vitae. Sed faucibus erat mauris, sit amet blandit
                            augue commodo ut. Mauris lacinia nibh eu cursus rutrum. Curabitur sed cursus velit, sed fermentum sapien. In aliquam ex
                            eget ex fermentum convallis. Curabitur porttitor non diam congue pellentesque. Nunc eu lobortis tellus. Vivamus
                            malesuada ac odio eu venenatis. Etiam tellus ipsum, posuere quis congue ac, convallis a nibh. Cras in ligula at dolor
                            eleifend bibendum at vel nibh.
                            <br><br>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sagittis erat id vestibulum fringilla. Nam ut bibendum
                            augue, eget sodales metus. Aenean vitae interdum purus. Proin faucibus tellus id risus ultricies, sit amet blandit nisi
                            pretium. Maecenas cursus risus massa, nec scelerisque sem pellentesque vitae. Sed faucibus erat mauris, sit amet blandit
                            augue commodo ut. Mauris lacinia nibh eu cursus rutrum. Curabitur sed cursus velit, sed fermentum sapien. In aliquam ex
                            eget ex fermentum convallis. Curabitur porttitor non diam congue pellentesque. Nunc eu lobortis tellus. Vivamus
                            malesuada ac odio eu venenatis. Etiam tellus ipsum, posuere quis congue ac, convallis a nibh. Cras in ligula at dolor
                            eleifend bibendum at vel nibh.
                            <br><br>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sagittis erat id vestibulum fringilla. Nam ut bibendum
                            augue, eget sodales metus. Aenean vitae interdum purus. Proin faucibus tellus id risus ultricies, sit amet blandit nisi
                            pretium. Maecenas cursus risus massa, nec scelerisque sem pellentesque vitae. Sed faucibus erat mauris, sit amet blandit
                            augue commodo ut. Mauris lacinia nibh eu cursus rutrum. Curabitur sed cursus velit, sed fermentum sapien. In aliquam ex
                            eget ex fermentum convallis. Curabitur porttitor non diam congue pellentesque. Nunc eu lobortis tellus. Vivamus
                            malesuada ac odio eu venenatis. Etiam tellus ipsum, posuere quis congue ac, convallis a nibh. Cras in ligula at dolor
                            eleifend bibendum at vel nibh.
                        </div>
                        <div class="boardContent-report-btn-div">
                            <button id="boardContent-report-btn" class="boardContent-color-white boardContent-btn-small">신고하기</button>
                        </div>
                    </div>
                    <!-- 댓글영역 -->
                    <div class="boardContent-reply">
                        <div class="boardContent-reply-area-div">
                            <form action="" class="boardContent-updonw-margin-div">
                                <input type="text" placeholder="댓글 입력">
                                <button class="boardContent-reg boardContent-color-white boardContent-btn-small">등록</button>
                            </form>
                            <div class="boardContent-reply-list-div">
                                <!-- 댓글 추가 시 아래 div 반복시켜 출력 -->
                                <div class="boardContent-updonw-margin-div boardContent-each-reply-div boardContent-clearfix">
                                    <div class="boardContent-float-left boardContent-reply-content">
                                        <p><strong>댓글 작성자</strong></p>
                                        <p class="boardContent-updonw-padding-div">댓글 내용~</p>
                                        <p><small>2021.09.01</small></p>
                                    </div>
                                    <div class="boardContent-float-right boardContent-reply-btn-div">
                                        <button class="boardContent-color-white color-darkskyblue boardContent-btn-small">수정</button>
                                        <button class="boardContent-del boardContent-color-black boardContent-btn-small">삭제</button>
                                    </div>
                                </div>
                                <div class="boardContent-updonw-margin-div boardContent-each-reply-div boardContent-clearfix">
                                    <div class="boardContent-float-left boardContent-reply-content">
                                        <p><strong>댓글 작성자</strong></p>
                                        <p class="boardContent-updonw-padding-div">댓글 내용~</p>
                                        <p><small>2021.09.01</small></p>
                                    </div>
                                    <div class="boardContent-float-right boardContent-reply-btn-div">
                                        <button class="boardContent-color-white color-darkskyblue boardContent-btn-small">수정</button>
                                        <button class="boardContent-del boardContent-color-black boardContent-btn-small">삭제</button>
                                    </div>
                                </div>
                                <div class="boardContent-updonw-margin-div boardContent-each-reply-div boardContent-clearfix">
                                    <div class="boardContent-float-left boardContent-reply-content">
                                        <p><strong>댓글 작성자</strong></p>
                                        <p class="boardContent-updonw-padding-div">댓글 내용~</p>
                                        <p><small>2021.09.01</small></p>
                                    </div>
                                    <div class="boardContent-float-right boardContent-reply-btn-div">
                                        <button class="boardContent-color-white color-darkskyblue boardContent-btn-small">수정</button>
                                        <button class="boardContent-del boardContent-color-black boardContent-btn-small">삭제</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- 페이징 바 -->
                        <div class="boardList-paging-div boardContent-each-reply-div">
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
                <video src="" type="video/mp4" autoplay controls></video>
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

        // 이미지바 이동
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

        // 이미지 모달
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
            $img_modal_video.attr("src", $('.boardContent-video-img img').data('videourl'));
            $img_modal.show();
            $img_modal_img.hide();
            $img_modal_video.show();
        });

        $('#boardContent-img-modal-xbtn').click(function(){
            $img_modal.hide();
        });

        // 신고하기 모달
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
    });
</script>
</html>