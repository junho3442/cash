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
<div class="container text-center">
<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
<h1 style="margin-top:30px;">공지사항 수정 페이지</h1>
	<form id="updateNoticeForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/admin/modifyNotice?noticeId=${notice.noticeId}">
		
		<table class="table table-borderless" style="margin-top:20px; width:60%; margin-left: auto; margin-right: auto;">	
			<tr>
				<td style="text-align:left;">
					<div class="form-group">
						<label for="noticeTitle">제목:</label>
						<input type="text" style="width:50%;" id="noticeTitle"  class="form-control" name="noticeTitle" value="${notice.noticeTitle }">
					</div>
				</td>
			</tr>
			<tr>
				<td style="text-align:left;">
					<div class="form-group">
					<label for="noticeContent">내용:</label>
					<textarea name="noticeContent" style="width:80%;" rows="5" class="form-control" id="noticeContent">${notice.noticeContent }</textarea>
				</td>
			</tr>
			</table>
			
			<table class="table table-borderless" style="margin-top:20px; width:60%; margin-left: auto; margin-right: auto;">
			<tr>
				<td>첨부파일</td>
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
						<button type="button" type="button" class="btn btn-outline-success" id="addBtn">파일추가</button>
						<button type="button" type="button" class="btn btn-outline-danger" id="delBtn">파일삭제</button>
					</div>
				</td>
			</tr>
		</table>
		<div style="margin-left: 600px;">
			<button type="button" type="button" class="btn btn-outline-success" id="submitBtn">수정 완료</button>
		</div>
		
	</form>
</div>			
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