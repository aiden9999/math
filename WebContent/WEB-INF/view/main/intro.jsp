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
            <div class="index">
                <div class="logo">
                    <img src="/img/index/logo.png">
                </div>
                <section class="section01">
                    <div class="inner">
                        <div class="aca_select_wrap" onclick="location.href='/middle'">
                            <div class="aca_back">
                                <img src="/img/index/middle_back.png">
                            </div>
                            <div class="aca_icon">
                                <div class="img">
                                    <img src="/img/index/middle_icon.png">
                                </div>
                            </div>
                        </div>
                        <div class="aca_select_wrap aca_high" onclick="location.href='/high'">
                            <div class="aca_back">
                                <img src="/img/index/high_back.png">
                            </div>
                            <div class="aca_icon">
                                <div class="img">
                                    <img src="/img/index/high_icon.png">
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <footer class="middle_footer">
            	<c:import url="/WEB-INF/view/main/footer.jsp"/>
            </footer>
        </div>
    </body>
</html>