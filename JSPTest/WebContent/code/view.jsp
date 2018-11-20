<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="com.test.jsp.code.CodeDTO"%>
<%@page import="com.test.jsp.code.CodeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//view.jsp
	
	// - <a href="view.jsp?seq=1">제목</a>
	//1. 데이터 가져오기
	//2. DAO 위임 -> select -> 글1개의 모든 내용 반환
	//3. 출력(상세보기)
	
	
	//1. 
	String seq = request.getParameter("seq");
	
	//2. 
	CodeDAO dao = new CodeDAO();
	CodeDTO dto = new CodeDTO();
	
	dto = dao.get(seq);
	
	//3. 소스파일의 내용 읽기
	BufferedReader reader = new BufferedReader(new FileReader(application.getRealPath("code/files")+"\\"+dto.getFilename()));
	
	String txt = "";
	String source="";
	while((txt=reader.readLine())!=null){
		source+= txt + "\r\n";
	}
	reader.close();
	
	
	//Prism : 카테고리 -> Prism 키워드로 변환
	
	String keyword = "";
	
	if(dto.getCategory().equals("1")){
		keyword="java";
	}else if(dto.getCategory().equals("2")){
		keyword="sql";
	}else if(dto.getCategory().equals("3")){
		keyword="markup";
	}else if(dto.getCategory().equals("4")){
		keyword="css";
	}else if(dto.getCategory().equals("5")){
		keyword="javascript";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Code</title>
<%@ include file="inc/asset.jsp" %>
<link rel="stylesheet" href="css/prism.css" />
<script src="js/prism.js"></script>
<style>
	#tbl th{width:150px;}
	
	#tbl tr:nth-child(1) td:last-child{
		width: 140px;
		text-align:center;
		vertical-align:middle;
	}
	
	#tbl tr:first-child td:nth-child(even){
		width:160px;
	}
	
	#tbl tr:last-child td{
		padding:15px;
	}
	
	#tbl tr:nth-child(5) td pre{
		width:720px;
		margin:15px auto;
	}
	
	
</style>
<script>
	$(document).ready(function(){

	});
</script>
</head>
<body>
	<!-- template.jsp -->
	<div id ="main">
		<jsp:include page="inc/header.jsp"></jsp:include>
			
		<section>
			<h1 class="page-header">Code</h1>
			
			<table class="table table-bordered" id="tbl">
				<tr>
					<th>이름</th>
					<td><%=dto.getName() %></td>
					<th>아이디</th>
					<td><%=dto.getId() %></td>
					<td rowspan="4"><img src="images/<%=dto.getId() %>.png" alt="" /></td>
				</tr>
				<tr>
					<th>번호</th>
					<td><%=dto.getSeq() %></td>
					<th>날짜</th>
					<td><%=dto.getRegdate() %></td>
				</tr>
				<tr>
					<th>분류</th>
					<td colspan="3"><%=dto.getCategoryName() %></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><%=dto.getSubject() %></td>
				</tr>
				<tr>
					<td colspan="5">
						<pre><code class="language-<%=keyword%>"><%=source.replace(">","&gt;").replace("<","&lt;") %></code></pre>
					</td>
				</tr>
				<tr>
					<td colspan="5"><%=dto.getContent().replace("\r\n","<br>").replace(" ","&nbsp;") %></td>
				</tr>
			</table>
			
			<div>
				<input type="button" value="돌아가기" required class="btn btn-default" onclick="history.back();" />
				<% if(session.getAttribute("id").toString().equals(dto.getId())
						||session.getAttribute("lv").toString().equals("2")){ %>
				<input type="button" value='수정하기' required class="btn btn-primary" onclick="location.href='edit.jsp?seq=<%=dto.getSeq()%>';"/>
				<input type="button" value='삭제하기' required class="btn btn-primary" onclick="location.href='del.jsp?seq=<%=dto.getSeq()%>';"/>
				
				<%} %>
			</div>
			
		</section>
	</div>
</body>
</html>