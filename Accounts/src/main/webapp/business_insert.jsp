<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function () {
		$("#btn_insert").click(function () {
			var bsn_id = $("#bsn_id").val();
			var bsn_name = $("#bsn_name").val();
			var bsn_rep = $("#bsn_rep").val();
			var bsn_addr = $("#bsn_addr").val();
			var bsn_indus = $("#bsn_indus").val();
			var bsn_type = $("#bsn_type").val();
			
			var bsnCheck = confirm('거래처를 등록하시겠습니까?');
			if(bsnCheck == true){
				$.ajax({
					url : "business_insert2.jsp",
					data : {
						bsn_id : bsn_id,
						bsn_name : bsn_name,
						bsn_rep : bsn_rep,
						bsn_addr : bsn_addr,
						bsn_indus : bsn_indus,
						bsn_type : bsn_type
					},
					success : function(func){
						alert('등록 완료!');
						window.location.href = 'business.jsp';
					}
				})
			}
		})
	})
</script>
<body>
	<div class="container">
		<header>
			<jsp:include page="title.jsp"></jsp:include>
		</header>

		<nav>
			<jsp:include page="top.jsp"></jsp:include>
		</nav>

		<main>
			<table class="table">
				<tr>
					<th>사업자 등록 번호</th>
					<td><input type="text" id="bsn_id" name="bsn_id" class="form-control"></td>
				</tr>
				<tr>
					<th>상호(법인명)</th>
					<td><input type="text" id="bsn_name" name="bsn_name" class="form-control"></td>
				</tr>
				<tr>
					<th>성명(대표자)</th>
					<td><input type="text" id="bsn_rep" name="bsn_rep" class="form-control"></td>
				</tr>
				<tr>
					<th>사업장 주소</th>
					<td><input type="text" id="bsn_addr" name="bsn_addr" class="form-control"></td>
				</tr>
				<tr>
					<th>업태</th>
					<td><input type="text" id="bsn_indus" name="bsn_indus" class="form-control"></td>
				</tr>
				<tr>
					<th>종목</th>
					<td><input type="text" id="bsn_type" name="bsn_type" class="form-control"></td>
				</tr>
				<tr>
					<td colspan="2"><button type="button" class="btn btn-dark" id="btn_insert">등록하기</button></td>
				</tr>
			</table>
		</main>
	</div>
</body>
</html>