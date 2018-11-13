<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
		//전송된 데이터중 한글이 포함되면 처리 (request.getParameter 전에 작성.)
		request.setCharacterEncoding("UTF-8");
    
    
    	//데이터 가져오기
    	String width= request.getParameter("width");
    	String height = request.getParameter("height");
    	String txt = request.getParameter("txt");
    	String forecolor = request.getParameter("forecolor");
    	String backgroundColor = request.getParameter("backgroundColor");
    	String fontsize = request.getParameter("fontsize");
    	String count = request.getParameter("count");
    	String isborder = request.getParameter("isborder");
    	String margin = request.getParameter("margin");
    	
    		
    	
    	
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="inc/asset.jsp" %>
<style>
	.mybtn{
		width:<%=width%>px;
		height:<%=height%>px;	
		color:<%=forecolor%>;
		background-color:<%=backgroundColor%>;
		font-size:<%=fontsize%>px;
		<%if(isborder.equals("y")){%>
		border-width:1px;
		<%} else{%>
		border-width:0px;
		<%}%>
		margin:<%=margin%>px
	}
</style>
<script>
	$(document).ready(function(){
		$(".mybtn").click(function(){
			location.href = "ex07.htm";
		});
	});
</script>
</head>
<body>
	
	<div class="container">
		<h1 class="page-header">결과</h1>
		<%for(int i =0; i<Integer.parseInt(count); i++){ %>
				<button type="button" class="btn btn-default mybtn" >
				<%=txt%></button>
		<%} %>
		
	</div>


</body>
</html>