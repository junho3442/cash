<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>공지사항 자세히보기</h1>
	<div>
		<a href="${pageContext.request.contextPath}/admin/modifyNotice?noticeId=${notice.noticeId}">수정</a>
		<a href="${pageContext.request.contextPath}/admin/removeNotice?noticeId=${notice.noticeId}">삭제</a>
	</div>
	<table border="1">
		
			<tr>
				<td>notice_id</td>
				<td>${notice.noticeId}</td>
			</tr>
			<tr>
				<td>notice_title</td>
				<td>${notice.noticeTitle}</td>
			</tr>
			<tr>
				<td>notice_content</td>
				<td>${notice.noticeContent}</td>
			</tr>
			<tr>
				<td>notice_date</td>
				<td>${notice.noticeDate}</td>
			</tr>
	</table>
	
	<table border="1">
		<c:forEach var="bf" items="${notice.noticefile}">
			<tr>
				<td>notice_file</td>
				<td>${bf.noticefileName}</td>
			</tr>
		</c:forEach>
	</table>
	<table border="1">
		<c:forEach var="c" items="${notice.commentList}">
			<tr>
				<td>${c.commentContent }</td>
				<td><a href="${pageContext.request.contextPath}/admin/delComment?commentId=${c.commentId}&noticeId=${notice.noticeId}">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
	
	<form action="${pageContext.request.contextPath}/admin/addComment?noticeId=${notice.noticeId }" method="post">
		<input type="hidden" name="noticeId" value="${notice.noticeId}">
		<textarea name ="commentContent" rows="3" cols="50"></textarea>
		<button type="submit">입력</button>
	</form>
		<div><a href="${pageContext.request.contextPath}/admin/noticeList">이전 페이지로</a></div>
</body>
</html>