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
	
	<div class="container">
		<h1 class ="page-header">결과</h1>
		
		<p>session : <%= session.getAttribute("num") %></p>
		<p>application : <%= application.getAttribute("name") %></p>
		
		<hr />
		
		<%
			if(request.getAttribute("mcount")==null){
				request.setAttribute("mcount",1);
			}else{
				//누적
				request.setAttribute("mcount",(int)request.getAttribute("mcount")+1); //방문횟수
			}
		
			//session.setAttribute("mcount",(int)session.getAttribute("mcount")+1);
			
			//System.out.println(session.getAttribute("mcount"));
			
			//session
			if(session.getAttribute("mcount")==null){
				session.setAttribute("mcount",1);
			}else{
				//누적
				session.setAttribute("mcount",(int)session.getAttribute("mcount")+1); //방문횟수
			}
//-------------------------------------------------------------------------------------------------
			//application
			if(application.getAttribute("mcount")==null){
				application.setAttribute("mcount",1);
			}else{
				//누적
				application.setAttribute("mcount",(int)application.getAttribute("mcount")+1); //방문횟수
			}
		
			session.setMaxInactiveInterval(30);
			
		%>
		<p>request접속 횟수 : <%=request.getAttribute("mcount") %></p>
		<p>session접속 횟수 : <%=session.getAttribute("mcount") %></p>
		<p>application접속 횟수 : <%=application.getAttribute("mcount") %></p>
		
	</div>
</body>
</html>