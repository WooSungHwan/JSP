<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

//혹시 인증받지 않은 사용자가 URL을 직접 요청해서 접근하는 경우 ->(북마크, 타이핑)

if(session.getAttribute("id")==null){
	//미인증자 접근
	
	
	//response.sendRedirect("../index.jsp");

%>
	<script>
		alert("로그인을 하고 이용해주시기 바랍니다.");
		location.href="../index.jsp";
	</script>
<%

	//(*************)out.close();//여태 작업했던 HTML 페이지를 클라이언트에게 보내고 작업중단.
	out.close();
}
%>
    

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../inc/asset.jsp" %>
<style>

</style>
<script>
	$(document).ready(function(){
		
	});
</script>
</head>
<body>
	
	<div class="container">
		<h1 class ="page-header">회원 전용 페이지</h1>
		
		<p>회원만볼수있는 중요한 내용</p>
	</div>
</body>
</html>