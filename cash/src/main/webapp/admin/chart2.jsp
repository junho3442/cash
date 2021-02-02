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
<div class="container text-center">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>   
	<div style="margin-top:30px;">
		<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
	</div>
	
<div>
<h1>월별 수입/지출 차트</h1>
</div>	
		<div>
			연도를 입력해 주세요:
			<input type="text" id="year">
		</div>
		
		<div>
			수입및 지출을 선택해 주세요:
			<select id="cashbookKind" style="margin-top:10px;">
				<option value="지출">지출</option>
				<option value="수입">수입</option>
			</select>
			<button type="button" class="btn btn-outline-info" id="sub">입력</button>
		</div>
		
		
	
	<div>
		<span id="monthResult" class="hint"></span>
	</div>
	
	<div>
		<canvas id="lineChart"> </canvas>
	</div>
	
	
	</div>
</body>	
<script>
$('#sub').click(function(){
	$.ajax({
		url:'/cash/cashbookLine/'+$('#year').val()+'/'+$('#cashbookKind').val(),
		type:'get',
		success: function(data){
				console.log(data)
			let html=`
			<table border="1">
				<tr>
					<th>january</th>
					<th>february</th>
					<th>march</th>
					<th>april</th>
					<th>may</th>
					<th>june</th>
					<th>july</th>
					<th>august</th>
					<th>september</th>
					<th>octber</th>
					<th>november</th>
					<th>december</th>
				</tr>

				<tr>
					<td>\${data.january}</td>
					<td>\${data.february}</td>
					<td>\${data.march}</td>
					<td>\${data.april}</td>
					<td>\${data.may}</td>
					<td>\${data.june}</td>
					<td>\${data.july}</td>
					<td>\${data.august}</td>
					<td>\${data.september}</td>
					<td>\${data.october}</td>
					<td>\${data.november}</td>
					<td>\${data.december}</td>
				</tr>
			</table>
			`;
				$('#monthResult').html(html);
			}
	});
});

$('#sub').click(function(){
	$.ajax({
		url:'/cash/cashbookLine/'+$('#year').val()+'/'+$('#cashbookKind').val(),
		type:'get',
		success:function(data){
			var ctx = document.getElementById('lineChart');
			var chart = new Chart(ctx,{
				type: 'line',

				data: {

					labels: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','11월','12월'],
						
					datasets: [{
						label:data.YEAR+'년 월'+data.cashbookKind,

						borderColor: 'rgb(255, 99, 132)',

						data:[data.january,data.february,data.march,data.april,data.may,data.june,data.july,data.august,data.september,data.october,data.november,data.december],
						}]
					},
				
				options: {}
				});
			}
		});
});
</script>	
		
</html>