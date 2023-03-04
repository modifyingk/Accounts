<%@page import="accounts_db.BusinessVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="accounts_db.BusinessDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BusinessDAO dao = new BusinessDAO();
	ArrayList<BusinessVO> list =  dao.list();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처</title>
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
			<a href="business_insert.jsp"><button class="btn btn-outline-dark">거래처 등록</button></a> <br> <br>
			
			<table class="table table-hover" style="text-align: center;">
				<thead class="table-dark">
					<tr>
						<th>사업자 등록 번호</th>
						<th>상호(법인명)</th>
						<th>성명(대표자)</th>
						<th>사업장 주소</th>
						<th>업태</th>
						<th>종목</th>
					</tr>
				</thead>
				<tbody>
				<%
				for(int i=0; i<list.size(); i++){
				%>
					<tr>
						<td><%= list.get(i).getBsn_id() %></td>
						<td><%= list.get(i).getBsn_name() %></td>
						<td><%= list.get(i).getBsn_rep() %></td>
						<td><%= list.get(i).getBsn_addr() %></td>
						<td><%= list.get(i).getBsn_indus() %></td>
						<td><%= list.get(i).getBsn_type() %></td>
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