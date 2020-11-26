<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
<h1>공지사항 수정 페이지</h1>
	<form id="updateNoticeForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/admin/modifyNotice?noticeId=${notice.noticeId}">
		<table border="1">
			<tr>
				<td>notice_id</td>
				<td><input type="text" name="noticeId" readonly="readonly" value="${notice.noticeId}"></td>
			</tr>
			
			<tr>
				<td>notice_title</td>
				<td><input type="text" name="noticeTitle" value="${notice.noticeTitle }"></td>
			</tr>
			<tr>
				<td>notice_content</td>
				<td><input type="text" name="noticeContent" value="${notice.noticeContent }"></td>
			</tr>
			<tr>
				<td>notice_file</td>
				<td>
					<c:forEach var="nf" items="${notice.noticefile}">
					<div>
						<span id="${nf.noticefileName}">${nf.noticefileName}</span>
						<span><a href="${pageContext.request.contextPath}/admin/noticeOneDel?noticefileId=${nf.noticefileId}&noticeId=${notice.noticeId}">삭제</a></span>
					</div>
					</c:forEach>
					<div id="fileinput"></div>
				</td>
				
				<td>
					<div>
						<button type="button" id="addBtn">파일추가</button>
						<button type="button" id="delBtn">파일삭제</button>
					</div>
				</td>
			</tr>
		</table>
		<div><button type="button" id="submitBtn">수정 완료</button></div>
	</form>
			
</body>
<script>
	$('#addBtn').click(function(){
		let html='<div><input type="file" name="noticefile" class="noticefile"></div>';
		$('#fileinput').append(html);
		});

	$('#delBtn').click(function(){
		$('#fileinput').children().last().remove();
		});

	$('#submitBtn').click(function(){
		let ck=true;
		$('.noticefile').each(function(index, item){
			if($(item).val()==''){
				ck=false;
				}
			})
			if(ck == false){
				alert('파일을 선택해 주세요');
				}else{
					$('#updateNoticeForm').submit();
				}
		});
</script>
</html>