<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회계장부</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-thin-straight/css/uicons-thin-straight.css'>
</head>
<style>
	.click {
		width: 150px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function () {
		$(".card").mouseover(function () { // card class에 마우스 갖다대면
			$(this).css('cursor', 'pointer'); // 커서 스타일 변경
			$(this).css('background', '#ececec'); // 배경색 변경
		})
		$(".card").mouseout(function () { // card class에서 마우스 떼면
			$(this).css('background', 'white');
		})
		
		/* 매입매출전표 카드 클릭 시 해당 페이지로 이동 */
		$("#trade").click(function () {
			window.location.href = 'trade.jsp';
		})
		/* 거래처 카드 클릭 시 해당 페이지로 이동 */
		$("#business").click(function () {
			window.location.href = 'business.jsp';
		})
		/* 세금계산서 카드 클릭 시 해당 페이지로 이동 */
		$("#tax").click(function () {
			window.location.href = '';
		})
	})
</script>
<body>
	<div class="container">
		<header>
			<jsp:include page="title.jsp"></jsp:include>
		</header>
		
		<main>
			<p>안녕하세요! 원하시는 메뉴를 선택해주세요</p> <br>

			<div style="text-align: center;">
				<div class="card" id="trade" style="width:300px; float: left; margin: 0 30px 0 30px; padding: 50px;">
    				<img class="card-img-top" src="img/trade.png" alt="매입매출전표" style="width:100%">
   					<div class="card-body">
   						<br>
      					<a href="trade.jsp" class="btn btn-dark click">매입매출전표</a>
      					<br><br>
      					<p class="card-text">전체 거래내역<br>월별, 거래처별 확인</p>
    				</div>
  				</div>
			
				<div class="card" id="business" style="width:300px; float: left; margin: 0 30px 0 30px; padding: 50px;">
    				<img class="card-img-top" src="img/business.png" alt="거래처" style="width:100%">
   					<div class="card-body">
      					<br>
      					<a href="business.jsp" class="btn btn-dark click">거래처</a>
      					<br><br>
      					<p class="card-text"><br>거래처 정보 확인</p>
    				</div>
  				</div>
			
				<div class="card" id="tax" style="width:300px; float: left; margin: 0 30px 0 30px; padding: 50px;">
    				<img class="card-img-top" src="img/receipt.png" alt="세금계산서" style="width:100%">
   					<div class="card-body">
      					<br>
      					<a href="#" class="btn btn-dark click">세금계산서</a>
      					<br><br>
      					<p class="card-text"><br>세금계산서 관리</p>
    				</div>
  				</div>
			</div>
		</main>
	</div>
</body>
</html>