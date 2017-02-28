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
            <header class="middle_header high_header high_header2">
            	<c:import url="/WEB-INF/view/high/index/header.jsp"/>
            </header>
            <div class="sub_all high_sub high_sub04_02">
                <div class="inner">
                    <aside class="side_menu">
                    	<c:import url="/WEB-INF/view/high/menu/community/aside.jsp"/>
                    </aside>
                    <div class="contents">
                        <section class="contents_tit">
                            <div class="tit">수업후기</div>
                            <div class="txt">Home > 커뮤니티 > 수업후기</div>
                        </section>
                        <section class="section01">
                            <div class="board_tit">
                                <div class="tit">제목</div>
                                <input type="text" id="title" placeholder="제목 입력란">
                            </div>
                            <div class="board_contents_wrap">
                                <textarea placeholder="내용을 입력해주세요" id="content"></textarea>
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
                        
                    </div>
                </div>
                <c:import url="/WEB-INF/view/high/index/quick.jsp"/>
            </div>
            <footer class="middle_footer">
            	<c:import url="/WEB-INF/view/high/index/footer.jsp"/>
            </footer>
        </div>
    </body>
    
    <script>
    	// 등록
    	function submit(){
    		var title = $("#title").val();
    		var content = $("#content").val();
    		if(title.length==0){
    			alert("제목을 입력해주세요.");
    		} else if(content.lenght==0){
    			alert("내용을 입력해주세요.");
    		} else {
    			location.href="/high/community/review/writeSave/"+title+"/"+content;
    		}
    	}
    </script>
    
</html>