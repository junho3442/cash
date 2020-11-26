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
		<h1>카테고리별 지출차트</h1>
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
		url:'/cash/cashbookCategory/'+$('#year').val(),
		type:'get',
		success:function(data){
			var ctx = document.getElementById('myChart');
			var chart = new Chart(ctx,{
				type :'horizontalBar', //차트 종류 타입
				
			data:{ //차트에 사용할 데이터 
					
					labels:['관광','통신','주거','의료','식비','생활','문화','교통','교육','회비'], 
				
					datasets: [{ 
					label: '카테고리별 지출내역', 
					backgroundColor: [ 
						'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)',
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)'
		                ],
		                
					borderColor:[
						'rgba(255, 99, 132, 1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)',
		                'rgba(255, 99, 132, 0.2)',
		                'rgba(54, 162, 235, 0.2)',
		                'rgba(255, 206, 86, 0.2)',
		                'rgba(75, 192, 192, 0.2)',
		                'rgba(153, 102, 255, 0.2)',
		                'rgba(255, 159, 64, 0.2)'
					],
						data:[data.관광,data.통신,data.주거,data.의료,data.식비,data.생활,data.문화,data.교통,data.교육,data.회비], //데이터 수치 (막대 높이)
						borderWidth: 1
								}]
				},
				
				options: {}
			});
		}
	});
});	
</script>

</html>