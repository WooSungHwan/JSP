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
		<h1 class ="page-header">시작 페이지</h1>
		
		<h2>인증처리</h2>
		
		<%if(session.getAttribute("id")==null){ %>
		<div><input type="button" value="로그인하기" 
		onclick = "location.href='login.jsp';" class="btn btn-default"/></div>
		<%}else{ %>
		<!-- 고객정보 출력 -->
		<div class="panel panel-default">
			<div class="panel panel-heading">고객 정보</div>
			<div class="panel panel-body">
				<div>ID : <%=session.getAttribute("id") %></div>
				<div>이름 : <%=session.getAttribute("name") %></div>
				<div>등급 : <%=session.getAttribute("lv").toString().equals("1") ? "일반회원" : "관리자" %></div>
			</div>
		</div>
		
		
		<div><input type="button" value="로그아웃" 
		onclick = "location.href='logout.jsp';" class="btn btn-default"/></div>
		<%} %>
		
		<hr />
		
		<h2>허가</h2>
<%-- 		<%if(session.getAttribute("id")==null){ %> --%>
<!-- 			<div><input type="button" value="회원 전용 페이지로 이동하기"  -->
<!-- 			onclick="alert('회원만 접근 가능합니다.')" class="btn btn-default"/></div> -->
<%-- 		<%}else{ %> --%>
<!-- 			<div><input type="button" value="회원 전용 페이지로 이동하기"  -->
<!-- 			onclick = "location.href='member/member.jsp';" class="btn btn-default"/></div> -->
<%-- 		<%} %> --%>
		
		<%-- <%if(session.getAttribute("id")==null){ %>
			<div><input type="button" value="회원 전용 페이지로 이동하기" 
			class="btn btn-default" disabled/></div>
		<%}else{ %>
			<div><input type="button" value="회원 전용 페이지로 이동하기" 
			onclick = "location.href='member/member.jsp';" class="btn btn-default"/></div>
		<%} %> --%>
		
		<%if(session.getAttribute("id")!=null){ %>
			<div><input type="button" value="회원 전용 페이지로 이동하기" 
			onclick = "location.href='member/member.jsp';" class="btn btn-default"/></div>
		<%} %>
		
		<%if(session.getAttribute("id")!=null&&session.getAttribute("lv").toString().equals("2")){ %>
			<div><input type="button" value="관리자 전용 페이지로 이동하기" 
			onclick = "location.href='admin/admin.jsp';" class="btn btn-default"/></div>
		<%} %>
		
		
	</div>
</body>
</html>