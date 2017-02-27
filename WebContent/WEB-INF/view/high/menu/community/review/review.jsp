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
                            <c:choose>
	                    		<c:when test="${review.size() > 0 }">
	                    			<c:forEach var="t" items="${review }">
				                        <div class="community_review_wrap">
				                            <div class="inner">
				                                <div class="review_tit_wrap">
				                                    <div class="review_tit">
				                                        <div class="tit">${t.title }</div>
				                                    </div>
				                                    <div class="review_right">
				                                        <div class="txt">${t.nick }</div>
				                                        <div class="txt">${t.day }</div>
				                                    </div>
				                                </div>
				                                <div class="review_txt">
				                                	<c:choose>
				                                		<c:when test="${t.content.length() > 100 }">
						                                    <div class="txt">
						                                        ${t.content.substring(0, 100) }
						                                    </div>
				                                		</c:when>
				                                		<c:otherwise>
						                                    <div class="txt">
						                                        ${t.content.substring }
						                                    </div>
				                                		</c:otherwise>
				                                	</c:choose>
				                                    <div class="review_more">
				                                        +더보기
				                                    </div>
				                                </div>
				                            </div>
				                        </div>
	                    			</c:forEach>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<div class="noContent">등록된 글이 없습니다.</div>
	                    		</c:otherwise>
	                    	</c:choose>
                            <c:if test="${login != null }">
		                        <div class="write_btn_wrap">
		                            <a href="middle_sub03_02_01.html">
		                                <div class="write_btn">
		                                    <div class="txt">글쓰기</div>
		                                </div>
		                            </a>
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
                            <div class="search_wrap">
	                            <select id="search">
	                                <option value="title">제목</option>
	                                <option value="content">내용</option>
	                                <option value="nick">작성자</option>
	                            </select>
	                            <input type="text" id="search">
	                            <div class="search_btn" onclick="search()">
	                                <img src="/img/middle_sub03/03_02/search_icon.png">
	                            </div>
	                        </div>
                        </section>
                    </div>
                </div>
                <a href="middle_main.html">
                    <div class="quick_menu">
                        <img src="/img/high_main/quick_menu.png">
                        <div class="quick_cover"></div>
                        <div class="img">
                            <img src="/img/high_main/quick_menu_icon.png">
                        </div>
                    </div>
                </a>
            </div>
            <footer class="middle_footer">
            	<c:import url="/WEB-INF/view/high/index/footer.jsp"/>
            </footer>
        </div>
    </body>
    
    <script>
    	// 페이지 표시
    	$(document).ready(function(){
    		if(${reviewPage > 10}){
    			$("#next").css("display", "block");
    		}
    		if(${selectPage > 10}){
    			$("#prev").css("display", "block");
    		}
    		if(${end >= reviewPage}){
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
    		location.href="/informat/page/"+num;
    	}
    	// 이전
    	function prev(num){
    		location.href="/informat/page/"+(num-10);
    	}
    	// 다음
    	function next(num){
    		location.href="/informat/page/"+(num+10);
    	}
    	// 글 보기
    	function view(num){
    		if(${login == null}){
    			alert("로그인 후 이용가능합니다.");
    			location.href="/login";
    		} else {
    			location.href='/informat/view/'+num;
    		}
    	}
    </script>
    
</html>