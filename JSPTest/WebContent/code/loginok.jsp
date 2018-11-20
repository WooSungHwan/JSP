<%@page import="com.test.jsp.code.MemberDTO"%>
<%@page import="com.test.jsp.code.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//loginok.jsp
	//1. 데이터 처리 
	//2. DAO 위임 -> select -> 결과
	//3. 결과 -> 인증처리
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPw(pw);
	MemberDAO dao = new MemberDAO();
	dto = dao.login(dto);
	if(dto!=null){
		
		//인증 처리
		session.setAttribute("id", dto.getId());//인증티켓
		session.setAttribute("name", dto.getName());
		session.setAttribute("lv", dto.getLv());
		session.setAttribute("cnt", dto.getCnt());
	}

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
		
		<%if(dto!=null){ %>
			alert("로그인 성공!!");
			location.href="<%=application.getContextPath()%>/code/member.jsp";
		<% } else{%>
			alert("로그인 실패!!");
			history.back();
		<% } %>
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