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
					url : "business_insert.jsp",
					data : {
						bsn_id : bsn_id,
						bsn_name : bsn_name,
						bsn_rep : bsn_rep,
						bsn_addr : bsn_addr,
						bsn_indus : bsn_indus,
						bsn_type : bsn_type
					},
					success : function(func){
						/* alert('등록 완료!'); */
						window.location.href = 'business.jsp';
					}
				})
			}
		})
		
		$("#bsn_id").keydown(function(event) {
			var bsn_id = $("#bsn_id").val();
			
			if(event.keyCode != 8){
				if(bsn_id.length == 3){
					bsn_id = bsn_id = bsn_id + "-";
					$("#bsn_id").val(bsn_id);
				}
				if(bsn_id.length == 6){
					bsn_id = bsn_id = bsn_id + "-";
					$("#bsn_id").val(bsn_id);
				}
			}
		})
		
		$("#bsn_id").blur(function () {
			var bsn_id = $("#bsn_id").val();
			var pattern = /^[0-9]{3}-[0-9]{2}-[0-9]{5}$/;
			if(bsn_id.length > 0){
				if(!pattern.test($("#bsn_id").val())){
					alert('입력 형식이 올바르지 않습니다. 다시 입력해주세요.')
				}
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
				<tr style="text-align: center; bor">
					<td>사업자 등록 번호</td>
					<td>상호(법인명)</td>
					<td>성명(대표자)</td>
					<td>사업장 주소</td>
					<td>업태</td>
					<td>종목</td>
					<td></td>
				</tr>
				<tr>
					<td>
						<input type="text" id="bsn_id" name="bsn_id" class="form-control" maxlength="12" placeholder="사업자등록번호">
					</td>
					<td><input type="text" id="bsn_name" name="bsn_name" class="form-control" placeholder="상호(법인명)"></td>
					<td><input type="text" id="bsn_rep" name="bsn_rep" class="form-control" placeholder="성명(대표자)"></td>
					<td><input type="text" id="bsn_addr" name="bsn_addr" class="form-control" placeholder="사업장 주소"></td>
					<td><input type="text" id="bsn_indus" name="bsn_indus" class="form-control" placeholder="업태"></td>
					<td><input type="text" id="bsn_type" name="bsn_type" class="form-control" placeholder="종목"></td>
					<td><button type="button" class="btn btn-dark" id="btn_insert" style="width: 95px;">등록하기</button></td>
				</tr>
				<tr>
					
				</tr>
			</table>
			
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
			
			<a href="main.jsp"><button class="btn btn-outline-dark">메인화면으로</button></a>
		</main>
	</div>
</body>
</html>