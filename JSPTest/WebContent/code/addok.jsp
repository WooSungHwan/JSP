<%@page import="com.test.jsp.code.CodeDTO"%>
<%@page import="com.test.jsp.code.CodeDAO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. 데이터받기
	//2. insert
	//3. 결과
	
	request.setCharacterEncoding("UTF-8");
	String path = application.getRealPath("code/files");
	int size = 10*1024*1024;
	
	MultipartRequest multi = new MultipartRequest(
			request,
			path,
			size,
			"UTF-8",
			new DefaultFileRenamePolicy()
			);
	
	
	String subject = multi.getParameter("subject");
	String category = multi.getParameter("category");
	String content = multi.getParameter("content");
	String filename = multi.getFilesystemName("attach"); //첨부파일명(물리저장)
	
	
	System.out.println(subject);
	System.out.println(content);
	System.out.println(category);
	System.out.println(filename);
	
	CodeDAO dao = new CodeDAO();
	CodeDTO dto = new CodeDTO();
	dto.setCategory(category);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setFilename(filename);
	dto.setId(session.getAttribute("id").toString());
	
	int result = dao.add(dto);
	
	//자기가 쓴 글의 갯수 더하기!
	if(result==1){
		//cnt=cnt+1;
		session.setAttribute("cnt", Integer.parseInt(session.getAttribute("cnt").toString())+1);
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
		alert("등록 성공");
		location.href="<%=application.getContextPath()%>/code/list.jsp";
		<% }else{  %>
		alert("등록 실패");
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