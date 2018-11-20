<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//logout.jsp
	session.removeAttribute("id");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Code</title>
<%@ include file="inc/asset.jsp" %>
<style>
	
</style>
<script>
	$(document).ready(function(){
		alert("로그아웃 성공!!");
		location.href="<%=application.getContextPath()%>/code/member.jsp";
	});
</script>
</head>
<body>
	<!-- template.jsp -->
	<div id ="main">
		<jsp:include page="inc/header.jsp"></jsp:include>
			
		<section>
			<h1 class="page-header">Member</h1>
		</section>
	</div>
</body>
</html>