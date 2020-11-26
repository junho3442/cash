<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include> 
	<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	
	<div>
		<h1>카테고리별 수입차트</h1>
	</div>
	<div>
		<span>연도를 입력해주세요:</span>
		<input type="text" id="year">
		<button type="button" id="yearCategory">입력</button>
	</div>
	
	<div>
		<canvas id="myChart"></canvas>
	</div>
</body>
<script>
	$('#yearCategory').click(function(){
		$.ajax({
			url:'/cash/cashbookCategorySu/'+$('#year').val(),
			type:'get',
			success:function(data){
				var ctx = document.getElementById('myChart');
				var chart = new Chart(ctx,{
					type:'polarArea',
					data:{
						labels:['급여','용돈','금융이자'],
						datasets:[{
							label:data.year+'년 수입내역',
							backgroundColor:[
								  'rgba(153, 102, 255, 0.2)',
					              'rgba(255, 159, 64, 0.2)',
					              'rgba(255, 99, 132, 0.2)'
								],
							borderColor:[
								  'rgba(153, 102, 255, 1)',
					              'rgba(255, 159, 64, 1)',
					              'rgba(255, 99, 132, 0.2)'
								],
							data:[data.급여,data.용돈,data.금융이자]
						

							}]
						},
						options:{}
					});
				}
			
			});
		});
</script>
</html>