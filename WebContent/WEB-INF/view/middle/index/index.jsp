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
            <div class="middle_main">
                <div class="inner">
                    <section class="section01">
                        <div class="prize_wrap">
                            <img src="/img/main/prize.png">
                        </div>
                        <div class="main_slider">
                            <div class="main_slide fade_in"></div>
                            <div class="main_slide"></div>
                            <div class="main_slide"></div>
                            <div class="main_slideCont_wrap">
                                <div class="main_slideCont main_slideCont_sel"></div>
                                <div class="main_slideCont"></div>
                                <div class="main_slideCont"></div>
                            </div>
                        </div>
                        <c:choose>
                        	<c:when test="${login == null }">
		                        <div class="login_wrap">
		                            <div class="inner">
		                                <div class="logo">
		                                    <img src="/img/logo.jpg";>
		                                </div>
		                                <div class="login_box">
		                                    <div class="id_box">
		                                        <c:choose>
			                                		<c:when test="${save != null }">
					                                    <input type="text" id="id" placeholder="아이디" value="${save }">
			                                		</c:when>
			                                		<c:otherwise>
					                                    <input type="text" id="id" placeholder="아이디">
			                                		</c:otherwise>
			                                	</c:choose>
			                                    <input type="password" id="pw" placeholder="비밀번호">
		                                    </div>
		                                    <div class="submit" onclick="login()">
			                                	<input type="button" value="로그인">
			                                </div>
			                                <div class="loginFail" id="loginFail">아이디 / 비밀번호를 확인해주세요.</div>
		                                </div>
		                                <div class="txt_wrap">
<!-- 			                                <div class="txt" onclick="location.href='/search'">아이디/비밀번호찾기</div> -->
			                                <div class="txt" onclick="javascript: alert('준비중입니다.')">아이디/비밀번호찾기</div>
