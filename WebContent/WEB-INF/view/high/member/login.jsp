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
        <header class="high_header">
        	<c:import url="/WEB-INF/view/high/index/header.jsp"/>
        </header>
        <div class="join join01">
            <div class="inner">
                <section class="section01">
                    <div class="logo">
                        <img src="/img/logo.jpg">
                    </div>
                    <div class="join_input_wrap">
                        <input type="text" id="id" placeholder="아이디" maxlength="12">
                        <input type="password" id="pw" placeholder="비밀번호" maxlength="16">
                        <div class="loginFail" id="loginFail">아이디 / 비밀번호를 확인해주세요.</div>
                        <div class="send_btn" onclick="login()">
                            <div class="txt">로그인</div>
                        </div>
                    </div>
                    <div class="idpw_search">
                        <div class="txt" onclick="search()">
                            <span>아이디</span>
                        </div>
                        <div class="txt">/</div>
                        <div class="txt" onclick="search()">
                            <span>비밀번호 찾기</span>
                        </div>
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
                </section>
                <section class="section02">
                    <div class="join_tit">
                        <span>미래로 입시컨설팅</span>회원가입
                    </div>
                    <div class="join_sort">
                        <div class="img">
                            <img src="/img/join/join01/people.png">
                        </div>
                        <div class="txt" onclick="location.href='/high/join'">
<!--                         <div class="txt" onclick="javascript: alert('준비중입니다.')"> -->
                            <span>
                                일반 회원가입
                            </span>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <footer class="footer">
        	<c:import url="/WEB-INF/view/high/index/footer.jsp"/>
        </footer>
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
			var	 autoLogin = $("#autoLogin").prop("checked");
			var saveId = $("#saveId").prop("checked");
			$.ajax({
				type : "post",
				url : "/login/"+id+"/"+pw+"/"+autoLogin+"/"+saveId,
				async : false,
				success : function(txt){
					if(txt){
						location.href="/${type }";
					} else {
						$("#loginFail").show();
					}
				}
			});
		}
    </script>
    
</html>