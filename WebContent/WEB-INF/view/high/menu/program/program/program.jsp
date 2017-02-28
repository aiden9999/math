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
           <header class="middle_header high_header high_header2">
           		<c:import url="/WEB-INF/view/high/index/header2.jsp"/>
            </header>
            <div class="sub_all high_sub high_sub01 high_sub01_01">
                <div class="inner">
                    <aside class="side_menu">
                        <c:import url="/WEB-INF/view/high/menu/program/aside.jsp"/>
                    </aside>
                    <div class="contents">
                        <section class="contents_tit">
                            <div class="tit">프로그램</div>
                            <div class="txt">HOME > 수업프로그램</div>
                        </section>
                        <section class="section01">
                            <img src="/img/high_sub02/sub02_01/img.png">
                        </section>
                    </div>
                </div>
                <c:import url="/WEB-INF/view/high/index/quick.jsp"/>
            </div>
            <footer class="middle_footer">	
            	<c:import url="/WEB-INF/view/high/index/footer.jsp"/>
            </footer>
        </div>
    </body>
</html>