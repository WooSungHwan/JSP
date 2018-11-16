<%@page import="com.test.jsp.address.DBUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//list.jsp
	//1. DB 연결 + select 작업
	//2. 결과 출력(테이블 형식)
	
	//1.
	Connection conn = null;
	Statement stat = null;
	ResultSet rs = null;
	
	conn = DBUtil.getConnection();
	stat = conn.createStatement();
	
	String sql = "select * from tblAddress order by name asc";
	
	rs = stat.executeQuery(sql);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
<jsp:include page="inc/asset.jsp"></jsp:include>
<style>
	
	.item {
		width: 500px;
		margin: 30px auto;
	}
	
	.item tr:nth-child(1) td:nth-child(1) {
		width: 150px;
		text-align: center;
	}
	
	#btns {
		width: 500px;
		margin: 20px auto;
	}
	
	.item .btnspan {
		float: right;
		margin: 0px 2px;
		color: #999;
		font-size: 13px;
		cursor: pointer;
	}
	
	.item .btnspan:hover {
		color: #444;
	}
	
</style>
<script>
	
	$(document).ready(function() {
	
	});
	
	function edit(seq) {
		
		location.href = "edit.jsp?seq=" + seq;
	}
	
	function del(seq) {
		if(confirm("정말 삭제하시겠습니까?")){
			location.href = "delok.jsp?seq=" + seq;
		}
	}
	
</script>
</head>
<body>
	<!-- list.jsp -->
	<div class="container">
		
		<jsp:include page="inc/header.jsp">
			<jsp:param value="List" name="context"/>
		</jsp:include>
		
		<section id="main">
			
			<%-- 
			<table class="table table-bordered" id="tbl">
				<tr>
					<th>이름</th>
					<th>나이</th>
					<th>성별</th>
					<th>전화</th>
					<th>주소</th>
				</tr>
				<% while (rs.next()) { %>
				<tr>
					<td><%= rs.getString("name") %></td>
					<td><%= rs.getString("age") %></td>
					<td><%= rs.getString("gender") %></td>
					<td><%= rs.getString("tel") %></td>
					<td><%= rs.getString("address") %></td>
				</tr>
				<% } %>
			</table> 
			--%>
			
			<% while (rs.next()) { %>
			<table class="table table-bordered item">
				<tr>
					<td rowspan="4"><img src="images/<%= rs.getString("gender") %>.png"> </td>
					<td>
						<%= rs.getString("name") %>
						<span class="btnspan" 
							onclick="del(<%= rs.getString("seq") %>);">[del]</span>
						<span class="btnspan" 
							onclick="edit(<%= rs.getString("seq") %>);">[edit]</span>
					</td>
				</tr>
				<tr>
					<td><%= rs.getString("age") %>세</td>
				</tr>
				<tr>
					<td><span class="glyphicon glyphicon-earphone"></span> <%= rs.getString("tel") %></td>
				</tr>
				<tr>
					<td><span class="glyphicon glyphicon-map-marker"></span> <%= rs.getString("address") %></td>
				</tr>
			</table>
			<% } %>
			
			<div id="btns">
				<input type="button" value="등록하기"
					class="btn btn-primary"
					onclick="location.href='add.jsp';">
			</div>
			
		</section>
		
		<jsp:include page="inc/footer.jsp"></jsp:include>
		
	</div>
	
</body>
</html>













