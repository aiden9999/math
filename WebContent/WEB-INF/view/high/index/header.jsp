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
<div class="header_logo">
    <div class="img" onclick="location.href='/${type }'">
        <img src="/img/logo.jpg">
    </div>
</div>