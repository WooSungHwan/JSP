<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.test.jsp.address.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
/*
클라이언트가 입력한 한글 -> 서버 전송시 깨지는 경우
A. Get
 - 데이터를 URL에 붙여서 넘기는 방식
 - 데이터(Query String-URL 뒤에 붙는 데이터)를 아파치톰캣이 넘긴다는 뜻
 - 아파치톰캣이 담당이라 데이터 인코딩(디코딩) 처리를 아파치 톰캣 설정에 따라서한다., 즉 아파치 설정이 어떤 설정이 되있느냐에 따라 자기의 인코딩방식으로 한다.
 - 이전버전 : 기본 인코딩 EUC-KR
 - Apache Tomcat 8.0 이후버전 : 기본 인코딩 UTF-8
 - 톰캣 내에서 작동하는 JSP(자바)-이클립스 환경설정 : UTF-8
 - 브라우저(입력) -> 인터넷(ISO-8859-1) ->(여기서 스스로 디코딩) 아파치톰캣(UTF-8) -> (전달) -> JSP(UTF-8)
 
B. Post
 - 데이터를 패킷 본문에 넣어서 넘기는 방식
 - 아파치 톰캣이 관여 못함.(아파치 톰캣의 인코딩과는 상관이 없다.)
 - 브라우저(입력) -> 인터넷(ISO-8859-1) -> (전달) -> (얘는 디코딩 능력이 없음)JSP(UTF-8)
 - 사용자(개발자)가 직접 인코딩 처리를 해야한다. -> request.setCharacterEncoding(인코딩명)

*/








	//addok.jsp
	//1. 데이터 가져오기(사용자 입력)
	//2. DB 연결 + insert 작업
	//3. 결과 출력
	
	request.setCharacterEncoding("UTF-8");// 인코딩 (ISO-8859-1) -> UTF-8로함
	
	//1. 
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String tel = request.getParameter("tel");
	String address = request.getParameter("address");
	
	//2. 
	Connection conn=null;
	
	conn = DBUtil.getConnection();
	PreparedStatement stat = null;
	
	String sql = "insert into tblAddress values(address_seq.nextval,?,?,?,?,?)";
	int result=0;
	try{
		stat=conn.prepareStatement(sql);
		stat.setString(1,name);
		stat.setString(2,address);
		stat.setString(3,age);
		stat.setString(4,gender);
		stat.setString(5,tel);
		
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
		//1. 자바스크립트로 완료메시지 출력
		<%-- <% if (result==1){%>
			alert('등록이 완료되었습니다.');
			location.href="list.jsp";
		<% }else {%>
			alert('등록을 실패했습니다.');
			history.back();
		<%}%> --%>
	});
	
</script>
</head>
<body>
	<!--  -->
	<!-- HTML 완료 메시지 출력 -->
	<div class="container">
		
		<jsp:include page="inc/header.jsp"></jsp:include>		
		<section id="main">
			<!-- 완료 메시지 출력 -->
			<div class="panel panel-default" style="width:250px; margin:100px auto;">
				<div class="panel panel-heading">
				결과
				</div>
				<div class="panel panel-body">
				<%if(result==1){ %>
					<div>등록이 완료되었습니다.</div>
				<div><a href="list.jsp">목록으로 이동하기</a></div>
				<%}else { %>
				<div>등록을 실패했습니다.</div>
				<div><a href="#" onclick="history.back()">이전페이지 이동하기</a></div>
				<%} %>
				</div>
			</div>
		</section>
		
		<jsp:include page="inc/footer.jsp"></jsp:include>
		
	</div>
	
</body>
</html>













