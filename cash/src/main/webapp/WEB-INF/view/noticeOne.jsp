<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	.a {
	        background-color: #FAEBD7;
	      }
	.b {
	   		background-color: #F0FFFF;
	   }
</style>
</head>
<body>
<div class="container text-center">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1 style="margin-top:30px;">공지사항 자세히보기</h1>
<div class="row">
<div class="col-lg-8 col-md-8">
<div class="card" style="width:100%;">
<div class="a">
	<table class="table table-borderless" style="margin-top:10px; width:60%; margin-left: auto; margin-right: auto;">
		<tr>
			<td style="text-align:left;">
				<a type="button" class="btn btn-outline-success" href="${pageContext.request.contextPath}/admin/modifyNotice?noticeId=${notice.noticeId}">수정</a>
				&emsp;<a type="button" class="btn btn-outline-danger" href="${pageContext.request.contextPath}/admin/removeNotice?noticeId=${notice.noticeId}">삭제</a>
			</td>
		</tr>	
			<tr>
				<td style="text-align:left;">작성자: &emsp;${notice.noticeWriter}</td>
				<td style="text-align:left;">작성일: &emsp;${notice.noticeDate}</td>
			</tr>
			<tr>
				<td style="text-align:left;">제목: &emsp;${notice.noticeTitle}</td>
			</tr>
	</table>
	
	<table class="table table-borderless" style="margin-top:10px; width:60%; margin-left: auto; margin-right: auto;">
		<tr>
			<td style="text-align:left;"><label for="content">내용:</label>
			<textarea style="width:80%;" rows="5" id="content" class="form-control" readonly="readonly">${notice.noticeContent}</textarea></td>
		</tr>
	</table>

	<table class="table table-borderless" style="margin-top:10px; width:60%; margin-left: auto; margin-right: auto;">
		<c:forEach var="bf" items="${notice.noticefile}">
			<tr>
				<td style="text-align:left;">첨부 파일:&emsp;${bf.noticefileName}</td>
			</tr>
		</c:forEach>
		<tr>
			<td>
				<div style="text-align:left;"><a type="button" class="btn btn-outline-dark" href="${pageContext.request.contextPath}/admin/noticeList">이전 페이지로</a></div>
			</td>
		</tr>
	</table>
	
		
</div>	
</div>
</div>
<div class="col-lg-4 col-md-4">	
<div class="card" style="width:100%">
<div class="b">
	<table class="table table-borderless" style="margin-top:10px; width:100%; margin-left: auto; margin-right: auto;">
		<c:forEach var="c" items="${notice.commentList}">
			<tr>
				<td>${c.commentContent }</td>
				<td><a href="${pageContext.request.contextPath}/admin/delComment?commentId=${c.commentId}&noticeId=${notice.noticeId}">삭제</a></td>
			</tr>
		</c:forEach>
	</table>
	
	<form action="${pageContext.request.contextPath}/admin/addComment?noticeId=${notice.noticeId}" method="post">
		<input type="hidden" name="noticeId" value="${notice.noticeId}">
		<table class="table table-borderless" style="margin-top:10px; width:100%; margin-left: auto; margin-right: auto;">
		<tr>
			<td>
				
				<textarea placeholder="댓글을 입력해주세요" name ="commentContent" style="width:100%;" class="form-control" rows="3" cols="50" id="comment"></textarea>
			</td>
		</tr>
		<tr>
			<td style="text-align:right;">
				<button type="submit"  class="btn btn-outline-success" type="submit">댓글 입력</button>
			</td>
		</tr>	
		</table>
		
	</form>
	</div>
	</div>
	</div>
</div>
</div>
</body>
</html>