<!-- 			                                <div class="txt" onclick="location.href='/join'">회원가입</div> -->
			                                <div class="txt" onclick="javascript: alert('준비중입니다.')">회원가입</div>
			                            </div>
		                                <div class="id_check_box">
		                                    <input type="checkbox" name="pre" value="auto" id="autoLogin">
		                                    <div class="txt"><label for="autoLogin">자동 로그인</label></div>
		                                    <c:choose>
		                                    	<c:when test="${save != null }">
				                                    <input type="checkbox" name="pre" value="save" id="saveId" checked="checked">
				                                    <div class="txt"><label for="saveId">아이디 저장</label></div>
		                                    	</c:when>
		                                    	<c:otherwise>
				                                    <input type="checkbox" name="pre" value="save" id="saveId">
				                                    <div class="txt"><label for="saveId">아이디 저장</label></div>
		                                    	</c:otherwise>
		                                    </c:choose>
		                                </div>
		                            </div>
		                        </div>
                        	</c:when>
                        	<c:otherwise>
		                        <div class="login_on_wrap">
		                            <div class="inner">
		                                <div class="greet_wrap">
		                                    <div class="logo">
		                                        <img src="/img/logo.jpg">
		                                    </div>
		                                    <div class="txt">
		                                        <span>${login.name }</span>님 환영합니다.
		                                    </div>
		                                </div>
		                                <div class="logout_wrap">
		                                    <div class="txt" onclick="location.href='/info'">
												<span>내정보</span>
		                                    </div>
		                                    <div class="txt" onclick="location.href='/logout'">
		                                        <span>로그아웃</span>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
                        	</c:otherwise>
                        </c:choose>
                        <div class="main_banner">
                            <img src="/img/main/banner.png">
                        </div>
                    </section>
                    <section class="section02">
                        <div class="main_board_wrap">
                            <div class="inner">
                                <div class="board_header">
                                    <div class="header_tit">
                                        <div class="txt">매쓰클럽 공지사항</div>
                                        <div class="img">
                                            <img src="/img/main/new.png">
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
                        </div>
                        <div class="main_board_wrap main_board_wrap2">
                            <div class="inner">
                                <div class="board_header">
                                    <div class="header_tit">
                                        <div class="txt">매쓰클럽 입시정보</div>
                                        <div class="img">
                                            <img src="/img/main/new.png">
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
                        </div>
                    </section>
                    <section class="section03">
                        <div class="program_wrap">
                            <div class="program_header">
                                MATHCLUB 수업 프로그램<br><span>12년간 성장한 힘, 그냥 이루어진 것이 아닙니다. MATH CLUB의 특별한 수업을 경험해 보세요.</span>
                            </div>
                            <div class="program_contents">
                                <div class="program">
                                    <div class="img">
                                        <img src="/img/main/section03_pro01.png">
                                    </div>
                                    <div class="txt">확인이해학습</div>
                                </div>
                                <div class="program">
                                    <div class="img">
                                        <img src="/img/main/section03_pro02.png">
                                    </div>
                                    <div class="txt">확실한 숙제체크</div>
                                </div>
                                <div class="program">
                                    <div class="img">
                                        <img src="/img/main/section03_pro03.png">
                                    </div>
                                    <div class="txt">주간 복습</div>
                                </div>
                                <div class="program">
                                    <div class="img">
                                        <img src="/img/main/section03_pro04.png">
                                    </div>
                                    <div class="txt">자기주도 학습</div>
                                </div>
                                <div class="program">
                                    <div class="img">
                                        <img src="/img/main/section03_pro05.png">
                                    </div>
                                    <div class="txt">일대일 개별체크</div>
                                </div>
                                <div class="program">
                                    <div class="img">
                                        <img src="/img/main/section03_pro06.png">
                                    </div>
                                    <div class="txt">개인 파일에 의한 학생관리</div>
                                </div>
                                <div class="program">
                                    <div class="img">
                                        <img src="/img/main/section03_pro07.png">
                                    </div>
                                    <div class="txt">매시간 테스트</div>
                                </div>
                                <div class="program">
                                    <div class="img">
                                        <img src="/img/main/section03_pro08.png">
                                    </div>
                                    <div class="txt">수업관리, 오답노트관리</div>
                                </div>
                            </div>
                        </div>
                        <div class="class_wrap">
                            <div class="class">
                                <img src="/img/main/section03_class01.png">
                            </div>
                            <div class="class">
                                <img src="/img/main/section03_class02.png">
                            </div>
                            <div class="class">
                                <img src="/img/main/section03_class03.png">
                            </div>
                        </div>
                        <div class="cs_wrap">
                            <div class="cs_item">
                                <img src="/img/main/section03_cs.png">
                            </div>
                            <div class="cs_item">
                                <img src="/img/main/section03_road.png">
                            </div>
                        </div>
                    </section>
                </div>
                <a href="high_main.html">
                    <div class="quick_menu">
                        <img src="/img/main/quick_menu.jpg">
                        <div class="quick_cover"></div>
                        <div class="img">
                            <img src="/img/main/quick_menu_icon.png">
                        </div>
                    </div>
                </a>
            </div>
            <footer class="middle_footer">
            	<c:import url="/WEB-INF/view/middle/index/footer.jsp"/>
            </footer>
        </div>
    </body>
    
    <script>
		 // 자동로그인 / 아이디저장 체크
		$("#autoLogin").change(function(){
			if($("#autoLogin").prop("checked")){
				$("#saveId").prop("checked", false);
			}
		});
		$("#saveId").change(function(){
			if($("#saveId").prop("checked")){
				$("#autoLogin").prop("checked", false);
			}
		});
		// 비밀번호 입력란에서 엔터
		$("#pw").keyup(function(event){
			if(event.keyCode==13){
				login();
			}
		});
		// 로그인
		function login(){
			var id = $("#id").val();
			var pw = $("#pw").val();
			var autoLogin = $("#autoLogin").prop("checked");
			var saveId = $("#saveId").prop("checked");
			$.ajax({
				type : "post",
				url : "/login/"+id+"/"+pw+"/"+autoLogin+"/"+saveId,
				async : false,
				success : function(txt){
					if(txt){
						location.reload();
					} else {
						$("#loginFail").show();
					}
				}
			});
		}
    </script>
    
</html>