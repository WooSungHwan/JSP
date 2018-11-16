<%@page import="com.test.jsp.address.DBUtil"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//edit.jsp
	//1. 데이터 가져오기(seq)
	//2. DB 연결 + select where ? 작업
	//3. 결과 출력(컨트롤 기본값 출력)
	
	//1.
	String seq = request.getParameter("seq");

	//2.
	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;
	
	conn = DBUtil.getConnection();
	
	String sql = "select * from tblAddress where seq = ?"; //수정할 레코드
	
	stat = conn.prepareStatement(sql);
	stat.setString(1, seq);
	
	rs = stat.executeQuery();
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
<jsp:include page="inc/asset.jsp"></jsp:include>
<style>

	#tbl {
		width: 600px;
		margin: 0px auto;
	}
	
	#tbl th {
		width: 120px;
		text-align: center;
		vertical-align: middle;
		background-color: #eee;
	}
	
	#tbl td {
		width: 480px;
	}
	
	.short { width: 100px; }
	.middle { width: 250px; }
	
	#btns {
		width: 600px;
		margin: 0px auto;
		margin-top: 20px;
	}

</style>
<script>
	
	$(document).ready(function() {
		
		<% if(rs.next()){ %>
		//초기화
		$("#name").val("<%=rs.getString("name")%>");
		$("#age").val("<%=rs.getString("age")%>");
		$("#address").val("<%=rs.getString("address")%>");
		$("#tel").val("<%=rs.getString("tel")%>");
		$("#gender").val("<%=rs.getString("gender")%>");
		
		
		<% }else{%>
			alert("이미 삭제되었거나 존재하지 않는 항목입니다.");
			history.back();
		<% }%>
		
	});
	
	
</script>
</head>
<body>
	<!-- edit.jsp -->
	<div class="container">
		
		<jsp:include page="inc/header.jsp">
			<jsp:param value="Edit" name="context"/>
		</jsp:include>
		
		
		<section id="main">
			
			<!-- 주소록 추가하기(폼 & 테이블) -->
			<%-- <form method="post" action="addok.jsp">
				
				<%
				if (rs.next()) {
				%>
				
				<table id="tbl" class="table table-bordered">
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" id="name" required class="form-control short" value="<%= rs.getString("name") %>"></td>
					</tr>
					<tr>
						<th>나이</th>
						<td><input type="number" name="age" id="age" min="7" max="120" required class="form-control short" value="<%= rs.getString("age") %>"></td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<select name="gender" id="gender" class="form-control short">
								<option value="m" 
								<% if(rs.getString("gender").equals("m")){%> 
										selected
								<% } %>>남자</option>
								<option value="f"
								<% if(rs.getString("gender").equals("f")){%> 
										selected
								<% } %>>여자</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>전화</th>
						<td><input type="tel" name="tel" id="tel" required class="form-control middle" value="<%= rs.getString("tel") %>"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="address" id="address" required class="form-control" value="<%= rs.getString("address") %>"></td>
					</tr>
				</table>
				<div id="btns">
					<input type="submit" value="등록하기" class="btn btn-primary">
					<input type="button" value="돌아가기" class="btn btn-default" onclick="location.href='list.jsp';">
				</div>
				
				<% } else { %>
				
				<div class="panel panel-default" style="width: 250px; margin: 100px auto;">
					<div class="panel-heading">결과</div>
					<div class="panel-body">
						
						<div>존재하지 않는 항목입니다.</div>
						<div><a href="#" onclick="history.back();">이전 페이지로 돌아가기</a></div>
						
					</div>
				</div>
				
				<% } %>
				
			</form> --%>
			<form method="post" action="editok.jsp">		
				<table id="tbl" class="table table-bordered">
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" id="name" required class="form-control short" ></td>
					</tr>
					<tr>
						<th>나이</th>
						<td><input type="number" name="age" id="age" min="7" max="120" required class="form-control short" ></td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<select name="gender" id="gender" class="form-control short">
								<option value="m" selected>남자</option>
								<option value="f"selected>여자</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>전화</th>
						<td><input type="tel" name="tel" id="tel" required class="form-control middle"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="address" id="address" required class="form-control"></td>
					</tr>
				</table>
				<div id="btns">
					<input type="submit" value="수정하기" class="btn btn-primary">
					<input type="button" value="돌아가기" class="btn btn-default" onclick="location.href='list.jsp';">
				</div>
				
				<input type="hidden" name="seq" value="<%=seq %>" />
				
			</form>
			
		</section>
		
		<jsp:include page="inc/footer.jsp"></jsp:include>
		
	</div>
	
</body>
</html>













