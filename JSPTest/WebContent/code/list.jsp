<%@page import="com.test.jsp.code.CodeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.test.jsp.code.CodeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//list.jsp
	// 1. DAO 위임 -> select 목록 반환
	// 2. 출력
	
	//1. 
	CodeDAO dao = new CodeDAO();
	
	ArrayList<CodeDTO> list = dao.list();
		
	
	
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Code</title>
<%@ include file="inc/asset.jsp" %>
<style>
	#tbl th:nth-child(1){width:50px;}
	#tbl th:nth-child(2){width:100px;}
	#tbl th:nth-child(3){width:auto;}
	#tbl th:nth-child(4){width:60px;}
	#tbl th:nth-child(5){width:100px;}
	
	#tbl th,#tbl td{
		text-align:center;
	}
	#tbl td:nth-child(3){
		text-align:left;
	}
	
	
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
			
			<table class="table table-bordered" id="tbl">
				<tr>
					<th>번호</th>
					<th>분류</th>
					<th>제목</th>
					<th>이름</th>
					<th>날짜</th>
				</tr>
			<% for (CodeDTO dto : list){ %>
            	<tr>
	               <td><%= dto.getSeq() %></td>
	               <td><%= dto.getCategoryName() %></td>
	               <td><a href="view.jsp?seq=<%=dto.getSeq()%>"><%= dto.getSubject() %></a></td>
	               <td><%= dto.getName() %></td>
	               <td><%= dto.getRegdate() %></td>
            	</tr>
            <% } %>
			</table>
			
			<%if(session.getAttribute("id")!=null){ %>
				<div>
					<input type="button" value="등록하기" class="btn btn-primary" 
					onclick="location.href='add.jsp';"/>
				</div>
			<%} %>
		</section>
	</div>
</body>
</html>