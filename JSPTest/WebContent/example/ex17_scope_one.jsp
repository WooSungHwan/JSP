<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요구사항] 하나의 페이지에서 사용하던 데이터를 다른페이지에서 상태 유지(***)
	
	//저장할수 있는 것
	//1. 지역변수 사용
	int a =10;
	
%><%!
	//2. 전역(클래스 멤버)변수 사용
	int b =20;
	%>
<%
	//3. pageContext 사용
	pageContext.setAttribute("c", 30);

	//4. request 사용
	request.setAttribute("d", 40);
	
	//5. session 사용
	session.setAttribute("e", 50);
	
	//6. application
	application.setAttribute("f", 60);
	
%>

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
	
	<div class="container">
		<h1 class ="page-header">첫번째 페이지</h1>
		
		<p>지역변수 : <%= a%></p>
		<p>멤버변수 : <%= b%></p>
		<p>pageContext : <%= pageContext.getAttribute("c")%></p>
		<p>request : <%= request.getAttribute("d")%></p>
		<p>session : <%= session.getAttribute("e")%></p>
		<p>application : <%= application.getAttribute("f")%></p>
		
		<hr />
		<!-- 두번쨰 페이지로 이동하기 : 다양한 수단이 있다. -->
		<a href="ex17_scope_two.jsp">a태그(링크)</a>
		
		<hr />
		
		<input type="button" value="두번째 페이지" onclick="location.href='ex17_scope_two.jsp';" />
		
		<hr />
		
		<%
			//response.sendRedirect("ex17_scope_two.jsp");
			pageContext.forward("ex17_scope_two.jsp");
		%>
		
	</div>
</body>
</html>