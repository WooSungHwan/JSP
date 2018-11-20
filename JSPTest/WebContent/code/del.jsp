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
			<h1 class="page-header">Code</h1>
			<p>게시물을 삭제하겠습니까?</p>
			<div>
				<input type="button" value="돌아가기" required class="btn btn-default" onclick="history.back();" />
				<input type="button" value='삭제하기' required class="btn btn-primary" onclick="location.href='delok.jsp?seq=<%=request.getParameter("seq") %>'" />
			</div>
			
		</section>
	</div>
</body>
</html>