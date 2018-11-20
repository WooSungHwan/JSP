<%@page import="com.test.jsp.code.CodeDTO"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.test.jsp.code.CategoryDTO"%>
<%@page import="com.test.jsp.code.CodeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	



	if(session.getAttribute("id")==null){
		response.sendRedirect("index.jsp");
	}


	// edit.jsp
	
	// 1. 데이터 가져오기(글번호 seq)
	
	// 2. DAO 위임 -> select where seq = ? -> 기존 내용 반환(CodeDTO)
			
	// 3. 입력 폼의 기본값으로 넣기
	
	CodeDAO dao = new CodeDAO();
	
	ArrayList<CategoryDTO> clist = dao.listCategory();
	
	//location.href="edit.jsp?seq= 번호"
	String seq = request.getParameter("seq");
	
	//2. view.jsp의 메소드를 재사용 
	CodeDTO dto = dao.get(seq);
	
	// 체크 - 글 작성자
	
	if(!session.getAttribute("id").toString().equals(dto.getId())&&
			session.getAttribute("lv").toString().equals("1")){
		response.sendRedirect("list.jsp");
	}
	
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Code</title>
<%@ include file="inc/asset.jsp" %>
<style>
	#tbl th{
		width:150px;	
	}
	#tbl td{
		
	}
	
	#tbl tr:nth-child(1) td select{width:150px;}
	#tbl tr:nth-child(3) td textarea{height:150px;}
	
</style>
<script>
	$(document).ready(function(){
		<%
			Iterator<CategoryDTO> iter = clist.iterator();
			while(iter.hasNext()){
				CategoryDTO cdto = iter.next();
			%>
				$("#category").append('<option value="<%=cdto.getSeq()%>"><%=cdto.getName() %></option>');		
			<%}
		%>
		
		//3. 수정할 기존 데이터를 컨트롤의 기본값으로 넣기
		//$("#subject").val("기존 제목"); -> 더블코테이션 넣는거 잊지 말기
		$("#subject").val("<%=dto.getSubject()%>");
		$("#category").val("<%=dto.getCategory()%>");
		<%-- //$("#content").val("<%=dto.getContent()%>");이거 안됨.
		
		***textarea는 태그사이에 값을 넣어줄 것!!
		
		 --%>
		
	});
	
	
</script>
</head>
<body>
	<!-- template.jsp -->
	<div id ="main">
		<jsp:include page="inc/header.jsp"></jsp:include>
			
		<section>
			<h1 class="page-header">Code</h1>
			<form action="editok.jsp" method="post" enctype="multipart/form-data">
				<table id="tbl" class="table table-bordered">
					
					<tr>
						<th>카테고리</th>
						<td>
							<select name="category" id="category" class="form-control" required>
								
							</select>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="subject" id="subject" class="form-control" required /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="content" id="content" class="form-control" required><%=dto.getContent()%></textarea></td>
					</tr>
					<tr>
						<th>소스</th>
						<td>
						
						<input type="file" name="attach" id="attach" class="form-control" />
						
						<div>
							<span class="label label-primary">
								<%=dto.getFilename() %>
								<span>x</span>
							</span>
						</div>
						
						</td>
					</tr>
				</table>
				
				<div style="width:">
					<input type="submit" value='수정하기' required class="btn btn-primary" />
					<input type="button" value="돌아가기" required class="btn btn-default" onclick="history.back();" /> 
					<!-- <input type="button" value="돌아가기2" required class="btn btn-default" onclick="test();" /> -->  
				</div>
				
				<input type="hidden" value="<%=seq %>" name="seq" />
				
			</form>
		</section>
	</div>
</body>
</html>