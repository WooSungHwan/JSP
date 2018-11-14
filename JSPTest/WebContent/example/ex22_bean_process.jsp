<%@page import="com.test.jsp.Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//현재 페이지의 목적 : 입력 데이터 가져오기 -> 객체화(DTO, Bean) -> 업무 적용
	
	//한글 인코딩
	request.setCharacterEncoding("UTF-8");
	
	/* String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String tel = request.getParameter("tel");
	String address =request.getParameter("address"); */
	
	/* Address addr= new Address();
	addr.setName(name);
	addr.setAge(age);
	addr.setGender(gender);
	addr.setTel(tel);
	addr.setAddress(address); */
	
	String age = request.getParameter("age");
	
	
	/* HTML 태그의 name 값 == request.getParameter("name값") 
			== 자바빈의 멤버변수명(setter명) == 오라클 테이블 컬럼명 == DTO 멤버변수명(setter 명) */
	
	
	
	
%>    
<!-- 두번째 방법으로 시도 -->
<jsp:useBean id="addr" class="com.test.jsp.Address"></jsp:useBean> <!-- Address addr= new Address(); -->    
<%-- <jsp:setProperty property="name" value='<%=request.getParameter("name")%>' name="addr"/>
<jsp:setProperty property="age" value="<%=age %>" name="addr"/> --%>
<jsp:setProperty property="*" name="addr"/>

    
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
		<h1 class ="page-header">결과</h1>
		
		<p>이름 : <%= addr.getName() %></p>
		<p>나이 : <%= addr.getAge() %></p>
		<p>성별 : <%= addr.getGender() %></p>
		<p>전화 : <%= addr.getTel() %></p>
		<p>주소 : <%= addr.getAddress() %></p>
		
		
		
	</div>
</body>
</html>