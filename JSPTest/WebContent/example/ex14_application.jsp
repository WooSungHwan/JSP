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
	<!-- ex14_application.jsp -->
	
	<div class="contaianer">
		<h1 class ="page-header">application 객체</h1>
		<h2>컨테이너 정보</h2>
		<%=application.getServerInfo() %>
		
		<h2>서블릿 버전</h2>
		<%=application.getMajorVersion() %>,<%=application.getMinorVersion() %>
		
		<h2>JSP 버전</h2>
		<%=JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %>
		
		<!-- 이것만 기억해두자. --><h2>현재 물리 경로( 상대경로 -> 절대경로 )</h2>
		<%= application.getRealPath(".") %>
		
	</div>
</body>
</html>