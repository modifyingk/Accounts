<%@page import="accounts_db.TradeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="accounts_db.TradeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	TradeDAO dao = new TradeDAO();
	ArrayList<TradeVO> list =  dao.list();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매입매출전표</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<header>
			<jsp:include page="title.jsp"></jsp:include>
		</header>

		<nav>
			<jsp:include page="top.jsp"></jsp:include>
		</nav>

		<main>
			<a href="trade_insert.jsp"><button class="btn btn-outline-dark">거래내역 등록</button></a> <br> <br>
			
			<table class="table table-hover" style="text-align: center;">
				<thead class="table-dark">
					<tr>
						<th>날짜</th>
						<th>거래처</th>
						<th>품목</th>
						<th>합계</th>
					</tr>
				</thead>
				<tbody>
				<%
				for(int i=0; i<list.size(); i++){
				%>
					<tr>
						<td><%= list.get(i).getTrd_date() %></td>
						<td><%= list.get(i).getTrd_client() %></td>
						<td><%= list.get(i).getTrd_item() %></td>
						<td><%= list.get(i).getTrd_total() %></td>
					</tr>
				<%	
				}
				%>
				</tbody>
			</table>
		</main>
	</div>
</body>
</html>