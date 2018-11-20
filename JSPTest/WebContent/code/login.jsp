<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Code</title>
<%@ include file="inc/asset.jsp"%>
<style>
</style>
<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<!-- template.jsp -->
	<div id="main">
		<jsp:include page="inc/header.jsp"></jsp:include>

		<section>
			<h1 class="page-header">Member</h1>
			<form action="loginok.jsp" method="post">
				<table class="table table-bordered"
					style="width: 250px; margin: 0 auto;">
					<tr>
						<th style="width: 100px;">ID</th>
						<td><input type="text" name="id" id="id" class="form-control" /></td>
					</tr>
					<tr>
						<th>PW</th>
						<td><input type="text" name="pw" id="pw" class="form-control" /></td>
					</tr>
				</table>

				<div style="width: 170px; margin: 0 auto; margin-top:10px;">
					<input type="button" value="돌아가기" required class="btn btn-default" onclick="history.back();" /> 
					<input type="submit" value='로그인' required class="btn btn-primary" />
				</div>
			</form>
		</section>
	</div>
</body>
</html>