<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="header_top">
    <c:choose>
		<c:when test="${login == null }">
		    <div class="hmenu_wrap">
		        <ul>
		            <li>
		                <a href="/high/login">
		                    <span>로그인</span>
		                </a>
		            </li>
		            <li>
		                <a href="/high/join">
		                    <span>
		                        회원가입
		                    </span>
		                </a>
		            </li>
		        </ul>
		    </div>
		</c:when>
		<c:otherwise>
			<div class="hmenu_wrap">
		        <ul>
		        	<li>
		                <a href="/info">
		                    <span>내정보</span>
		                </a>
		            </li>
		            <li>
		                <a href="/logout">
		                    <span>로그아웃</span>
		                </a>
		            </li>
		        </ul>
		    </div>
		</c:otherwise>
	</c:choose>
</div>
<div class="inner">
    <div class="logo">
        <a href="/${type }">
            <img src="/img/logo.jpg">
        </a>
    </div>
    <nav class="gnb_wrap">
        <ul>
            <li class="gnb" id="info">
                <a href="/high/info/info">
                    <span>학원소개</span>
                </a>
            </li>
            <li class="gnb" id="program">
                <a href="/high/program/program">
                    <span>프로그램</span>
                </a>
            </li>
            <li class="gnb" id="top">
<!--             	<a href="/high/top/top"> -->
            	<a onclick="javascript: alert('준비중입니다.')">
                	<span>최상위반</span>
                </a>
            </li>
            <li class="gnb" id="community">
                <a href="/high/community/notice">
                    <span>커뮤니티</span>
                </a>
            </li>
        </ul>
    </nav>
</div>

<script>
	$(document).ready(function(){
		$("#info").removeClass(" sel");
		$("#program").removeClass(" sel");
		$("#top").removeClass(" sel");
		$("#community").removeClass(" sel");
		$("#${topMenu }").addClass(" sel");
	});
</script>