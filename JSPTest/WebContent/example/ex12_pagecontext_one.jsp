<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//	response.sendRedirect() vs pageContext.forward(url)
//	- 둘다 서버측 이동 -> 라운드 트립 1회
//	- 표면상 차이점
//		a. sendRedirect() : 두번째 페이지 URL로 바뀜
//		b. forward()	  : 첫뻔째 페이지 URL이 고정 
		//이유
		
		//요구사항] 첫번쨰 페이지에서 사용하던 자원을 두번째 페이지에서 계속 사용하고 싶다!?
		int num=100;
		
		//페이지와 페이간의 데이터 전달하는 역할
		request.setAttribute("num",num);

//한페이지 -> (데이터) -> 다른페이지
//1. 상태 유지 필요 : forward()
//2. 깨끗하게 새로 시작 : sendRedirect()

		
//1. 
response.sendRedirect("ex12_pagecontext_two.jsp");

//2.
//pageContext.forward("ex12_pagecontext_two.jsp");    
%>
    

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
	<!-- ex12_pagecontext_one.jsp -->
	<h1>첫번째 페이지</h1>
	
	
	
	
</body>
</html>