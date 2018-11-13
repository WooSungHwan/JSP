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
	<!-- ex11_pagecontext.jsp -->
	<%
	
	pageContext.setAttribute("name", "홍길동");
	pageContext.setAttribute("age", 20);
	
	
	%>
	
	<p>이름 : <%=pageContext.getAttribute("name") %></p>	
	<p>나이 : <%=pageContext.getAttribute("age") %></p>	
	
	
	
	
</body>
</html>








