<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매입매출전표</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function () {
		$("#btn_insert").click(function () {
			var trd_date = $("#trd_date").val();
			var trd_client = $("#trd_client").val();
			var trd_item = $("#trd_item").val();
			var trd_total = $("#trd_total").val();
			
			var bsnCheck = confirm('등록하시겠습니까?');
			if(bsnCheck == true){
				$.ajax({
					url : "trade_insert2.jsp",
					data : {
						trd_date : trd_date,
						trd_client : trd_client,
						trd_item : trd_item,
						trd_total : trd_total
					},
					success : function(func){
						window.location.href = 'trade.jsp';
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
					<th>날짜</th>
					<td><input type="date" id="trd_date" name="bsn_id" class="form-control"></td>
				</tr>
				<tr>
					<th>거래처(사업자번호)</th>
					<td><input type="text" id="trd_client" name="bsn_name" class="form-control"></td>
				</tr>
				<tr>
					<th>품목</th>
					<td><input type="text" id="trd_item" name="bsn_rep" class="form-control"></td>
				</tr>
				<tr>
					<th>합계</th>
					<td><input type="text" id="trd_total" name="bsn_addr" class="form-control"></td>
				</tr>
				<tr>
					<td colspan="2"><button type="button" class="btn btn-dark" id="btn_insert">등록하기</button></td>
				</tr>
			</table>
		</main>
	</div>
</body>
</html>