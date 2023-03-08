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
		/* 등록하기 버튼 눌렀을 때 */
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
		/* 모달 창에서 수정하기 버튼 눌렀을 떄 */
		$("#btn_update").click(function () {
			var trd_id = $("#modal_trd_id").val();
			var trd_date = $("#modal_trd_date").val();
			var trd_client = $("#modal_trd_client").val();
			var trd_item = $("#modal_trd_item").val();
			var trd_total = $("#modal_trd_total").val();
			
			var bsnCheck = confirm('수정하시겠습니까?');
			if(bsnCheck == true){
				$.ajax({
					url : "trade_update.jsp",
					data : {
						trd_id : trd_id,
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
		/* 모달 창에서 삭제하기 버튼 눌렀을 떄 */
		$("#btn_delete").click(function () {
			var trd_id = $("#modal_trd_id").val();
			
			var bsnCheck = confirm('정말로 삭제하시겠습니까?');
			if(bsnCheck == true){
				$.ajax({
					url : "trade_delete.jsp",
					data : {
						trd_id : trd_id,
					},
					success : function(func){
						window.location.href = 'trade.jsp';
					}
				})
			}
		})
		
		/* 거래처 검색 테이블 */
		$("#bsn_list tr").click(function() { // 거래처 리스트 중
			var trd_client_val = $(this).find("td:eq(0)").text(); // 클릭한 행의 사업자등록번호 값 trd_client_val에 저장
			var bsn_name_val = $(this).find("td:eq(1)").text(); // 클릭한 행의 사업자등록번호 값 bsn_name_val에 저장
			
			$("#trd_client").attr('value', trd_client_val);
			$("#bsn_name").attr('value', bsn_name_val);

			$("#close_modal").click();
		})
		
		/* 거래처 검색 테이블2 (거래내역 수정 테이블에서 거래처 검색했을 경우) */
		$("#bsn_list2 tr").click(function() { // 거래처 리스트 중
			var trd_client_val = $(this).find("td:eq(0)").text(); // 클릭한 행의 사업자등록번호 값 trd_client_val에 저장
			var bsn_name_val = $(this).find("td:eq(1)").text(); // 클릭한 행의 사업자등록번호 값 bsn_name_val에 저장
			
			$("#modal_trd_client").attr('value', trd_client_val);
			$("#modal_bsn_name").attr('value', bsn_name_val);
			
			$("#close_modal2").click();
		})
		
		/* 거래내역 수정 테이블 */
		$("#trd_list tr").click(function() { // 거래내역 리스트 중
			var modal_trd_id = $(this).find("td:eq(0)").text();  // 클릭한 행의 거래ID 값 modal_trd_id에 저장
			var modal_trd_date = $(this).find("td:eq(1)").text(); 
			var modal_trd_client = $(this).find("td:eq(2)").text();  
			var modal_bsn_name = $(this).find("td:eq(3)").text();  
			var modal_trd_item = $(this).find("td:eq(4)").text();  
			var modal_trd_total = $(this).find("td:eq(7)").text();
			
			$("#modal_trd_id").attr('value', modal_trd_id);
			$("#modal_trd_date").attr('value', modal_trd_date);
			$("#modal_trd_client").attr('value', modal_trd_client);
			$("#modal_bsn_name").attr('value', modal_bsn_name);
			$("#modal_trd_item").attr('value', modal_trd_item);
			$("#modal_trd_total").attr('value', modal_trd_total);
			
			$("#trd_update_modal").modal("show");
		})
		
		/* 000 클릭 시 */
		$("#thous").click(function() {
			var trd_total = parseInt($("#trd_total").val()) * 1000;
			$("#trd_total").val(trd_total);
		})
	})
</script>
<body>
	<div class="container">
		<header>
			<jsp:include page="title.jsp"></jsp:include>
		</header>

		<main>
			<table class="table">
				<tr style="text-align: center;">
					<td>날짜</td>
					<td style="display: none;">사업자등록번호</td>
					<td colspan="2">거래처</td>
					<td>품목</td>
					<td colspan="2">합계</td>
					<td></td>
				</tr>
				<tr>
					<td><input type="date" id="trd_date" name="trd_date" class="form-control"></td>
					<td style="display: none;"><input type="text" id="trd_client" class="form-control" placeholder="사업자등록번호"></td>
					<td style="padding-right: 0;"><input type="text" id="bsn_name" class="form-control" placeholder="거래처"></td>
					<td style="padding-left: 0;"><button class="btn btn-outline-dark" data-toggle="modal" data-target="#bsn_find_modal"><i class="fi fi-rr-search"></i></button></td>
					<td><input type="text" id="trd_item" class="form-control" placeholder="품목"></td>
					<td style="padding-right: 0;"><input type="text" id="trd_total" class="form-control" placeholder="합계"></td>
					<td style="padding-left: 0;"><button class="btn btn-outline-dark" id="thous">000</button></td>
					<td><button type="button" class="btn btn-dark" id="btn_insert">등록하기</button></td>
				</tr>
			</table>
			
			<table class="table table-hover" style="text-align: center;" id="trd_list">
				<thead class="table-dark">
					<tr>
						<th>날짜</th>
						<th style="display: none;">사업자등록번호</th>
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
						<td style="display: none;"><%= list.get(i).getTrd_id() %></td>
						<td><%= list.get(i).getTrd_date() %></td>
						<td style="display: none;"><%= list.get(i).getTrd_client() %></td>
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
			
			<!-- 거래내역 수정 modal -->
  			<div class="modal" id="trd_update_modal">
   		 		<div class="modal-dialog modal-dialog-scrollable">
      				<div class="modal-content">
	        			<div class="modal-header">
         					<h4 class="modal-title">거래내역 수정</h4>
          					<button type="button" class="close" data-dismiss="modal">&times;</button>
        				</div>
        	
        				<div class="modal-body">        				
        					<table class="table table-hover">
        						<tr style="display: none;">
        							<th>ID</th>
        							<td colspan="2"><input type="text" id="modal_trd_id" class="form-control"></td>
        						</tr>
        						<tr>
        							<th style="border-top: none;">날짜</th>
        							<td colspan="2" style="border-top: none;"><input type="date" id="modal_trd_date" class="form-control"></td>
        						</tr>
        						<tr>
        							<th style="display: none;">사업자등록번호</th>
        							<td colspan="2" style="display: none;"><input type="text" id="modal_trd_client" class="form-control"></td>
        						</tr>
        						<tr>
        							<th>거래처</th>
        							<td style="padding-right: 0;"><input type="text" id="modal_bsn_name" class="form-control"></td>
        							<td style="padding-left: 0; padding-right: 0"><button class="btn btn-outline-dark" data-toggle="modal" data-target="#bsn_find_modal2"><i class="fi fi-rr-search"></i></button></td>
        						</tr>
        						<tr>
        							<th>품목</th>
        							<td colspan="2"><input type="text" id="modal_trd_item" class="form-control"></td>
        						</tr>
        						<tr>
        							<th>합계</th>
        							<td colspan="2"><input type="text" id="modal_trd_total" class="form-control"></td>
        						</tr>
          						
        					</table>
        				</div>
        
        				<div class="modal-footer">
          					<button type="button" class="btn btn-dark" id="btn_update">수정</button>
          					<button type="button" class="btn btn-dark" id="btn_delete">삭제</button>
        				</div>
      				</div>
    			</div>
  			</div>
  			
			<!-- 거래처 찾기 modal -->
			<div class="modal" id="bsn_find_modal">
   		 		<div class="modal-dialog modal-dialog-scrollable">
      				<div class="modal-content">
	        			<div class="modal-header">
         					<h4 class="modal-title">거래처 찾기</h4>
          					<button type="button" class="close" data-dismiss="modal">&times;</button>
        				</div>
        	
        				<div class="modal-body">
        					<table class="table">
        						<tr>
        							<td style="border-top: none;">거래처명</td>
        							<td style="border-top: none;"><input type="text" class="form-control"></td>
        							<td style="border-top: none;"><button class="btn btn-outlint-dark"><i class="fi fi-rr-search"></i></button></td>
        						</tr>
        					</table>
        				
        					<table class="table table-hover" id="bsn_list">
        						<tr>
        							<th>사업자 등록 번호</th>
        							<th>거래처명</th>
        							<th>대표자</th>
        						</tr>
          						<%
								for(int i=0; i<list2.size(); i++){
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
          					<button type="button" class="btn btn-dark" data-dismiss="modal" id="close_modal">닫기</button>
        				</div>
      				</div>
    			</div>
  			</div>
  			
  			<!-- 거래처 찾기 modal2 -->
			<div class="modal" id="bsn_find_modal2">
   		 		<div class="modal-dialog modal-dialog-scrollable">
      				<div class="modal-content">
	        			<div class="modal-header">
         					<h4 class="modal-title">거래처 찾기</h4>
          					<button type="button" class="close" data-dismiss="modal">&times;</button>
        				</div>
        	
        				<div class="modal-body">
        					<table class="table">
        						<tr>
        							<td style="border-top: none;">거래처명</td>
        							<td style="border-top: none;"><input type="text" class="form-control"></td>
        							<td style="border-top: none;"><button class="btn btn-outlint-dark"><i class="fi fi-rr-search"></i></button></td>
        						</tr>
        					</table>
        				
        					<table class="table table-hover" id="bsn_list2">
        						<tr>
        							<th>사업자 등록 번호</th>
        							<th>거래처명</th>
        							<th>대표자</th>
        						</tr>
          						<%
								for(int i=0; i<list2.size(); i++){
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
          					<button type="button" class="btn btn-dark" data-dismiss="modal" id="close_modal2">닫기</button>
        				</div>
      				</div>
    			</div>
  			</div>
		</main>
	</div>
</body>
</html>