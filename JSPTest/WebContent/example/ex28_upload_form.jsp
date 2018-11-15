<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="inc/asset.jsp" %>
<style>
	input{
		margin:5px;
	}
</style>
<script>
	$(document).ready(function(){

	});
</script>
</head>
<body>
	
	<div class="container">
		<h1 class ="page-header">파일 업로드</h1>
		<!-- 
		1. 파일 업로드 <form> 의 <input type="file"> 태그를 사용한다.
		
		2. 해당 <form>의 method ="post" 이어야 한다.
		
		3. 해당 <form>의 enctype 속성 지정
			- application/x-www-form-urlencoded : 기본값(전송 데이터 모두 문자열)
			- multipart/form-data : 문자열 + 비문자열
		 -->
		
		<form method="post" action="ex28_upload_process.jsp" 
			enctype="multipart/form-data">
			<div>제목 : <input type="text" name="subject" /></div>
			<div>이름 : <input type="text" name="name" /></div>
			<div>파일 : <input type="file" name="attach1"/></div>
			<div>파일 : <input type="file" name="attach2"/></div>
			<div>파일 : <input type="file" name="attach3"/></div>
			
			<hr />
			<input type="submit" value="보내기" />
		</form>
		
	</div>
</body>
</html>