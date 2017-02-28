<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="diff_category_wrap">
	<div class="diff_category_tit">
		<span>“입시정보”</span> 카테고리의 다른 글
	</div>
	<div class="diff_category_box" id="list">
		<ul>
			<c:forEach var="t" items="${list }">
				<c:choose>
					<c:when test="${t.auto == view.auto }">
						<li class="diff_category sel">
					</c:when>
					<c:otherwise>
						<li class="diff_category">
					</c:otherwise>
				</c:choose>
				<div class="txt" onclick="view(${t.auto })">
					<span>${t.title }</span>
				</div>
				<div class="date">
					<span>${t.day }</span>
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
<c:if test="${login.admin == '메인관리자' }">
	<div class="write_btn_wrap">
		<div class="write_btn" onclick="writeInfo()">
			<div class="txt">글쓰기</div>
		</div>
	</div>
</c:if>

<script>
	// 페이지 표시
	$(document).ready(function(){
		var sep = ${sep };
		if("${list.get(0).auto }" == sep[0]){
			$("#prev").css("visibility", "hidden");
			$("#prevTxt").css("visibility", "hidden");
		} else {
			$("#prev").css("visibility", "visible");
			$("#prevTxt").css("visibility", "visible");
		}
		if("${list.get(4).auto}" == sep[sep.length-1]){
			$("#next").css("visibility", "hidden");
			$("#nextTxt").css("visibility", "hidden");
			$("#prevTxt").css("border-right", "0px");
		} else {
			$("#next").css("visibility", "visible");
			$("#nextTxt").css("visibility", "visible");
			$("#prevTxt").css("border-right", "1px solid #066ab4");
		}
	});
	// 글쓰기
	function writeInfo(){
		location.href="/middle/community/info/write";
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
			url : "/middle/community/info/prevNext/"+auto,
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
			url : "/middle/community/info/prevNext/"+auto,
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
			location.href="/${type }";
		} else {
			location.href='/middle/community/info/view/'+num;
		}
	}
</script>