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
            	<c:import url="/WEB-INF/view/high/index/header2.jsp"/>
            </header>
            <div class="sub_all high_sub high_sub04_01">
                <div class="inner">
                    <aside class="side_menu">
                    	<c:import url="/WEB-INF/view/high/menu/community/aside.jsp"/>
                    </aside>
                    <div class="contents">
                        <section class="contents_tit">
                            <div class="tit">입시정보</div>
                            <div class="txt">HOME > 커뮤니티 > 입시정보</div>
                        </section>
                        <section class="section01">
                        	<c:choose>
                        		<c:when test="${view.size() > 0 }">
		                            <div class="board_tit">
		                                <div class="tit">제목</div>
		                                <div class="txt" id="titleDiv">${view.title }</div>
		                                <input type="text" id="title" value="${view.title }"/>
		                            </div>
		                            <div class="board_contents_wrap">
		                                <div class="board_txt" id="contentDiv">${view.content }</div>
		                                <textarea id="content">${view.content }</textarea>
		                            </div>
		                            <c:if test="${login.admin == '메인관리자' }">
			                            <div class="board_modify_wrap" id="modify">
			                                <div class="modify_txt" onclick="modify($(view.auto ))">
			                                    <span>글 수정</span>
			                                </div>
			                                <div class="modify_txt" onclick="remove(${view.auto })">
			                                    <span>글 삭제</span>
			                                </div>
			                            </div>
			                            <div class="board_modify_wrap" id="save">
			                            	<div class="modify_txt" onclick="cancel($(view.auto ))">
			                                    <span>취소</span>
			                                </div>
			                                <div class="modify_txt" onclick="save(${view.auto })">
			                                    <span>저장</span>
			                                </div>
			                            </div>
		                            </c:if>
                        		</c:when>
                        		<c:otherwise>
                        			<div class="noContent">등록된 글이 없습니다.</div>
                        		</c:otherwise>
                        	</c:choose>
                        </section>
                        <section class="section02" id="list">
                        	<c:if test="${view.size() > 0 }">
	                            <div class="diff_category_wrap">
	                                <div class="diff_category_tit">
	                                    <span>“입시정보”</span> 카테고리의 다른 글
	                                </div>
	                                <div class="diff_category_box">
	                                    <ul>
	                                    	<c:forEach var="t" begin="0" end="${list.size()>4 ? 4 : list.size()-1 }">
	                                    		<c:choose>
	                                    			<c:when test="${list.get(t).auto == view.auto }">
				                                        <li class="diff_category sel">
	                                    			</c:when>
	                                    			<c:otherwise>
				                                        <li class="diff_category">
	                                    			</c:otherwise>
	                                    		</c:choose>
		                                            <div class="txt" onclick="view(${list.get(t).auto })">
		                                                <span>${list.get(t).title }</span>
		                                            </div>
		                                            <div class="date">
		                                                <span>${list.get(t).day }</span>
		                                            </div>
		                                        </li>
	                                    	</c:forEach>
	                                    </ul>
	                                </div>
	                            </div>
	                            <div class="page_change_wrapper">
	                                <div class="page_change_wrap">
	                                    <div class="page_change page_change_prev" id="prevTxt" onclick="prev()">
	                                        <span>이전</span>
	                                    </div>
	                                    <div class="page_change page_change_next" id="nextTxt" onclick="next()">
	                                        <span>다음</span>
	                                    </div>
	                                </div>
	                                <div class="change_arrow_wrap">
	                                    <div class="change_arrow change_arrow_prev" id="prev" onclick="prev()">
	                                        <img src="/img/middle_sub03/03_03/arrow_prev.png">
	                                    </div>
	                                    <div class="change_arrow change_arrow_next" id="next" onclick="next()">
	                                        <img src="/img/middle_sub03/03_03/arrow_next.png">
	                                    </div>
	                                </div>
	                            </div>
                        	</c:if>
                            <c:if test="${login.admin == '메인관리자' }">
	                            <div class="write_btn_wrap">
                                    <div class="write_btn" onclick="writeInfo()">
                                        <div class="txt">글쓰기</div>
                                    </div>
	                            </div>
                            </c:if>
                        </section>
                    </div>
                </div>
                <c:import url="/WEB-INF/view/high/index/quick.jsp"/>
            </div>
            <footer class="middle_footer">
            	<c:import url="/WEB-INF/view/high/index/footer.jsp"/>
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
    	// 페이지 표시
