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
            <div class="sub_all middle_sub03_01">
                <div class="inner">
                    <aside class="side_menu">
                        <c:import url="/WEB-INF/view/middle/menu/community/aside.jsp"/>
                    </aside>
                    <div class="contents">
                        <section class="contents_tit">
                            <div class="tit">공지사항</div>
                            <div class="txt">HOME > 커뮤니티 > 공지사항</div>
                        </section>
                        <section class="section01">
                            <div class="bbs_wrap">
                                <div class="bbs">
                                    <div class="tit bbs_number">번호</div>
                                    <div class="tit bbs_tit">제목</div>
                                    <div class="tit bbs_name">작성자</div>
                                    <div class="tit bbs_date">작성일</div>
                                </div>
                                
                                <c:choose>
                                	<c:when test="${notice.size() > 0 }">
		                                <c:forEach var="t" items="${noticeNew }">
			                                <div class="bbs bbs_new">
			                                    <div class="txt bbs_number">
			                                        <img src="/img/middle_sub03/03_01/board_new.png">
			                                    </div>
			                                    <div class="txt bbs_tit" onclick="view(${t.auto })">
			                                        <span>${t.title }</span>
			                                    </div>
			                                    <div class="txt bbs_name">${t.nick }</div>
			                                    <div class="txt bbs_date">${t.day }</div>
			                                </div>
		                                </c:forEach>
                                		
                                		<c:forEach var="t" items="${notice }">
	                                		<div class="bbs">
			                                    <div class="txt bbs_number">${t.auto }</div>
			                                    <div class="txt bbs_tit" onclick="view(${t.auto })">
			                                        <span>${t.title }</span>
			                                    </div>
			                                    <div class="txt bbs_name">${t.nick }</div>
			                                    <div class="txt bbs_date">${t.day }</div>
			                                </div>
                                		</c:forEach>
                                	</c:when>
                                	<c:otherwise>
                                		<div class="noContent">등록된 글이 없습니다.</div>
                                	</c:otherwise>
                                </c:choose>
                                
                            </div>
                            <c:if test="${login.admin == '메인관리자' }">
	                            <div class="write_btn_wrap">
									<div class="write_btn" onclick="location.href='/middle/community/notice/write'">
									    <div class="txt">글쓰기</div>
									</div>
	                            </div>
                            </c:if>
                            
                            <div class="page_sel_wrap">
                                <div class="page_arrow_wrap">
                                    <div class="parrow parrow_prev" id="prev" onclick="prev(${start })">
                                        <img src="/img/middle_sub03/03_01/page_arrow_prev.png">
                                    </div>
                                    <div class="parrow parrow_next" id="next" onclick="next(${start })">
                                        <img src="/img/middle_sub03/03_01/page_arrow_next.png">
                                    </div>
                                </div>
                                <div class="page_number_wrap" align="center">
	                            	<c:if test="${start != 0 }">
		                            	<c:forEach var="i" begin="${start }" end="${end }">
		                            		<c:choose>
		                            			<c:when test="${i == selectPage }">
					                                <div class="page_number sel" onclick="page(${i})">
					                                    <span>${i }</span>
					                                </div>
		                            			</c:when>
		                            			<c:otherwise>
		                            				<div class="page_number" onclick="page(${i})">
					                                    <span>${i }</span>
					                                </div>
		                            			</c:otherwise>
		                            		</c:choose>
		                            	</c:forEach>
	                            	</c:if>
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
    </body>
    
    <script>
    	// 페이지 표시
    	$(document).ready(function(){
    		if(${noticePage > 10}){
    			$("#next").css("display", "block");
    		}
    		if(${selectPage > 10}){
    			$("#prev").css("display", "block");
    		}
    		if(${end >= noticePage}){
    			$("#next").css("display", "none");
    		}
    	});
    	// 글쓰기 저장 완료
    	$(document).ready(function(){
   			if(${b == 'y'}){
   				alert("등록되었습니다.");
   			} else if(${b == 'n'}){
   				alert("등록에 실패하였습니다.\n잠시후 다시 시도해주세요.");
   			}
    	});
    	// 페이지 이동
    	function page(num){
    		location.href="/middle/community/notice/page/"+num;
    	}
    	// 이전
    	function prev(num){
    		location.href="/middle/community/notice/page/"+(num-10);
    	}
    	// 다음
    	function next(num){
    		location.href="/middle/community/notice/page/"+(num+10);
    	}
    	// 글 보기
    	function view(num){
    		if(${login == null}){
    			alert("로그인 후 이용가능합니다.");
    			location.href="/${type }";
    		} else {
    			location.href='/middle/community/notice/view/'+num;
    		}
    	}
    </script>
    
</html>