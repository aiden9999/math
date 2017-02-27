<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="side_header">중등부<br>
	<span>MATH CLUB</span>
</div>
<div class="inner">
    <ul>
        <li id="infoTab">
            <a href="/middle/info/info">
                <span>학원소개</span>
            </a>
        </li>
        <li id="greetTab">
            <a href="/middle/info/greet">
                <span>대표인사말</span>
            </a>
        </li>
        <li id="locationTab">
            <a href="/middle/info/location">
                <span>학원위치</span>
            </a>
        </li>
        <li id="admissionTab">
            <a href="/middle/info/admission">
                <span>입학안내</span>
            </a>
        </li>
        <li id="teacherTab">
            <a href="/middle/info/teacher">
                <span>선생님소개</span>
            </a>
        </li>
    </ul>
</div>

<script>
	$(document).ready(function(){
		$("#infoTab").removeClass("sel");
		$("#greetTab").removeClass("sel");
		$("#locationTab").removeClass("sel");
		$("#admissionTab").removeClass("sel");
		$("#teacherTab").removeClass("sel");
		$("#${menu }Tab").addClass("sel");
	})
</script>