<%@page import="accounts_db.BusinessVO"%>
<%@page import="accounts_db.BusinessDAO"%>
<%@page import="accounts_db.BsnTrdVO"%>
<%@page import="accounts_db.BsnTrdDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> <!-- 숫자 세 자리 단위로 콤마 찍기 라이브러리 -->
<%
	BsnTrdDAO dao = new BsnTrdDAO();
	ArrayList<BsnTrdVO> list =  dao.list();
	
	BusinessDAO dao2 = new BusinessDAO();
	ArrayList<BusinessVO> list2 = dao2.list();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매입매출전표</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
		
		$("#bsn_list tr").click(function() {
			var bsn_id_val = $(this).find("td:eq(0)").text();  // 클릭한 행의 사업자등록번호 값 bsn_id_val에 저장
			$("#trd_client").attr('value', bsn_id_val);
			$("#close_modal").click();
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
					<td colspan="2">거래처</td>
					<td>품목</td>
					<td>합계</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="date" id="trd_date" name="trd_date" class="form-control"></td>
					<td style="padding-right: 0;"><input type="text" id="trd_client" name="trd_client" class="form-control" placeholder="거래처"></td>
					<td style="padding-left: 0;"><button class="btn btn-outlint-dark" id="bsn_search" data-toggle="modal" data-target="#myModal"><i class="fi fi-rr-search"></i></button></td>
					<td><input type="text" id="trd_item" name="trd_item" class="form-control" placeholder="품목"></td>
					<td><input type="text" id="trd_total" name="trd_total" class="form-control" placeholder="합계"></td>
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
			
			<div class="modal" id="myModal">
   		 		<div class="modal-dialog">
      				<div class="modal-content">
      
        			<div class="modal-header">
         				<h4 class="modal-title">거래처 찾기</h4>
          				<button type="button" class="close" data-dismiss="modal">&times;</button>
        			</div>
        
        			<div class="modal-body">
        				<table class="table table-hover" id="bsn_list">
        					<tr>
        						<td>사업자 등록 번호</td>
        						<td>거래처명</td>
        						<td>대표자</td>
        					</tr>
          					<%
							for(int i=0; i<list.size(); i++){
							%>
							<tr>
								<td><%= list2.get(i).getBsn_id() %></td>
								<td><%= list2.get(i).getBsn_name() %></td>
								<td><%= list2.get(i).getBsn_rep() %></td>
							</tr>
							<%	
							}
							%>
        				</table>
        			</div>
        
        			<div class="modal-footer">
          				<button type="button" class="btn btn-dark" data-dismiss="modal" id="close_modal">Close</button>
        			</div>
        
      			</div>
    			</div>
  			</div>
		</main>
	</div>
</body>
</html>