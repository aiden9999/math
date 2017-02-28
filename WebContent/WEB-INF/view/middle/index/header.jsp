<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="inner">
    <div class="logo">
        <a href="/middle">
            <img src="/img/logo.jpg">
        </a>
    </div>
    <c:if test="${login.admin == '메인관리자' }">
	    <div class="visit">오늘 : ${todayVisit } | 총 : ${totalVisit }</div>
    </c:if>
    <nav class="gnb_wrap">
        <ul>
            <li class="gnb" id="info">
                <a href="/middle/info/info">
                    <span>학원소개</span>
                </a>
            </li>
            <li class="gnb" id="program">
                <a href="/middle/program/program">
                    <span>프로그램</span>
                </a>
            </li>
            <li class="gnb" id="community">
                <a href="/middle/community/notice">
                    <span>커뮤니티</span>
                </a>
            </li>
            <li class="gnb" id="special" onclick="javascript: alert('준비중입니다.')">
                <span>특목고</span>
            </li>
        </ul>
    </nav>
</div>

<script>
	$(document).ready(function(){
		$("#info").removeClass(" sel");
		$("#program").removeClass(" sel");
		$("#community").removeClass(" sel");
		$("#special").removeClass(" sel");
		$("#${topMenu }").addClass(" sel");
	});
</script>