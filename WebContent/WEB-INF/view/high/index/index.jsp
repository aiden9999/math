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
            <header class="high_header">
            	<c:import url="/WEB-INF/view/high/index/header.jsp"/>
            </header>
            <div class="high_main">
                <div class="high_main_gnb">
                    <nav class="gnb_wrap">
                        <div class="gnb">
                            <a href="/high/info/info">
                                <span>학원소개</span>
                            </a>
                        </div>
                        <div class="gnb">
                            <a href="/high/program/program">
                                <span>프로그램</span>
                            </a>
                        </div>
                        <div class="gnb">
                        	<a href="/high/top/top">
                            	<span>최상위반</span>
                            </a>
                        </div>
                        <div class="gnb">
                            <a href="/high/community/notice">
                                <span>커뮤니티</span>
                            </a>
                        </div>
                    </nav>
                    <div class="gnb_cover"></div>
                </div>
                <div class="inner">
                    <section class="main_slider">
                        <div class="main_slide fade_in"></div>
                        <div class="main_slide"></div>
                        <div class="main_slide"></div>
                        <div class="slider_bottom">
                            <div class="bottom_prize">
                                <div class="img">
                                    <img src="img/high_main/main_slide_bottom01.png">
                                </div>
                            </div>
                            <nav class="slide_gnb_wrap">
                                <ul>
                                    <li class="gnb_wrap">
                                        <div class="gnb">
                                            <img src="img/high_main/slide_gnb_icon01.png">
                                        </div>
                                        <div class="gnb_hidden"></div>
                                    </li>
                                    <li class="gnb_wrap">
                                        <div class="gnb">
                                            <img src="img/high_main/slide_gnb_icon02.png">
                                        </div>
                                        <div class="gnb_hidden"></div>
                                    </li>
                                    <li class="gnb_wrap">
                                        <div class="gnb">
                                            <img src="img/high_main/slide_gnb_icon03.png">
                                        </div>
                                        <div class="gnb_hidden"></div>
                                    </li>
                                    <li class="gnb_wrap">
                                        <div class="gnb">
                                            <img src="img/high_main/slide_gnb_icon04.png">
                                        </div>
                                        <div class="gnb_hidden"></div>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </section>
                    <section class="section02">
                        <div class="main_board_wrap">
                            <div class="board_header">
                                <div class="header_tit">
                                    <div class="txt">매쓰클럽 공지사항</div>
                                    <div class="img">
                                        <img src="img/main/new.png">
                                    </div>
                                </div>
                                <div class="board_more">
                                    <span>+</span>
                                </div>
                            </div>
                            <div class="board_txt_wrap">
                                <div class="board_txt">
                                    <div class="dot"></div>
                                    <div class="txt">
                                        <span>11월 12일, 11월 19일 입시 설명회 오전11시~오후1시</span>
                                    </div>
                                </div>
                                <div class="board_txt">
                                    <div class="dot"></div>
                                    <div class="txt">
                                        <span>2016년 겨울방학 특강 시간표</span>
                                    </div>
                                </div>
                                <div class="board_txt">
                                    <div class="dot"></div>
                                    <div class="txt">
                                        <span>2016년 수능 고3 미적분1 + 확률통계  수능 족집게 개념 강의</span>
                                    </div>
                                </div>
                                <div class="board_txt">
                                    <div class="dot"></div>
                                    <div class="txt">
                                        <span>2016년 겨울방학 특강 시간표</span>
                                    </div>
                                </div>
                                <div class="board_txt">
                                    <div class="dot"></div>
                                    <div class="txt">
                                        <span>2016년 수능 고3 미적분1 + 확률통계  수능 족집게 개념 강의</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="main_board_wrap main_board_wrap2">
                            <div class="board_header">
                                <div class="header_tit">
                                    <div class="txt">매쓰클럽 입시정보</div>
                                    <div class="img">
                                        <img src="img/main/new.png">
                                    </div>
                                </div>
                                <div class="board_more">
                                    <span>+</span>
                                </div>
                            </div>
                            <div class="board_txt_wrap">
                                <div class="board_txt">
                                    <div class="dot"></div>
                                    <div class="txt">
                                        <span>11월 12일, 11월 19일 입시 설명회 오전11시~오후1시</span>
                                    </div>
                                </div>
                                <div class="board_txt">
                                    <div class="dot"></div>
                                    <div class="txt">
                                        <span>2016년 겨울방학 특강 시간표</span>
                                    </div>
                                </div>
                                <div class="board_txt">
                                    <div class="dot"></div>
                                    <div class="txt">
                                        <span>2016년 수능 고3 미적분1 + 확률통계  수능 족집게 개념 강의</span>
                                    </div>
                                </div>
                                <div class="board_txt">
                                    <div class="dot"></div>
                                    <div class="txt">
                                        <span>2016년 겨울방학 특강 시간표</span>
                                    </div>
                                </div>
                                <div class="board_txt">
                                    <div class="dot"></div>
                                    <div class="txt">
                                        <span>2016년 수능 고3 미적분1 + 확률통계  수능 족집게 개념 강의</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="section03">
                        <div class="main_banner">
                            <img src="img/high_main/high_banner01.png">
                        </div>
                        <div class="main_banner">
                            <img src="img/high_main/high_banner02.png">
                        </div>
                        <div class="main_banner">
                            <img src="img/high_main/high_banner03.png">
                        </div>
                    </section>
                    <section class="section04">
                        <div class="program_wrap">
                            <div class="program_header">
                                MATHCLUB 수업 프로그램<br><span>12년간 성장한 힘, 그냥 이루어진 것이 아닙니다. MATH CLUB의 특별한 수업을 경험해 보세요.</span>
                            </div>
                            <div class="program_contents">
                                <div class="program">
                                    <div class="img">
                                        <img src="img/high_main/section04_pro01.png">
                                    </div>
                                    <div class="txt">확인이해학습</div>
                                </div>
                                <div class="program">
                                    <div class="img">
                                        <img src="img/high_main/section04_pro02.png">
                                    </div>
                                    <div class="txt">확실한 숙제체크</div>
                                </div>
                                <div class="program">
                                    <div class="img">
                                        <img src="img/high_main/section04_pro03.png">
                                    </div>
                                    <div class="txt">주간 복습</div>
                                </div>
                                <div class="program">
                                    <div class="img">
                                        <img src="img/high_main/section04_pro04.png">
                                    </div>
                                    <div class="txt">자기주도 학습</div>
                                </div>
                                <div class="program">
                                    <div class="img">
                                        <img src="img/high_main/section04_pro05.png">
                                    </div>
                                    <div class="txt">일대일 개별체크</div>
                                </div>
                                <div class="program">
                                    <div class="img">
                                        <img src="img/high_main/section04_pro06.png">
                                    </div>
                                    <div class="txt">개인 파일에 의한 학생관리</div>
                                </div>
                                <div class="program">
                                    <div class="img">
                                        <img src="img/high_main/section04_pro07.png">
                                    </div>
                                    <div class="txt">매시간 테스트</div>
                                </div>
                                <div class="program">
                                    <div class="img">
                                        <img src="img/high_main/section04_pro08.png">
                                    </div>
                                    <div class="txt">수업관리, 오답노트관리</div>
                                </div>
                            </div>
                        </div>
                        <div class="cs_wrap">
                            <div class="cs_item">
                                <img src="img/high_main/cs_call.png">
                            </div>
                            <div class="cs_item">
                                <img src="img/high_main/cs_road.png">
                            </div>
                        </div>
                    </section>
                </div>
                <div class="quick_menu" onclick="location.href='/middle'">
                    <img src="img/high_main/quick_menu.png">
                    <div class="quick_cover"></div>
                    <div class="img">
                        <img src="img/high_main/quick_menu_icon.png">
                    </div>
                </div>
            </div>
            
            <footer class="footer">
            	<c:import url="/WEB-INF/view/high/index/footer.jsp"/>
            </footer>
        </div>
    </body>
</html>