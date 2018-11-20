<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


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

	});
</script>
</head>
<body>
	<!-- template.jsp -->
	<div id ="main">
		<jsp:include page="inc/header.jsp"></jsp:include>
			
		<section>
			<h1 class="page-header">Member</h1>
			
			<%if(session.getAttribute("id")==null){ %>
			<input type="button" value="로그인" class="btn btn-default" onclick="location.href='login.jsp'" />
			<%} else{ %>
			<input type="button" value="로그아웃" class="btn btn-default" onclick="location.href='logout.jsp'"/>
			<%} %>
		</section>
	</div>
</body>
</html>