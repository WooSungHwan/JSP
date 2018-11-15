<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
<jsp:include page="inc/asset.jsp"></jsp:include>
<style>

	#tbl {
		width: 600px;
		margin: 0px auto;
	}
	
	#tbl th {
		width: 120px;
		text-align: center;
		vertical-align: middle;
		background-color: #eee;
	}
	
	#tbl td {
		width: 480px;
	}
	
	.short { width: 100px; }
	.middle { width: 250px; }
	
	#btns {
		width: 600px;
		margin: 0px auto;
		margin-top: 20px;
		text-align:right;
	}

</style>
<script>
	
	$(document).ready(function() {
		
		dummy();
		
		//$("#name").click(function() {$(this).val("");});
		
	});
	
	function dummy() {
		
		$("#name").val("홍길동");
		$("#age").val("20");
		$("#tel").val("010-1234-5678");
		$("#address").val("서울시 강남구 역삼동");
		
	}
	
</script>
</head>
<body>
	<!-- add.jsp -->
	<div class="container">
		
		<jsp:include page="inc/header.jsp">
			<jsp:param value="Register" name="context"/>
		</jsp:include>
		
		
		<section id="main">
			
			<!-- 주소록 추가하기(폼 & 테이블) -->
			<form method="post" action="addok.jsp">
				
				<table id="tbl" class="table table-bordered">
					<tr>
						<th>이름</th>
						<td><input type="text" name="name" id="name" required class="form-control short"></td>
					</tr>
					<tr>
						<th>나이</th>
						<td><input type="number" name="age" id="age" min="7" max="120" required class="form-control short"></td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<select name="gender" id="gender" class="form-control short">
								<option value="m">남자</option>
								<option value="f">여자</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>전화</th>
						<td><input type="tel" name="tel" id="tel" required class="form-control middle"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" name="address" id="address" required class="form-control"></td>
					</tr>
				</table>
				<div id="btns">
					<input type="submit" value="등록하기" class="btn btn-primary">
					<input type="button" value="돌아가기" class="btn btn-default" onclick="location.href='list.jsp';">
				</div>
				
			</form>
			
		</section>
		
		<jsp:include page="inc/footer.jsp"></jsp:include>
		
	</div>
	
</body>
</html>













