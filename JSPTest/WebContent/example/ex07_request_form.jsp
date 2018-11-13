<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<h1 class="page-header">버튼 만들기</h1>
		
		<form action="ex07_request_process.jsp" method="post">
			<table class="table table-bordered" style="width:400px;">
				<tr>
					<th style="width:100px;">버튼 너비</th>
					<td style="width:300px;">
						<input type="number" class="form-control" 
						name="width" min ="100" max="1000" step="10" value="100"/>
					</td>
				</tr>
				<tr>
					<th style="width:100px;">버튼 높이</th>
					<td style="width:300px;">
						<input type="number" class="form-control" 
						name="height" min ="25" max="500" step="5" value="25" placeholder="px"/>
					</td>
				</tr>
				<tr>
					<th>버튼 텍스트</th>
					<td><input type="text" name="txt" class="form-control" value="버튼" /></td>
				</tr>
				<tr>
					<th>글자색</th>
					<td><input type="color" name="forecolor" 
						style="width:50px;" value="#333333" /></td>
				</tr>
				<tr>
					<th>배경색</th>
					<td><input type="color" name="backgroundColor" 
						style="width:50px;" value="#ffffff" /></td>
				</tr>
				<tr>
					<th>글자 크기</th>
					<td><input type="number"name ="fontsize" min="10" max="300" value="10"
					class="font-control"/></td>
				</tr>
				<tr>
					<th>버튼 개수</th>
					<td><input type="number" name="count" min="1" max="100" value="1"
					class="form-control" /></td>
				</tr>
				<tr>
					<th>테두리</th>
					<td>
						<select name="isborder" class="form-control">
							<option value="y">보이기</option>
							<option value="n">감추기</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>마진</th>
					<td><input type="range" name="margin" min="0" max="200"
					value="0" class="form-control" style="padding:0;" /></td>
				</tr>
				
			</table>
			
			<input type="submit" value="만들기" class="btn btn-default" />
		
		</form>
		
		
	</div>
	
	
	
	
	
</body>
</html>