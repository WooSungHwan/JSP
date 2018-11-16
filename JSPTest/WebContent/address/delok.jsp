<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.test.jsp.address.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%



	//delok.jsp
	//1. 데이터 가져오기(seq)
	//2. DB 연결 + delete 작업
	//3. 결과 출력
	
	//request.setCharacterEncoding("UTF-8"); 숫자라 불필요
	
	//1. 
	String seq = request.getParameter("seq");
	//2. 
	Connection conn=null;
	
	conn = DBUtil.getConnection();
	PreparedStatement stat = null;
	
	String sql = "delete from tblAddress where seq = ?";
	int result=0;
	try{
		stat=conn.prepareStatement(sql);
		stat.setString(1,seq);
		result = stat.executeUpdate();
	}catch(Exception e){
		
	}
	
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
<jsp:include page="inc/asset.jsp"></jsp:include>
<style>

</style>
<script>
	
	$(document).ready(function() {
		
	});
	
</script>
</head>
<body>
	<!--  -->
	<!-- HTML 완료 메시지 출력 -->
	<div class="container">
		
		<jsp:include page="inc/header.jsp">
			<jsp:param value="Delete" name="context"></jsp:param>
		</jsp:include>		
		<section id="main">
			<!-- 완료 메시지 출력 -->
			<div class="panel panel-default" style="width:250px; margin:100px auto;">
				<div class="panel panel-heading">
				결과
				</div>
				<div class="panel panel-body">
				<%if(result==1){ %>
					<div>삭제가 완료되었습니다.</div>
				<div><a href="list.jsp">목록으로 이동하기</a></div>
				<%}else { %>
				<div>삭제를 실패했습니다.</div>
				<div><a href="#" onclick="history.back()">이전페이지 이동하기</a></div>
				<%} %>
				</div>
			</div>
		</section>
		
		<jsp:include page="inc/footer.jsp"></jsp:include>
		
	</div>
	
</body>
<%

stat.close();
conn.close();
%>
</html>













