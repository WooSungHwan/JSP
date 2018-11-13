<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
//자바의 비즈니스 코드로 산출된 결과 데이터를
//1. HTML 조작 사용
//2. CSS 조작 사용
//3. Javascript 조작 사용







//업무코드
// - 페이지 출력과 직접 관계가 업는 코드는 주로 HTML 최상단 or 최하단에 배치
// - 업무 코드(자바)와 디자인 코드(HTML)는 되도록 분리시킨다.
Calendar now = Calendar.getInstance(); 

String tag ="";
String tag2 ="";
String tag3="";
if(now.get(Calendar.SECOND)%3==0){
	tag="h1";
	tag2="<h1>";
	tag3="</h1>";
}else if(now.get(Calendar.SECOND)%3==1){
	tag="h3";
	tag2="<h3>";
	tag3="</h3>";
}else {
	tag="h5";
	tag2="<h5>";
	tag3="</h5>";
}


boolean isAuth= true;

String color="";
if(isAuth){
	color="red";
}else {
	color="blue";
}
String name="홍길동";


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
		alert('<%=name%>님 안녕하세요');
	});
</script>
</head>
<body>
	<!-- ex03_scriptlet.jsp -->
	
	<!-- CSS제어 -->
	<h1 style="color:<%= color%>;">JSP의 표현식</h1>
	
	<%
	//자바코드 영역
	int a =10;
	int b =20;
	
	//개발자용
	//System.out.println(a);
	//System.out.println(b);
	%>
	
	<p>출력(PCDATA) : <%= a %></p><!-- 표현식 -->
	<h1><%= b %></h1><!-- 표현식 -->
	
	
	<!-- 디자인코드 -->
	<p>현재 서버 시간 : <%=String.format("%tF",now) %></p>
	
	<%= tag2%>제목입니다.<%=tag3 %>
	
	
</body>
</html>