<%@page import="java.util.Arrays"%>
<%@page import="java.util.Date"%>
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
	<!-- ex26_session.jsp -->
	<div class="container">
		<h1 class ="page-header">세션 제어</h1>
		
		<p><%= session.getCreationTime()%>
		,<%=String.format("%tF,%tT",new Date(session.getCreationTime()),new Date(session.getCreationTime())) %></p>
		<p><%= session.getId()%></p><!-- 현재 접속한 유저의 임시 식별자 -->
		<p><%= session.getLastAccessedTime()%>,<%=String.format("%tF,%tT",new Date(session.getLastAccessedTime()),new Date(session.getLastAccessedTime())) %></p>
		<p><%= session.isNew()%></p>
		<p><%= session.getMaxInactiveInterval()%></p>
		
		<hr />
		
		<a href="ex26_session_set.jsp">세션값 저장하기</a><br />
		<a href="ex26_session_del.jsp">세션값 삭제하기</a><br />
		<a href="ex26_session_reset.jsp">세션 초기화</a><br />
		<a href="ex26_session_inverval.jsp">세션 만료시간 지정하기</a><br />
		
		<hr />
		
		<p>이름 : <%=session.getAttribute("data") %></p>
		<p>결과 : <%=session.getAttribute("result") %></p>
		<p>배열 : <%=Arrays.toString((String[])session.getAttribute("list")) %></p>
		
		
		
		
		
		
		
		
	</div>
</body>
</html>














