<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="side_header">중등부<br><span>MATH CLUB</span></div>
<div class="inner">
    <ul>
        <li id="noticeTab">
            <a href="/middle/community/notice">
                <span>공지사항</span>
            </a>
        </li>
        <li id="reviewTab">
            <a href="/middle/community/review">
                <span>수업후기</span>
            </a>
        </li>
        <li id="infoTab">
            <a href="/middle/community/info">
                <span>입시정보</span>
            </a>
        </li>
    </ul>
</div>

<script>
	$(document).ready(function(){
		$("#noticeTab").removeClass("sel");
		$("#reviewTab").removeClass("sel");
		$("#infoTab").removeClass("sel");
		$("#${menu }Tab").addClass("sel");
	});
</script>