//     	$(document).ready(function(){
//     		$("#prev").css("visibility", "hidden");
//     		$("#prevTxt").css("visibility", "hidden");
//     		if(${count > 5}){
//     			$("#next").css("display", "inline-block");
//     			$("#nextTxt").css("display", "inline-block");
//     		}
//     	});
    	$(document).ready(function(){
			var sep = ${sep };
			if(${count > 5}){
				if("${list.get(list.size()-1).auto }" == sep[sep.length-1]){
					$("#next").css("visibility", "hidden");
					$("#nextTxt").css("visibility", "hidden");
					$("#prevTxt").css("border-right", "0px");
				} else {
					$("#next").css("visibility", "visible");
					$("#nextTxt").css("visibility", "visible");
					$("#prevTxt").css("border-right", "1px solid #066ab4");
				}
			} else {
				$("#next").css("visibility", "hidden");
				$("#nextTxt").css("visibility", "hidden");
				$("#prevTxt").css("border-right", "0px");
			}
			var a = 0;
			for(var i=0; i<sep.length; i++){
				if("${view.auto }" == sep[i]){
					a = i;
				}
			}
			if(a>2){
				$("#prev").css("visibility", "visible");
				$("#prevTxt").css("visibility", "visible");
			} else {
				$("#prev").css("visibility", "hidden");
				$("#prevTxt").css("visibility", "hidden");
			}
			$("#title").css("display", "none");
			$("#content").css("display", "none");
			$("#save").css("display", "none");
		});
    	// 글쓰기
    	function writeInfo(){
    		location.href="/high/community/info/write";
    	}
    	// 글쓰기 저장 완료
    	$(document).ready(function(){
   			if(${b == 'y'}){
   				alert("등록되었습니다.");
   			} else if(${b == 'n'}){
   				alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
   			}
    	});
    	// 이전
    	function prev(){
    		var num = "${list.get(2).auto }";
    		var sep = ${sep};
    		var auto = 0;
    		for(var i=0; i<sep.length; i++){
    			if(num == sep[i]){
    				if(i==0){
    					auto = sep[i];
    				} else if(i==1){
    					auto = sep[i-1];
    				} else if(i==2){
    					auto = sep[i-2];
    				} else if(i==3){
    					auto = sep[i-3];
    				} else if(i==4){
    					auto = sep[i-4];
    				} else {
    					auto = sep[i-5];
    				}
    			}
    		}
    		$.ajax({
    			type : "post",
    			url : "/high/community/info/prevNext/"+auto,
    			async : false,
    			success : function(txt){
    				$("#list").html(txt);
    			}
    		});
    	}
    	// 다음
    	function next(){
    		var num = "${list.get(2).auto }";
    		var sep = ${sep};
    		var auto = 0;
    		for(var i=0; i<sep.length; i++){
    			if(num == sep[i]){
    				if(i==sep.length-1){
    					auto = sep[i];
    				} else if(i==sep.length-2){
    					auto = sep[i+1];
    				} else if(i==sep.length-3){
    					auto = sep[i+2];
    				} else if(i==sep.length-4){
    					auto = sep[i+3];
    				} else if(i==sep.length-5){
    					auto = sep[i+4];
    				} else {
    					auto = sep[i+5];
    				}
    			}
    		}
    		$.ajax({
    			type : "post",
    			url : "/high/community/info/prevNext/"+auto,
    			async : false,
    			success : function(txt){
    				$("#list").html(txt);
    			}
    		});
    	}
    	// 글 보기
    	function view(num){
    		if(${login == null}){
    			alert("로그인 후 이용가능합니다.");
    			location.href="/high/login";
    		} else {
    			location.href='/high/community/info/view/'+num;
    		}
    	}
    	// 수정
    	var title = $("#title").val();
    	var content = $("#content").val();
    	function modify(){
    		$("#titleDiv").css("display", "none");
    		$("#contentDiv").css("display", "none");
    		$("#title").css("display", "inline-block");
    		$("#content").css("display", "inline-block");
    		$("#save").css("display", "block");
    		$("#modify").css("display", "none");
    	}
    	// 삭제
    	function remove(){
    		$("#removeDiv").show();
    		$("#removeDiv1").show();
    	}
    	// 취소
    	function cancel(){
    		$("#title").val(title);
    		$("#content").val(content);
    		$("#titleDiv").css("display", "inline-block");
    		$("#contentDiv").css("display", "inline-block");
    		$("#title").css("display", "none");
    		$("#content").css("display", "none");
    		$("#modify").css("display", "block");
    		$("#save").css("display", "none");
    	}
    	// 저장
    	function save(){
    		title = $("#title").val();
    		content = $("#content").val();
    		$.ajax({
    			type : "post",
    			url : "/high/community/info/modify/${view.auto}/"+title+"/"+content,
    			async : false,
    			success : function(txt){
    				if(txt){
    					alert("수정되었습니다.");
    					location.href="/high/community/info";
    				} else {
    					alert("수정에 실패하였습니다.\n잠시후 다시 시도해주세요.");
    				}
    			}
    		});
    	}
    	// 삭제완료
    	function removeYes(num){
    		$.ajax({
    			type : "post",
    			url : "/high/community/info/remove/"+num,
    			async : false,
    			success : function(txt){
    				if(txt){
    					alert("삭제되었습니다.");
    					location.href="/high/community/info";
    				} else {
    					alert("삭제에 실패하였습니다.\n잠시후 다시 시도해주세요.");
    				}
    			}
    		});
    	}
    	// 파일다운
    	function down(num){
    		location.href="/high/community/info/down/"+num;
    	}
    </script>
    
</html>