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
            <div class="sub_all middle_sub03_01_02">
                <div class="inner">
                    <aside class="side_menu">
                    	<c:import url="/WEB-INF/view/middle/menu/community/aside.jsp"/>
                    </aside>
                    <div class="contents">
                        <section class="contents_tit">
                            <div class="tit">수업후기</div>
                            <div class="txt">HOME > 커뮤니티 > 수업후기</div>
                        </section>
                        <section class="section01">
                            <div class="board_tit">
                                <div class="tit">제목</div>
                                <div class="txt" id="titleDiv">${view.title }</div>
                                <input type="text" id="title" value="${view.title }"/>
                            </div>
                            <div class="board_contents_wrap">
                                <div class="board_txt" id="contentDiv">${view.content }</div>
                                <textarea id="content">${view.content }</textarea>
                            </div>
                            <div class="board_info_wrap">
                            	<c:if test="${view.file != null }">
		                            <div class="board_down_wrap" onclick="down(${view.auto })">
	                                    <div class="img">
	                                        <img src="/img/middle_sub03/03_02/down_icon.png">
	                                    </div>
	                                    <div class="txt">첨부파일<span> (${view.filename })</span></div>
	                                </div>
	                        	</c:if>
                                <div class="board_info_txt">
                                    <div class="txt">${view.day }</div>
                                    <div class="txt">조회(${view.count })</div>
                                </div>
                            </div>
                            <div class="board_modify_wrap">
                            	<c:if test="${login.id == view.id }">
		                            <div class="modify_txt" onclick="modify()" id="modify">
		                                <span>글 수정</span>
		                            </div>
		                            <div class="modify_txt" onclick="cancel()" id="cancel">
		                                <span>취소</span>
		                            </div>
		                            <div class="modify_txt" onclick="remove()" id="remove">
		                                <span>글 삭제</span>
		                            </div>
		                            <div class="modify_txt" onclick="save()" id="save">
		                                <span>저장</span>
		                            </div>
	                        	</c:if>
	                            <div class="modify_txt" onclick="location.href='/middle/community/review'">
	                                <span>목록으로</span>
	                            </div>
                            </div>
                        </section>
                    </div>
                </div>
                <c:import url="/WEB-INF/view/middle/index/quick.jsp"/>
            </div>
            <footer class="middle_footer">
            	<c:import url="/WEB-INF/view/middle/index/footer.jsp"/>
            </footer>
        </div>
        <!-- 삭제 view -->
        <div class="delete_cover" id="removeDiv"></div>
        <div class="delete_confirm" id="removeDiv1">
            <div class="delete_confirm_header">
                <div class="logo">
                    <img src="/img/logo.jpg">
                </div>
            </div>
            <div class="delete_confirm_contents">
                <div class="delete_txt">삭제 하시겠습니까?</div>
                <div class="btn_wrap m1">
                    <div class="btn left" onclick="$('#removeDiv').hide(), $('#removeDiv1').hide()">
                        <div class="txt">아니오</div>
                    </div>
                    <div class="btn right" onclick="removeYes(${view.auto })">
                        <div class="txt">네</div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    
    <script>
    	$(document).ready(function(){
    		$("#cancel").css("display", "none");
    		$("#save").css("display", "none");
    		$("#title").css("display", "none");
    		$("#content").css("display", "none");
    		$("#removeDiv").css("display", "none");
    		$("#removeDiv1").css("display", "none");
    	})
    	// 글 수정
    	var title = $("#title").val();
    	var content = $("#content").val();
    	function modify(){
    		$("#titleDiv").css("display", "none");
    		$("#contentDiv").css("display", "none");
    		$("#title").css("display", "inline-block");
    		$("#content").css("display", "block");
    		$("#modify").css("display", "none");
    		$("#cancel").css("display", "inline-block");
    		$("#remove").css("display", "none");
    		$("#save").css("display", "inline-block");
    	}
    	// 글 삭제
    	function remove(){
    		$("#removeDiv").show();
    		$("#removeDiv1").show();
    	}
    	// 취소
    	function cancel(){
    		$("#title").val(title);
    		$("#content").val(content);
    		$("#modify").css("display", "inline-block");
    		$("#cancel").css("display", "none");
    		$("#remove").css("display", "inline-block");
    		$("#save").css("display", "none");
    		$("#title").css("display", "none");
    		$("#content").css("display", "none");
    		$("#titleDiv").css("display", "inline-block");
    		$("#contentDiv").css("display", "block");
    	}
    	// 저장
    	function save(){
    		title = $("#title").val();
    		content = $("#content").val();
    		$.ajax({
    			type : "post",
    			url : "/middle/community/review/modify/${view.auto}/"+title+"/"+content,
    			async : false,
    			success : function(txt){
    				if(txt){
    					alert("수정되었습니다.");
    					location.href="/middle/community/review";
    				} else {
    					alert("수정에 실패하였습니다.\n잠시후 다시 시도해주세요.");
    				}
    			}
    		});
    	}
    	// 삭제 완료
    	function removeYes(num){
    		$.ajax({
    			type : "post",
    			url : "/middle/community/review/remove/"+num,
    			async : false,
    			success : function(txt){
    				if(txt){
    					alert("삭제되었습니다.");
    					location.href="/middle/community/review";
    				} else {
    					alert("삭제에 실패하였습니다.\n잠시후 다시 시도해주세요.");
    				}
    			}
    		});
    	}
    	// 파일다운
    	function down(num){
    		location.href="/middle/community/notice/down/"+num;
    	}
    </script>
    
</html>