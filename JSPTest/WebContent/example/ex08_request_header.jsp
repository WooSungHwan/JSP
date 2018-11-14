<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="inc/asset.jsp"%>
<style>
</style>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<!-- ex08_request_header.jsp -->

	<div class="container">
		<h1>HTTP 요청 메시지 헤더 정보</h1>

		<table class="table table-striped">
			<tr>
				<th>헤더명</th>
				<th>헤더값</th>
			</tr>
			<%
				//for (int i = 0; i < 10; i++) {
				Enumeration<String> e = request.getHeaderNames();
				
				while(e.hasMoreElements()){
					String headerNames=e.nextElement();
					//System.out.println(headerNames+" : "+request.getHeader(headerNames));
				
					
			%>
			<tr>
				<td><%=headerNames %></td>
				<td><%=request.getHeader(headerNames) %></td>
			</tr>
			<%
				}
			%>
		</table>
		
		<hr />
		
		<p>서버 도메인명 : <%= request.getServerName() %></p>
		<p>서버 포트 : <%= request.getServerPort() %></p>
		<p>요청 URL : <%= request.getRequestURL() %></p>
		<p>요청 쿼리 : <%= request.getQueryString() %></p> <!-- 겟방식으로 넘어가는 데이터들... -->
		<p>클라이언트 호스트 : <%= request.getRemoteHost() %></p>
		<p>클라이언트 IP : <%= request.getRemoteAddr()%></p>
		<p>프로토콜 : <%= request.getProtocol()%></p>
		<p>요청방식 : <%= request.getMethod()%></p>
		<p>컨텍스트 경로(**) : <%= request.getContextPath()%></p>
		
		<h2>상대경로</h2>
		<img src="../images/catty01.png" alt="" />
		
		<h2>절대경로</h2>
		<img src="<%=request.getContextPath()%>/images/catty02.png" alt="" />
		
		
		<%
		//request 객체에 데이터 넣기
		request.setAttribute("id","hong");
		%>
		
		<%= request.getAttribute("id")%>
		
		
	</div>









</body>
</html>



