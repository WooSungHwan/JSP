<%@page import="com.test.jsp.MyCookie"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="inc/asset.jsp" %>
<style>

</style>
<script>
	$(document).ready(function(){

	});
</script>
</head>
<body>
	<!-- ex27_cookie_two.jsp -->
	<div class="container">
		<h1 class ="page-header">쿠키(저장소)에 사용자 데이터 읽기</h1>
		
		<h3>1. 자바스크립트로 읽기</h3>
			<script src="<%=request.getContextPath()%>/asset/js/cookie.js"></script>
			<div id="output1"></div>
			<script>
				//숫자 읽기
				document.getElementById("output1").innerText = getCookie("num");
			
			</script>
		<h3>2. jQuery로 읽기</h3>
			<div id="output2"></div>
			<script>
				//색깔 읽기
				$("h1").css("color",$.cookie("color"));
				
				//숫자 읽기
				$("#output2").text($.cookie("num"));
			</script>
	
		<h3 style="font-size:<%=MyCookie.getCookie(request.getCookies(),"size")%>px;">3. JSP(Servlet)으로 읽기</h3>
		<%
		/* Cookie[] list=request.getCookies();
		
		for(Cookie cookie : list){
			System.out.printf("%s - %s\n",cookie.getName(),cookie.getValue());
			
		} */
		
		
		
		
		
		%>
		사이즈 : <%=MyCookie.getCookie(request.getCookies(),"size") %>
			
		<hr />
		
		<a href="ex27_cookie_one.jsp">이전 페이지로 돌아가기</a>
		
	</div>
</body>
</html>