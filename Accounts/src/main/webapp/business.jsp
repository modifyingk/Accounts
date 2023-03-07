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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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
			/* 입력 형식 확인 (xxx-xx-xxxxx 형식 및 숫자로 구성되었는가 확인)*/
			var bsn_id = $("#bsn_id").val();
			var pattern = /^[0-9]{3}-[0-9]{2}-[0-9]{5}$/;
			if(bsn_id.length > 0){
				
				if(!pattern.test($("#bsn_id").val())){
					alert('입력 형식이 올바르지 않습니다. 다시 입력해주세요.')
					
				} else{ // 입력 형식이 올바를 경우, 국세청에 등록된 사업자등록번호인지 확인
					var find_id = bsn_id.replaceAll("-", "");
					var data = {
						"b_no": [find_id] // 사업자번호 "xxxxxxx" 로 조회 시,
					}; 
						   
					$.ajax({
						url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=[서비스키값]",  // serviceKey 값을 xxxxxx에 입력
						type: "POST",
						data: JSON.stringify(data), // json 을 string으로 변환하여 전송
					  	dataType: "JSON",
					  	contentType: "application/json",
					  	accept: "application/json",
					  	success: function(result) {
							console.log(result);
							if(result.data[0].tax_type == "국세청에 등록되지 않은 사업자등록번호입니다."){
								$("#bsn_id_check").html(result.data[0].tax_type);
							} else{
								$("#bsn_id_check").html('');
							}
					  	},
						error: function(result) {
							console.log(result.responseText); //responseText의 에러메세지 확인
						}
					});
				}
			}
		})
		
		/* 거래처 수정 테이블 */
		$("#bsn_list tr").click(function() { // 거래내역 리스트 중
			var modal_bsn_id = $(this).find("td:eq(0)").text();  // 클릭한 행의 거래ID 값 modal_trd_id에 저장
			var modal_bsn_name = $(this).find("td:eq(1)").text(); 
			var modal_bsn_rep = $(this).find("td:eq(2)").text(); 
			var modal_bsn_addr = $(this).find("td:eq(3)").text(); 
			var modal_bsn_indus = $(this).find("td:eq(4)").text(); 
			var modal_bsn_type = $(this).find("td:eq(5)").text(); 
			
			$("#modal_bsn_id").attr('value', modal_bsn_id);
			$("#modal_bsn_name").attr('value', modal_bsn_name);
			$("#modal_bsn_rep").attr('value', modal_bsn_rep);
			$("#modal_bsn_addr").attr('value', modal_bsn_addr);
			$("#modal_bsn_indus").attr('value', modal_bsn_indus);
			$("#modal_bsn_type").attr('value', modal_bsn_type);
			
			$("#bsn_update_modal").modal("show");
		})
		
		/* 모달 창에서 수정하기 버튼 눌렀을 떄 */
		$("#btn_update").click(function () {
			var bsn_id = $("#modal_bsn_id").val();
			var bsn_name = $("#modal_bsn_name").val();
			var bsn_rep = $("#modal_bsn_rep").val();
			var bsn_addr = $("#modal_bsn_addr").val();
			var bsn_indus = $("#modal_bsn_indus").val();
			var bsn_type = $("#modal_bsn_type").val();
			
			var bsnCheck = confirm('수정하시겠습니까?');
			if(bsnCheck == true){
				$.ajax({
					url : "business_update.jsp",
					data : {
						bsn_id : bsn_id,
						bsn_name : bsn_name,
						bsn_rep : bsn_rep,
						bsn_addr : bsn_addr,
						bsn_indus : bsn_indus,
						bsn_type : bsn_type
					},
					success : function(func){
						window.location.href = 'business.jsp';
					}
				})
			}
		})
		
		/* 모달 창에서 삭제하기 버튼 눌렀을 떄 */
		$("#btn_delete").click(function () {
			var bsn_id = $("#modal_bsn_id").val();
			
			var bsnCheck = confirm('거래처를 삭제하시면 관련된 거래내역 데이터도 모두 삭제됩니다 !!!!!!!!! 정말로 삭제하시겠습니까?');
			if(bsnCheck == true){
				$.ajax({
					url : "business_delete.jsp",
					data : {
						bsn_id : bsn_id,
					},
					success : function(func){
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

		<main>
			<table class="table">
				<tr>
					<td colspan="3" style="height: 50px;"><div id="bsn_id_check" style="color: red;"></div></td>
					<th colspan="2">거래처 등록</th>
					<td colspan="2"></td>
				</tr>
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
			</table>
			
			<table class="table table-hover" style="text-align: center;" id="bsn_list">
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
			
			<!-- 거래처 수정 modal -->
  			<div class="modal" id="bsn_update_modal">
   		 		<div class="modal-dialog modal-dialog-scrollable">
      				<div class="modal-content">
	        			<div class="modal-header">
         					<h4 class="modal-title">거래처 수정</h4>
          					<button type="button" class="close" data-dismiss="modal">&times;</button>
        				</div>
        	
        				<div class="modal-body">        				
        					<table class="table table-hover">
        						<tr>
        							<th style="border-top: none;">사업자 등록 번호</th>
        							<td style="border-top: none;"><input type="text" id="modal_bsn_id" class="form-control" readonly="readonly"></td>
        						</tr>
        						<tr>
        							<th>상호(법인명)</th>
        							<td><input type="text" id="modal_bsn_name" class="form-control"></td>
        						</tr>
        						<tr>
        							<th>성명(대표자)</th>
        							<td><input type="text" id="modal_bsn_rep" class="form-control"></td>
        						</tr>
        						<tr>
        							<th>사업장 주소</th>
        							<td><input type="text" id="modal_bsn_addr" class="form-control"></td>
        						</tr>
        						<tr>
        							<th>업태</th>
        							<td><input type="text" id="modal_bsn_indus" class="form-control"></td>
        						</tr>
        						<tr>
        							<th>업태</th>
        							<td><input type="text" id="modal_bsn_type" class="form-control"></td>
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
		</main>
	</div>
</body>
</html>