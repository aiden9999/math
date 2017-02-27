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
            <div class="sub_all high_sub high_sub04_03">
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
                            <div class="board_tit">
                                <div class="tit">제목</div>
                                <div class="txt">안녕하세요 입시정보 입니다...</div>
                            </div>
                            <div class="board_contents_wrap">
                                <div class="board_txt">
                                    입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.입시정보 입니다. 입시정보 입니다.
                                </div>
                            </div>
                            <div class="board_modify_wrap">
                                <div class="modify_txt">
                                    <a href="middle_sub03_03_01.html">
                                        <span>글 수정</span>
                                    </a>
                                </div>
                                <div class="modify_txt">
                                    <span>글 삭제</span>
                                </div>
                            </div>
                        </section>
                        <section class="section02">
                            <div class="diff_category_wrap">
                                <div class="diff_category_tit">
                                    <span>“입시정보”</span> 카테고리의 다른 글
                                </div>
                                <div class="diff_category_box">
                                    <ul>
                                        <li class="diff_category">
                                            <div class="txt">
                                                <span>· 2016년 11월 입시설명회</span>
                                            </div>
                                            <div class="date">
                                                <span>2016.10.25</span>
                                            </div>
                                        </li>
                                        <li class="diff_category">
                                            <div class="txt">
                                                <span>· 2016년 11월 입시설명회</span>
                                            </div>
                                            <div class="date">
                                                <span>2016.10.25</span>
                                            </div>
                                        </li>
                                        <li class="diff_category sel">
                                            <div class="txt">
                                                <span>· 2016년 11월 입시설명회</span>
                                            </div>
                                            <div class="date">
                                                <span>2016.10.25</span>
                                            </div>
                                        </li>
                                        <li class="diff_category">
                                            <div class="txt">
                                                <span>· 2016년 11월 입시설명회</span>
                                            </div>
                                            <div class="date">
                                                <span>2016.10.25</span>
                                            </div>
                                        </li>
                                        <li class="diff_category">
                                            <div class="txt">
                                                <span>· 2016년 11월 입시설명회</span>
                                            </div>
                                            <div class="date">
                                                <span>2016.10.25</span>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="page_change_wrapper">
                                <div class="page_change_wrap">
                                    <div class="page_change page_change_prev">
                                        <span>이전</span>
                                    </div>
                                    <div class="page_change page_change_next">
                                        <span>다음</span>
                                    </div>
                                </div>
                                <div class="change_arrow_wrap">
                                    <div class="change_arrow change_arrow_prev" id="prev" onclick="prev(${start })">
                                        <img src="/img/middle_sub03/03_03/arrow_prev.png">
                                    </div>
                                    <div class="change_arrow change_arrow_next" id="next" onclick="next(${start })">
                                        <img src="/img/middle_sub03/03_03/arrow_next.png">
                                    </div>
                                </div>
                            </div>
                            <c:if test="${login.admin == '메인관리자' }">
	                            <div class="write_btn_wrap">
	                                <a href="/middle/community/info/write">
	                                    <div class="write_btn">
	                                        <div class="txt">글쓰기</div>
	                                    </div>
	                                </a>
	                            </div>
                            </c:if>
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
</html>