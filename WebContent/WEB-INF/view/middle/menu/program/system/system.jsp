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
        <div id="wrapper">
            <header class="middle_header">
            	<c:import url="/WEB-INF/view/middle/index/header.jsp"/>
            </header>
            <div class="sub_all middle_sub02 middle_sub02_02">
                <div class="inner">
                    <aside class="side_menu">
                    	<c:import url="/WEB-INF/view/middle/menu/program/aside.jsp"/>
                    </aside>
                    <div class="contents">
                        <section class="contents_tit">
                            <div class="tit">학원소개</div>
                            <div class="txt">HOME > 학원소개</div>
                        </section>
                        <section class="section01">
                            <img src="/img/middle_sub02/sub02_02/img.png">
                        </section>
                    </div>
                </div>
                <a href="high_main.html">
                    <div class="quick_menu">
                        <img src="/img/main/quick_menu.jpg">
                        <div class="quick_cover"></div>
                        <div class="img">
                            <img src="/img/main/quick_menu_icon.png">
                        </div>
                    </div>
                </a>
            </div>
            <footer class="middle_footer">
            	<c:import url="/WEB-INF/view/middle/index/footer.jsp"/>
            </footer>
        </div>
    </body>
</html>