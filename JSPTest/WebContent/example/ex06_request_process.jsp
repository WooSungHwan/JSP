<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//페이지 상단 : 출력과는 관계없는 행동 or 출력하기 전 미리해야하는 행동.
	
	//1. 데이터 받기(클라이언트 -> 서버) = request 담당자
	
	//String tag = request.getParameter("폼태그의 name값"); : 클라이언트로부터 전송된 데이터 수신
	
String name = request.getParameter("name");
String gender = request.getParameter("gender");

//데이터 디버깅(확인)
System.out.println(name);
System.out.println(gender);
//getParameter() 없는 키를 참조해도 에러발생X, null 반환
//getParameter() 있는 키를 참조했지만 사용자 입력 X, 빈문자열("") 반환
System.out.println();
System.out.println(name == null); //true
System.out.println(name == "");   //false

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
	<p><%= name %></p>
</body>
</html>