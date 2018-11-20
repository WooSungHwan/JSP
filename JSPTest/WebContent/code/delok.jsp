<%@page import="java.io.File"%>
<%@page import="com.test.jsp.code.CodeDTO"%>
<%@page import="com.test.jsp.code.CodeDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	
	//delok.jsp
	//1. 데이터 가져오기
	
	//1.5 첨부파일 삭제(물리적으로)
	//2. DAO 위임 -> delete 실행
	//3. 결과 메시지 -> 이동
	
	//request.setCharacterEncoding("UTF-8");
	
	String seq = request.getParameter("seq");

	CodeDAO dao = new CodeDAO();
	
	//첨부파일명 알아내서 삭제작업
	CodeDTO dto = dao.get(seq);
	
	File file = new File(application.getRealPath("code/files")+"\\"+dto.getFilename());
	if(file.exists()){
		System.out.println("파일이 삭제됨??"+file.delete());
	}
	
	int result = dao.del(seq);
	
	//자기가 쓴 글의 갯수 깍기
	if(result==1){
		//cnt=cnt+1;
		session.setAttribute("cnt", Integer.parseInt(session.getAttribute("cnt").toString())-1);
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
		
		<%if(result==1){   %>
		alert("삭제 성공");
		location.href="<%=application.getContextPath()%>/code/list.jsp";
		<% }else{  %>
		alert("삭제 실패");
		history.back();
		<% }  %>
	});
</script>
</head>
<body>
	<!-- template.jsp -->
	<div id ="main">
		<jsp:include page="inc/header.jsp"></jsp:include>
			
		<section>
			<h1 class="page-header">Code</h1>
			
			
			
			
			
		</section>
	</div>
</body>
</html>