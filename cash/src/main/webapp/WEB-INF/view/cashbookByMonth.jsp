<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Index</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h3>공지사항</h3>
	<table border="1" class="table table-dark table-hover">
		<thead>
			<tr>
				<th>notice_id</th>
				<th>notice_title</th>
				<th>notice_date</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="notice" items="${notice}">
				<tr>
					<td>${notice.noticeId}</td>
					<td>${notice.noticeTitle}</td>
					<td>${notice.noticeDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 다이어리 -->
	<div>
		<p class="bg-success text-white">이번달 수입 합계 :${sumIn }</p>
	</div>
	<div>
		<p class="bg-danger text-white">이번달 지출 합계 :${sumOut}</p>
	</div>
	
	<h3>
		<a href="${pageContext.request.contextPath}/admin/cashbookByMonth/${currentYear}/${currentMonth-1}">[이전달]</a>
		${currentYear}년 ${currentMonth} 월
		<a href="${pageContext.request.contextPath}/admin/cashbookByMonth/${currentYear}/${currentMonth+1}">[다음달]</a>
	</h3>
	
	<div>
		<table border="1" width="100%" >
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
				<tr>
					<c:forEach var="i" begin="1" end="${lastDay+(firstDayOfWeek-1)}" step="1">
						<c:if test="${i-(firstDayOfWeek-1) < 1}">
							<td>&nbsp;</td>
						</c:if>
						<c:if test="${i-(firstDayOfWeek-1) > 0}">
							<td>
								<div>
									<a href="${pageContext.request.contextPath}/admin/cashbookByDay/now/${currentYear}/${currentMonth}/${i-(firstDayOfWeek-1)}">${i-(firstDayOfWeek-1)}</a>
								</div> 
								<c:forEach var="c" items="${cashList}">
									<c:if test="${i-(firstDayOfWeek-1)==c.dday}">
										<c:if test="${c.cashbookKind=='수입' }">
											<div>수입: ${c.cashPrice}</div>
										</c:if>
										<c:if test="${c.cashbookKind=='지출' }">
											<div>지출: ${c.cashPrice }</div>
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
	</div>
</div>		
</body>
</html>