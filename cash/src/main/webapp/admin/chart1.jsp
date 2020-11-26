<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
			<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		   
			<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
		
	<!-- 차트 -->
	
	<h1>연도별 수입/지출 차트</h1>
	<div>
		<select id="cashbookKind">
			<option value="지출">지출</option>
			<option value="수입">수입</option>
		</select>
		<button type="button" id="cashbookCategory">입력</button>
	</div>
		
		
	
	
	<div>
		<span id="totalOfMonthByYearTableResult" ></span>
	</div>
	
	<div>
		<canvas id="pieChart"></canvas>
	</div>
</body>	
	<!-- 테이블 -->
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>

$('#cashbookCategory').click(function(){
	$.ajax({
		url:'/cash/cashbookTable/'+$('#cashbookKind').val(),
		type:'get',
		success: function(data){		
			let html=`
				<table border="1">	
					<thead>	
						<tr>
							<th>\${data.내역}</th>
							<th>2018</th>
							<th>2019</th>
							<th>2020</th>	
						</tr>
					</thead>
					
					<tbody>		
						<tr>
							<td>\${data.내역}</td>
							<td>\${data.one}</td>
							<td>\${data.two}</td>
							<td>\${data.three}</td>
						</tr>
					</tbody>
							
				</table>
			`;
			console.log(data);
			$('#totalOfMonthByYearTableResult').html(html);
		} 
		});
	});

	$('#cashbookCategory').click(function(){ //버튼을 누르면
		$.ajax({
			url:'/cash/cashbookTable/'+$('#cashbookKind').val(),
			type:'get',
			success:function(data){
				let pieCtx = $('#pieChart');
				let pieChart = new Chart(pieCtx,{
					type:'pie',
					data: {
						datasets: [{
								label:data.수입,
								data:[data.one,data.two,data.three],
					      
						backgroundColor:[
							'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(153, 102, 255, 0.2)'
									],
						
						borderColor:[
							'rgba(255, 99, 132, 1)',
						    'rgba(54, 162, 235, 1)',
						    'rgba(153, 102, 255, 0.2)'
									],
						}],
						labels:['2018','2019','2020']
					},
					options: {}
				});
			}
		});
	});
</script>

</html>