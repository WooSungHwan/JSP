<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- ex18_scope_part.jsp -->

<fieldset>
	<legend>조각페이지</legend>
	
	<%-- <p>지역변수 : <%= a %></p>
	<p>멤버변수 : <%= b %></p> --%>
	<p>pageContext : <%= pageContext.getAttribute("c")%></p>
		<p>request : <%= request.getAttribute("d")%></p>
		<p>session : <%= session.getAttribute("e")%></p>
		<p>application : <%= application.getAttribute("f")%></p>
</fieldset>