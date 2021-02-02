<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Index</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="container text-center">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	
	<h1 style="margin-top:30px;">월별 가계부</h1>
	<!-- 다이어리 -->
	<div class="row" style="margin-top:100px;">
	<div class="border border-0 d-flex" style="margin-left: 115px;">	
		<div class="col-md-6">
			<p style="width:150%; white-space:nowrap;" class="bg-success text-white border">이번달 수입 <br/>${sumIn }원</p>
		</div>
		<div class="col-md-6">
			<p style="width:150%; white-space:nowrap;" class="bg-danger text-white border">이번달 지출 <br/>${sumOut}원</p>
		</div>
	</div>	
	</div>
	
	<h3>
		<a href="${pageContext.request.contextPath}/admin/cashbookByMonth/${currentYear}/${currentMonth-1}">[이전달]</a>
		${currentYear}년 ${currentMonth} 월
		<a href="${pageContext.request.contextPath}/admin/cashbookByMonth/${currentYear}/${currentMonth+1}">[다음달]</a>
	</h3>
	
	<div>
		<table border="1" style="table-layout:fixed; width:80%; text-align:center; margin-left: auto; margin-right: auto;">
			<thead>
				<tr>
					<th class="sunday">일</th>
					<th>월</th>
					<th>화</th>
					<th>수</th>
					<th>목</th>
					<th>금</th>
					<th>토</th>
				</tr>
			</thead>
			<tbody>
				<tr height="30">
					<c:forEach var="i" begin="1" end="${lastDay+(firstDayOfWeek-1)}" step="1">
						<c:if test="${i-(firstDayOfWeek-1) < 1}">
							<td>&nbsp;</td>
						</c:if>
						<c:if test="${i-(firstDayOfWeek-1) > 0}">
							<td style="word-break:break-all;">
								<div>
									<a href="${pageContext.request.contextPath}/admin/cashbookByDay/now/${currentYear}/${currentMonth}/${i-(firstDayOfWeek-1)}">${i-(firstDayOfWeek-1)}</a>
								</div> 
								<c:forEach var="c" items="${cashList}">
									<c:if test="${i-(firstDayOfWeek-1)==c.dday}">
										<c:if test="${c.cashbookKind=='수입' }">
											<div style="white-space:nowrap;" class="bg-success text-white border">수입: ${c.cashPrice}원</div>
										</c:if>
										<c:if test="${c.cashbookKind=='지출' }">
											<div style="white-space:nowrap;" class="bg-danger text-white border">지출: ${c.cashPrice }원</div>
										</c:if>
									</c:if>
								</c:forEach>
							</td>
						</c:if>
						<c:if test="${i%7 == 0}">
							<tr></tr>
						</c:if>
					</c:forEach>
					
					<c:if test="${(lastDay+(firstDayOfWeek-1)) % 7 != 0}">
						<c:forEach begin="1" end="${7- ((lastDay+(firstDayOfWeek-1)) % 7)}" step="1">
							<td>&nbsp;</td>
						</c:forEach>
					</c:if>
				</tr>
			</tbody>
		</table>
		<p style="font-weight:bold;">(날짜(숫자)클릭시 수입/지출 내용을 입력및 수정/삭제 할 수 있습니다)</p>
	</div>
</div>		
</body>
</html>