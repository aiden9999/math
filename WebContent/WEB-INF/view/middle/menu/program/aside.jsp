<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="side_header">중등부<br><span>MATH CLUB</span></div>
<div class="inner">
    <ul>
        <li id="programTab">
            <a href="/middle/program/program">
                <span>수업프로그램</span>
            </a>
        </li>
        <li id="systemTab">
            <a href="/middle/program/system">
                <span>4단계학습시스템</span>
            </a>
        </li>
        <li id="processTab">
            <a href="/middle/program/process">
                <span>학습과정(진도)</span>
            </a>
        </li>
    </ul>
</div>

<script>
	$(document).ready(function(){
		$("#programTab").removeClass("sel");
		$("#systemTab").removeClass("sel");
		$("#processTab").removeClass("sel");
		$("#${menu }Tab").addClass("sel");
	});
</script>