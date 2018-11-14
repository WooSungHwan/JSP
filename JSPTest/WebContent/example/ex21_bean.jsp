<%@page import="com.test.jsp.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//현재 페이지의 목적 : Student 객체 생성 + 사용
Student s1 = new Student();

s1.setName("홍길동");
s1.setAge(15);
s1.setKor(90);
s1.setEng(80);
s1.setMath(85);

Student s2 = new Student();

s2.setName("홍길동");
s2.setAge(15);
s2.setKor(88);
s2.setEng(88);
s2.setMath(88);


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
	
	<div class="container">
		<h1 class ="page-header">학생 정보</h1>
		
		<h3><%= s1.getName() %></h3>
		<ul>
			<li>나이 : <%= s1.getAge() %></li>
			<li>국어 : <%= s1.getKor() %></li>
			<li>영어 : <%= s1.getEng() %></li>
			<li>수학 : <%= s1.getMath() %></li>
		</ul>
		
		<h3><%= s2.getName() %></h3>
		<ul>
			<li>나이 : <%= s2.getAge() %></li>
			<li>국어 : <%= s2.getKor() %></li>
			<li>영어 : <%= s2.getEng() %></li>
			<li>수학 : <%= s2.getMath() %></li>
		</ul>
		
		<!-- 3번째 학생 : 액션 태그 -->
		<jsp:useBean id="s3" class="com.test.jsp.Student"></jsp:useBean>
		
		<!-- setter(값) -->
		<jsp:setProperty property="name" value="하하하" name="s3"/><!-- name은 setName을 바꿔서 한것 -->
		<jsp:setProperty property="age" value="14" name="s3"/>
		<jsp:setProperty property="kor" value="97" name="s3"/>
		<jsp:setProperty property="eng" value="50" name="s3"/>
		<jsp:setProperty property="math" value="40" name="s3"/>
		
		<h3><jsp:getProperty property="name" name="s3"/></h3>
		<ul>
			<li>나이 : <jsp:getProperty property="age" name="s3"/> </li>
			<li>국어 : <jsp:getProperty property="kor" name="s3"/> </li>
			<li>영어 : <jsp:getProperty property="eng" name="s3"/> </li>
			<li>수학 : <jsp:getProperty property="math" name="s3"/> </li>
		</ul>
		
		
		
	</div>
</body>
</html>















