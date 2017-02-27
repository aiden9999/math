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
        <header class="mypage_header">
            <div class="inner">
                <div class="logo" onclick="location.href='/${type}'">
                    <img src="/img/logo.jpg">
                </div>
            </div>
        </header>
        <div class="mypage mypage01 join01_02">
            <div class="inner">
                <aside class="side_menu">
                    <div class="side_header">회원정보<br><span>MATH CLUB</span></div>
                    <div class="inner">
                        <ul>
                            <li class="sel">
                                <a href="mypage01.html">
                                    <span>내정보</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </aside>
                <div class="contents">
                    <section class="contents_tit">
                        <div class="tit">마이 페이지</div>
                        <div class="txt">Home > 마이페이지 > 정보수정</div>
                    </section>
                    <section class="section01">
                        <div class="inner">
                            <div class="info_write_wrap">
                                <div class="info_write_tit">
                                    <div class="tit">내정보</div>
                                    <div class="line"></div>
                                </div>
                                <div class="info_write_contents">
                                    <div class="write_change" onclick="location.href='/infoChange'">
                                        <span>회원 정보변경</span>
                                    </div>
                                    <div class="info_content m0">
                                        <div class="tit">이름</div>
                                        <div class="txt">${login.name }</div>
                                    </div>
                                    <div class="info_content m0">
                                        <div class="tit">아이디</div>
                                        <div class="txt">${login.id }</div>
                                    </div>
                                    <div class="info_content m0">
                                        <div class="tit">필명</div>
                                        <div class="content_box">${login.nick }</div>
                                    </div>
                                    <div class="info_content">
                                        <div class="tit">비밀번호</div>
                                        <div class="content_box">
                                            ********
                                        </div>
                                    </div>
                                    <div class="info_content">
                                        <div class="tit">비밀번호 확인</div>
                                        <div class="content_box">
                                            ********
                                        </div>
                                    </div>
                                    <div class="info_content">
                                        <div class="tit">거주지역</div>
                                        <div class="content_box">${login.addr1 }</div>
                                    </div>
                                    <div class="info_content">
                                        <div class="tit">주소</div>
                                        <div class="content_box">${login.addr2 }</div>
                                    </div>
                                    <div class="info_content m1">
                                        <div class="tit">휴대폰</div>
                                        <div class="content_box">${login.phone.substring(0, login.phone.indexOf('-')) }</div>
                                        <div class="txt2">ㅡ</div>
                                        <div class="content_box">${login.phone.substring(login.phone.indexOf('-')+1, login.phone.lastIndexOf('-')) }</div>
                                        <div class="txt2">ㅡ</div>
                                        <div class="content_box">${login.phone.substring(login.phone.lastIndexOf('-')+1) }</div>
                                    </div>
                                    <div class="info_content m2">
                                        <div class="tit">E-mail</div>
                                        <div class="content_box b1">${login.email.substring(0, login.email.indexOf('@')) }</div>
                                        <div class="txt3 t3">@</div>
                                        <div class="content_box b3">${login.email.substring(login.email.indexOf('@')+1) }</div>
                                    </div>
                                    <div class="info_content">
                                        <div class="tit">정보수신여부</div>
                                        <div class="info_radio_wrap">
                                            <div class="radio_txt">미래로 입시컨설팅 주최 설명회 소식 혹은 학원 설명회 광고를 문자나 이메일로 받으시겠습니까?</div>
                                            <div class="radio_wrap">
                                                <div class="radio_tit">문자 수신동의</div>
                                                <c:choose>
	                                            	<c:when test="${login.agreeSms == 'y' }">
			                                            <input type="radio" value="yes" name="agreeSms" id="agreeSmsY" disabled="disabled" checked="checked">
			                                            <div class="txt"><label for="agreeSmsY">예</label></div>
			                                            <input type="radio" value="no" name="agreeSms" id="agreeSmsN" disabled="disabled">
			                                            <div class="txt"><label for="agreeSmsN">아니오</label></div>
	                                            	</c:when>
	                                            	<c:otherwise>
			                                            <input type="radio" value="yes" name="agreeSms" id="agreeSmsY" disabled="disabled">
			                                            <div class="txt"><label for="agreeSmsY">예</label></div>
			                                            <input type="radio" value="no" name="agreeSms" id="agreeSmsN" disabled="disabled" checked="checked">
			                                            <div class="txt"><label for="agreeSmsN">아니오</label></div>
	                                            	</c:otherwise>
	                                            </c:choose>
                                            </div>
                                            <div class="radio_wrap">
                                                <div class="radio_tit">이메일 수신동의</div>
                                                <c:choose>
	                                            	<c:when test="${login.agreeEmail == 'y' }">
			                                            <input type="radio" value="yes" name="agreeEmail" id="agreeEmailY" disabled="disabled" checked="checked">
			                                            <div class="txt"><label for="agreeEmailY">예</label></div>
			                                            <input type="radio" value="no" name="agreeEmail" id="agreeEmailN" disabled="disabled">
			                                            <div class="txt"><label for="agreeEmailN">아니오</label></div>
	                                            	</c:when>
	                                            	<c:otherwise>
			                                            <input type="radio" value="yes" name="agreeEmail" id="agreeEmailY" disabled="disabled">
			                                            <div class="txt"><label for="agreeEmailY">예</label></div>
			                                            <input type="radio" value="no" name="agreeEmail" id="agreeEmailN" disabled="disabled" checked="checked">
			                                            <div class="txt"><label for="agreeEmailN">아니오</label></div>
	                                            	</c:otherwise>
	                                            </c:choose>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <footer class="footer">
        	<c:import url="/WEB-INF/view/main/footer.jsp"/>
        </footer>
    </body>
</html>