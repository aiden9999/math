<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html>
    <head>
    	<c:import url="/WEB-INF/view/main/head.jsp"/>
        <script>
            $(document).ready(function(){
                 
            });
        </script>
    </head>
     
    <body>
        <div id="wrapper">
            <header class="middle_header">
            	<c:import url="/WEB-INF/view/middle/index/header.jsp"/>
            </header>
            <div class="sub_all middle_sub03_01_01">
                <div class="inner">
                    <aside class="side_menu">
                    	<c:import url="/WEB-INF/view/middle/menu/community/aside.jsp"/>
                    </aside>
                    <div class="contents">
                        <section class="contents_tit">
                            <div class="tit">입시정보</div>
                            <div class="txt">Home > 커뮤니티 > 입시정보</div>
                        </section>
                        <form action="/middle/community/info/writeSave" enctype="multipart/form-data" method="post" id="form">
                        	<input type="hidden" name="type" value="middle"/>
	                        <section class="section01">
	                            <div class="board_tit">
	                                <div class="tit">제목</div>
	                                <input type="text" id="title" name="title" placeholder="제목 입력란">
	                            </div>
	                            <div class="board_add_wrap">
	                                <div class="add">파일첨부</div>
	                                <label for="addFile">파 일 선 택</label>
	                                <input class="add_upload_name" disabled="disabled">
	                                <input type="file" name="file" id="addFile" class="board_add_hidden">
	                            </div>
	                            <div class="board_contents_wrap">
	                                <textarea placeholder="내용을 입력해주세요" name="content" id="content"></textarea>
	                            </div>
	                            <div class="btn_wrap m1">
	                                <div class="btn left" onclick="history.back()">
	                                    <div class="txt">취소</div>
	                                </div>
	                                <div class="btn right" onclick="submit()">
	                                    <div class="txt">등록</div>
	                                </div>
	                            </div>
	                        </section>
                        </form>
                    </div>
                </div>
                <c:import url="/WEB-INF/view/middle/index/quick.jsp"/>
            </div>
            <footer class="middle_footer">
            	<c:import url="/WEB-INF/view/main/footer.jsp"/>
            </footer>
        </div>
    </body>
    
    <script>
    	// 저장
    	function submit(){
   			var title = $("#title").val();
   			var content = $("#content").val();
   			if(title.length==0){
   				alert('제목을 입력해주세요.');
   			} else if(content.length==0){
   				alert('내용을 입력해주세요.');
   			} else {
   				$("#form").submit();
   			}
    	}
    </script>
    
</html>