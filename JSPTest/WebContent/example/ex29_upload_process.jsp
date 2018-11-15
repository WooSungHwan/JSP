<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String path = application.getRealPath("./example/files");
    
    //최대 크기(100MB)
    int size = 100 * 1024 *1024;
    
    //변수
    String name="";
    String birth="";
    String tel="";
    String address="";
    
    String pic =""; //사진(물리명)
    String orgpic=""; //사진(원본명)
    
    ArrayList<String> doc= new ArrayList<String>();	//문서명(물리)
    ArrayList<String> orgdoc= new ArrayList<String>();	//문서명(원본)
    
    //이제 받는작업
    try{
    	
    	//multi 객체 생성
    	MultipartRequest multi = new MultipartRequest(
    				request,
    				path,
    				size,
    				"UTF-8",
    				new DefaultFileRenamePolicy()//파일명이 겹칠까바 이름 바꿔주는애
    			); //파일 업로드 이미 완료 > 추후에 파일명 가져오기
    			
    	// 데이터 가져오기
    	name = multi.getParameter("name");
    	birth = multi.getParameter("birth");
    	tel = multi.getParameter("tel");
    	address = multi.getParameter("address");
    	
    	//증명사진 가져오기
    	pic = multi.getFilesystemName("pic"); //물리명
    	orgpic = multi.getOriginalFileName("pic");//원본명
    	
    	//증명 문서들 가져오기(1개이상)
    	Enumeration e = multi.getFileNames();
    	while(e.hasMoreElements()){
    		//System.out.println(e.nextElement()); //input type="file"의 name 값
    		String temp = e.nextElement().toString();
    		
    		//증명사진 빼기
    		if(!temp.equals("pic")){
	    		doc.add(multi.getFilesystemName(temp));
    			orgdoc.add(multi.getOriginalFileName(temp));			
    		}
    		
    	}
    	
    }catch(Exception e){
    	System.out.println(e.toString());
    }
    
    
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
		<h1 class ="page-header">결과</h1>
		<table class="table table-bordered" style="width: 600px;">
				<tr>
					<th style="width:100px;">이름</th>
					<td style="width:200px;"><%=name %></td>
					<th style="width:100px;">생년월일</th>
					<td style="width:200px;"><%=birth %></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><%=tel %></td>
					<th>주소</th>
					<td><%=address %></td>
				</tr>
				<tr>
					<th>증명사진</th>
					<td colspan="3"><img src="<%=request.getContextPath()%>/example/files/<%=pic%>" alt="" /></td>
				</tr>
				<tr>
					<th>증명서류</th>

					<td colspan="3">
						<%
							for(int i=0; i<doc.size(); i++){
						%>								
							<div><a href="download.jsp?filename=<%=doc.get(i) %>&orgfilename=<%=orgdoc.get(i)%>"><%=orgdoc.get(i)%></a></div>
						<%	
							}
						%>
						<div id="filelist">
							<!-- <div><input type="file" name="doc1" class="form-control" /><span class="glyphicon glyphicon-remove"></span></div> -->
						</div>
						<input type="button" value="서류 추가하기" id="btnAdd" class="btn btn-default" /> 
					</td>
				</tr>
			</table>
		
	</div>
</body>
</html>