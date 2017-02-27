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
        <div class="popup_cover" id="popDiv1"></div>
        <div class="popup_wrap" id="popDiv2">
            <div class="logo">
                <img src="/img/logo.jpg">
            </div>
            <div class="join_txt">
                <span class="join_txt1">심청이</span>님<br>
                <span class="join_txt2">미래로 입시컨설팅</span>
                <span class="join_txt3">회원가입을 환영합니다.
                </span>
            </div>
            <div class="join_txt4">
                아래 확인버튼을 누르시면 메인페이지로이동합니다.
            </div>
            <div class="send_btn" onclick="location.href='/'">
                <div class="txt">확인</div>
            </div>
        </div>
        <header class="high_header">
        	<c:import url="/WEB-INF/view/high/index/header.jsp"/>
        </header>
        <div class="join join01_02">
            <div class="inner">
                <section class="join_tit_wrap">
                    <div class="join_tit">
                        <div class="img">
                            <img src="/img/join/join01/people.png">
                        </div>
                        <div class="tit">회원가입 절차</div>
                    </div>
                    <div class="join_step">
                        1.실명확인 및 약관동의 > <span> 2.회원 정보작성 </span> > 3.가입완료
                    </div>
                </section>
                <section class="section01">
                    <div class="inner">
                        <div class="info_write_wrap">
                            <div class="info_write_tit">
                                <div class="tit">정보작성</div>
                                <div class="line"></div>
                            </div>
                            <div class="info_write_contents">
                                <div class="info_content m0">
                                    <div class="tit">이름</div>
                                    <div class="txt" id="name">심청이</div>
                                </div>
                                <div class="info_content">
                                    <div class="tit">아이디</div>
                                    <input type="text" id="id" maxlength="20">
                                    <div class="overlap_btn" onclick="idCheck()">중복확인</div>
                                    <div class="txt1">4자~20자 영문, 숫자 조합가능 (공백은 입력불가)</div>
                                </div>
                                <div class="info_content">
                                    <div class="tit">필명</div>
                                    <input type="text" id="nick" maxlength="8">
                                    <div class="overlap_btn" onclick="nickCheck()">중복확인</div>
                                    <div class="txt1">2자~8자 한글, 영문, 숫자 조합가능 (공백은 입력불가)</div>
                                </div>
                                <div class="info_content">
                                    <div class="tit">비밀번호</div>
                                    <input type="password" id="pw" maxlength="16">
                                    <div class="txt1">6~16자 영문, 숫자조합 (대소문자구분, 공백은 입력불가 )</div>
                                </div>
                                <div class="info_content">
                                    <div class="tit">비밀번호 확인</div>
                                    <input type="password" id="pw1" maxlength="16">
                                </div>
                                <div class="info_content">
                                    <div class="tit">거주지역</div>
                                    <select id="addr1">
                                        <option value="choose">선택</option>
			                            <option value="서울">서울</option>
			                            <option value="인천">인천</option>
			                            <option value="세종">세종</option>
			                            <option value="대전">대전</option>
			                            <option value="대구">대구</option>
			                            <option value="광주">광주</option>
			                            <option value="울산">울산</option>
			                            <option value="부산">부산</option>
			                            <option value="경기도">경기도</option>
			                            <option value="강원도">강원도</option>
			                            <option value="충청도">충청도</option>
			                            <option value="전라도">전라도</option>
			                            <option value="경상도">경상도</option>
			                            <option value="제주도">제주도</option>
                                    </select>
                                </div>
                                <div class="info_content">
                                    <div class="tit">주소</div>
                                    <input type="text" id="addr2" placeholder="대치동" maxlength="10">
                                </div>
                                <div class="info_content m1">
                                    <div class="tit">휴대폰</div>
                                    <select id="phone1">
                                        <option value="choose">선택</option>
                                        <option value="010">010</option>
                                        <option value="011">011</option>
                                        <option value="016">016</option>
                                        <option value="017">017</option>
                                        <option value="018">018</option>
                                        <option value="019">019</option>
                                    </select>
                                    <div class="txt2">ㅡ</div>
                                    <input type="text" id="phone2" maxlength="4">
                                    <div class="txt2">ㅡ</div>
                                    <input type="text" id="phone3" maxlength="4">
                                </div>
                                <div class="info_content m2">
                                    <div class="tit">E-mail</div>
                                    <input type="text" id="email1">
                                    <div class="txt3">@</div>
                                    <select id="emailSelect">
                                        <option value="choose">직접입력</option>
                                        <option value="naver.com">네이버</option>
                                        <option value="google.com">구글</option>
                                        <option value="daum.net">다음</option>
                                        <option value="nate.com">네이트</option>
                                        <option value="hotmail.com">핫메일</option>
                                    </select>
                                    <input type="text" id="email2">
                                </div>
                                <div class="info_content">
                                    <div class="tit">정보수신여부</div>
                                    <div class="info_radio_wrap">
                                        <div class="radio_txt">미래로 입시컨설팅 주최 설명회 소식 혹은 학원 설명회 광고를 문자나 이메일로 받으시겠습니까?</div>
                                        <div class="radio_wrap">
                                            <div class="radio_tit">문자 수신동의</div>
                                            <input type="radio" value="yes" name="agreeSms" id="agreeSmsY">
                                            <div class="txt"><label for="agreeSmsY">예</label></div>
                                            <input type="radio" value="no" name="agreeSms" id="agreeSmsN">
                                            <div class="txt"><label for="agreeSmsN">아니오</label></div>
                                        </div>
                                        <div class="radio_wrap">
                                            <div class="radio_tit">이메일 수신동의</div>
                                            <input type="radio" value="yes" name="agreeEmail" id="agreeEmailY">
                                            <div class="txt"><label for="agreeEmailY">예</label></div>
                                            <input type="radio" value="no" name="agreeEmail" id="agreeEmailN">
                                            <div class="txt"><label for="agreeEmailN">아니오</label></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="btn_wrap m1">
                            <div class="btn left" onclick="history.back()">
                                <div class="txt">취소</div>
                            </div>
                            <div class="btn right" onclick="join()">
                                <div class="txt">가입</div>
                            </div>
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
	 	// 아이디, 비번 한글입력 방지
		$(document).ready(function(){
			$("input[id=id]").keyup(function(event){ 
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
				}
			});
			$("input[id=nick]").keyup(function(event){
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^a-z0-9ㄱ-ㅎㅏ-ㅣ가-힣]/gi,''));
				}
			});
			$("input[id=email1]").keyup(function(event){ 
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^a-z0-9_-]/gi,''));
				}
			});
			$("input[id=email2]").keyup(function(event){ 
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^a-z0-9.]/gi,''));
				}
			});
			$("input[id=pw]").keyup(function(event){ 
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^a-zA-Z0-9]/gi,''));
				}
			});
			$("input[id=pw2]").keyup(function(event){ 
				if (!(event.keyCode >=37 && event.keyCode<=40)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^a-zA-Z0-9]/gi,''));
				}
			});
			$("input[id=phone2]").keyup(function(event){ 
				if (!(event.keyCode >=48 && event.keyCode<=57)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^0-9]/gi,''));
				}
			});
			$("input[id=phone3]").keyup(function(event){ 
				if (!(event.keyCode >=48 && event.keyCode<=57)) {
					var inputVal = $(this).val();
					$(this).val(inputVal.replace(/[^0-9]/gi,''));
				}
			});
		});
    	// 아이디 중복체크
    	var idCheck_ = 0;
    	function idCheck(){
    		var id = $("#id").val();
    		if(id==""){
    			alert("아이디를 입력해주세요.");
    		} else if(id.length<4){
    			alert("아이디는 4~20자로 설정해주세요.");
    		} else {
    			$.ajax({
    				type : "post",
    				url : "/member/idCheck/"+id,
    				async : false,
    				success : function(txt){
    					if(txt){
    						$("#id").css("color", "green");
    						$("#id").val(id+"(사용가능)");
    						idCheck_ ++;
    					} else {
    						$("#id").css("color", "red");
    						$("#id").val(id+"(사용불가)");
    						idCheck_ = 0;
    					}
    				}
    			});
    		}
    	}
    	// 필명 중복체크
    	var nickCheck_ = 0;
    	function nickCheck(){
    		var nick = $("#nick").val();
    		if(nick==""){
    			alert("닉네임을 입력해주세요.");
    		} else if(nick.length<2){
    			alert("닉네임은 2~8자로 설정해주세요.");
    		} else {
    			$.ajax({
    				type : "post",
    				url : "/member/nickCheck/"+nick,
    				async : false,
    				success : function(txt){
    					if(txt){
    						$("#nick").css("color", "green");
    						$("#nick").val(nick+"(사용가능)");
    						nickCheck_ ++;
    					} else {
    						$("#nick").css("color", "red");
    						$("#nick").val(nick+"(사용불가)");
    						nickCheck_ = 0;
    					}
    				}
    			});
    		}
    	}
    	// 이메일 선택
    	$("#emailSelect").change(function(){
    		var email_ = $("#emailSelect").val();
    		if(email_=="choose"){
    			$("#email2").val("");
    			$("#email2").focus();
    			$("#email2").prop("readonly", false);
    		} else {
    			$("#email2").val(email_);
    			$("#email2").prop("readonly", true);
    		}
    	});
    	// 회원가입
    	function join(){
    		var id = $("#id").val();
    		var name = $("#name").html();
    		var nick = $("#nick").val();
    		var pw = $("#pw").val();
    		var pw1 = $("#pw1").val();
    		var addr1 = $("#addr1").val();
    		var addr2 = $("#addr2").val();
    		var phone = "";
    		var phone1 = $("#phone1").val();
    		var phone2 = $("#phone2").val();
    		var phone3 = $("#phone3").val();
    		var email = "";
    		var email1 = $("#email1").val();
    		var email2 = $("#email2").val();
    		var agreeSms = $("#agreeSmsY").prop("checked") ? "y" : $("#agreeSmsN").prop("checked") ? "n" : false;
    		var agreeEmail = $("#agreeEmailY").prop("checkec") ? "y" : $("#agreeEmailN").prop("checked") ? "n" : false;
    		if(id=="" || nick=="" || pw=="" || pw1=="" || addr1=="choose" || addr2=="" || phone1=="choose" || phone2=="" ||
    				phone3=="" || email1=="" || email2=="" || !agreeSms || !agreeEmail){
    			alert("입력하지 않은 항목이 있습니다.");
    		} else {
    			if(idCheck_==0){
    				alert("아이디 중복체크를 해주세요.");
    			} else if(nickCheck_==0){
    				alert("닉네임 중복체크를 해주세요.");
    			} else if(nick.indexOf("사용불가")>0){
    				alert("이미 사용중인 닉네임입니다.");
    			} else if(pw.length<6){
    				alert("비밀번호는 6~16자로 설정해주세요.");
    			} else if(pw!=pw1){
    				alert("비밀번호와 확인이 일치하지 않습니다.");
    			} else {
    				id = id.substring(0, id.indexOf('('));
    				nick = nick.substring(0, nick.indexOf('('));
    				phone = phone1+"-"+phone2+"-"+phone3;
    				email = email1+"@"+email2;
    				$.ajax({
    					type : "post",
    					url : "/member/join/"+id+"/"+name+"/"+nick+"/"+pw+"/"+addr1+"/"+addr2+"/"+phone+"/"+agreeSms+"/"+agreeEmail+"?email="+email,
    					async : false,
    					success : function(txt){
    						if(txt){
					    		$("#popDiv1").show();
					    		$("#popDiv2").show();
    						} else {
    							alert("회원가입에 실패하였습니다.\n잠시후 다시 시도해주세요.");
    						}
    					}
    				});
    			}
    		}
    	}
    </script>
    
</html>