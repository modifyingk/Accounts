<%@page import="accounts_db.BsnTrdVO"%>
<%@page import="accounts_db.BsnTrdDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <!-- 숫자 세 자리 단위로 콤마 찍기 라이브러리 -->
<%
	BsnTrdDAO dao = new BsnTrdDAO();
	ArrayList<BsnTrdVO> list =  dao.list();
%>
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
					url : "trade_insert.jsp",
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
				<tr style="text-align: center;">
					<td>날짜</td>
					<td>거래처</td>
					<td>품목</td>
					<td>합계</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="date" id="trd_date" name="bsn_id" class="form-control"></td>
					<td><input type="text" id="trd_client" name="bsn_name" class="form-control" placeholder="거래처"></td>
					<td><input type="text" id="trd_item" name="bsn_rep" class="form-control" placeholder="품목"></td>
					<td><input type="text" id="trd_total" name="bsn_addr" class="form-control" placeholder="합계"></td>
					<td><button type="button" class="btn btn-dark" id="btn_insert">등록하기</button></td>
				</tr>
			</table>
			
			<table class="table table-hover" style="text-align: center;">
				<thead class="table-dark">
					<tr>
						<th>날짜</th>
						<th>거래처</th>
						<th>품목</th>
						<th>공급가액</th>
						<th>부가세</th>
						<th>합계</th>
					</tr>
				</thead>
				<tbody>
				<%
				for(int i=0; i<list.size(); i++){
				%>
					<tr>
						<td><%= list.get(i).getTrd_date() %></td>
						<td><%= list.get(i).getBsn_name() %></td>
						<td><%= list.get(i).getTrd_item() %></td>
						<td><fmt:formatNumber value="<%= (int) (list.get(i).getTrd_total() * 0.9) %>" pattern="#,###"/></td>
						<td><fmt:formatNumber value="<%= (int) (list.get(i).getTrd_total() * 0.1) %>" pattern="#,###"/></td>
						<td><fmt:formatNumber value="<%= list.get(i).getTrd_total() %>" pattern="#,###"/></td>
					</tr>
				<%	
				}
				%>
				</tbody>
			</table>
			
			<a href="main.jsp"><button class="btn btn-outline-dark">메인화면으로</button></a>
		</main>
	</div>
</body>
</html>