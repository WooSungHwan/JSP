<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//1. 제목, 이름 받기 > request.getParameter()
//2. 첨부파일 받기   > 별도 조치 (***) > 첨부파일 처리 : 웹 작업(X), 로컬 작업(O)

//첨부 파일 저장 경로
// - 웹 경로 : "./files" -> 자바 경로 : ".\\files"
// - 웹 경로 : "/JSPTest/example/files" -> (첨부파일처리) -> 자바경로 : "C:\Class\WebServer\JSPTest\WebContent\example\files"

//첨부파일 저장 경로
//String path = ".\\files";
//String path = "C:\Class\WebServer\JSPTest\WebContent\example\files"; 잘안될것임
//본론

String path = application.getRealPath("./example/files"); // 웹에서 쓰던 상대주소를 적으면 절대주소(로컬: C:\\같은)로 바꿔준다.
//System.out.println(path);

//업로드 파일의 최대 크기 지정
// - 단위 : 바이트
// - 가능한 작게
int size = 100 * 1024 * 1024; //100MB

//변수
String subject=""; //제목
String name = ""; //이름
String filename =""; //첨부파일명
String orgfilename =""; //첨부파일명

//subject= request.getParameter("subject");
//System.out.println(subject);  -> null 폼태그 enctype ="multipart/form-data" 로 지정하면 request.getParameter() 가 동작하지 않는다!!!







try{
	//request -> MultipartRequest(cos.jar) 
	MultipartRequest multi = new MultipartRequest(
			request,//기존 request 객체
			path,	//파일 업로드 폴더의 경로
			size,	//업로드 최대크기
			"UTF-8",//현재 인코딩 방식
			new DefaultFileRenamePolicy() //중복 파일명 관리(처리)
			); 
	
	//업무
	// -> 확보 데이터 : 제목, 이름, 첨부파일(실제파일),첨부파일명(원본명),첨부파일명(저장명)

	//일반 데이터(텍스트)
	subject = multi.getParameter("subject");
	name = multi.getParameter("name");
	
	//첨부파일(실제 파일) : 완료
	//첨부파일명(원본,물리)
	//<input type="file"> 의 이름(name속성) 반환
	Enumeration e = multi.getFileNames();
	
	while(e.hasMoreElements()){
		System.out.println(e.nextElement());
	}
	
	filename=multi.getFilesystemName("attach1");
	orgfilename=multi.getOriginalFileName("attach1");
	System.out.println(filename); //물리 파일명
	System.out.println(orgfilename); //원본 파일명
	System.out.println(subject);
	System.out.println(name);
	System.out.println();
	
	
	//확보데이터 -> 업무처리 (DB저장)
	// - 첨부파일을 오라클에 저장 ?? ->XXXXX
	// - 이진데이터(바이너리 데이터, 첨부파일)를 오라클의 테이블 안에 직접저장하나요??? XXXXXX
			// >> 할수 있다 but 안해요.. (인코딩,디코딩에 시간이 걸린다.)
			// >> 첨부파일 폴더 저장(안전하게..)
			// >> 데이터 베이스에 파일명만 저장
	
	
	
	
	
	
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
		<h1 class ="page-header">파일 업로드 결과</h1>
		
		<div>제목 : <%=subject %></div>
		<div>이름 : <%=name %></div>
		<div>파일명(서버저장물리) : <%=filename %></div>
		<div>파일명(원본) : <%=orgfilename %></div>
		<hr />
		<div>다운로드 : <a href="files/<%=filename%>"><%=orgfilename %></a> </div>
		
		<div>다운로드 : <a href="download.jsp?filename=<%=filename%>&orgfilename=<%=orgfilename %>"><%=orgfilename %></a> </div>
		
	</div>
</body>
</html>