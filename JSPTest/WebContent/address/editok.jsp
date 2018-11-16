<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.test.jsp.address.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%



	//editok.jsp
	//1. 데이터 가져오기(사용자 수정 입력)
	//2. DB 연결 + update 작업
	//3. 결과 출력
	
	request.setCharacterEncoding("UTF-8");// 인코딩 (ISO-8859-1) -> UTF-8로함
	
	//1. 
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");
	String seq = request.getParameter("seq");
	//2. 
	Connection conn=null;
	
	conn = DBUtil.getConnection();
	PreparedStatement stat = null;
	
	String sql = "update tblAddress set name=?,address=?,age=?,gender=?,tel=? where seq=?";
	int result=0;
	try{
		stat=conn.prepareStatement(sql);
		stat.setString(1,name);
		stat.setString(2,address);
		stat.setString(3,age);
		stat.setString(4,gender);
		stat.setString(5,tel);
		stat.setString(6,seq);
		result = stat.executeUpdate();
		
		stat.close();
		conn.close();
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
			<jsp:param value="Edit" name="context"></jsp:param>
		</jsp:include>		
		<section id="main">
			<!-- 완료 메시지 출력 -->
			<div class="panel panel-default" style="width:250px; margin:100px auto;">
				<div class="panel panel-heading">
				결과
				</div>
				<div class="panel panel-body">
				<%if(result==1){ %>
					<div>수정이 완료되었습니다.</div>
				<div><a href="list.jsp">목록으로 이동하기</a></div>
				<%}else { %>
				<div>수정을 실패했습니다.</div>
				<div><a href="#" onclick="history.back()">이전페이지 이동하기</a></div>
				<%} %>
				</div>
			</div>
		</section>
		
		<jsp:include page="inc/footer.jsp"></jsp:include>
		
	</div>
	
</body>
</html>













