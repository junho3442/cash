<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container text-center">
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		<h1 style="margin-top:30px;">공지사항 추가</h1>
	<form id="addNotice" method="post" action="${pageContext.request.contextPath}/admin/addNotice" enctype="multipart/form-data">
		<table class="table table-borderless" style="margin-top:10px; width:60%; margin-left: auto; margin-right: auto;">
		<tr>	
			<td style="text-align:left;">
				<label for="writer" style="font-weight:bold;">작성자:</label>
				<input style="width:30%;" type="text" id="writer" name="noticeWriter" readonly="readonly" class="form-control" value="${loginId}">
			</td>
		</tr>		
		<tr>
			<td style="text-align:left;">	
				<label for="noticeTitle" style="font-weight:bold;">제목:</label>
				<input style="width:50%;" type="text" class="form-control" name="noticeTitle" id="noticeTitle">
			</td>
		</tr>		
		<tr>
			<td style="text-align:left;">	
				<label for="noticeContent" style="font-weight:bold;">내용:</label>
				<textarea class="form-control" rows="6" name="noticeContent" id="noticeContent"></textarea>
			</td>	
		</tr>	
		<tr>
			<td>
				<div style="text-align:left;">(공지사항 관련 파일 업로드)</div>
					<div class="border border-0 d-flex">
						<span class="border border-0" id="fileinput"></span>
						<div>
							<button class="btn btn-outline-success" type="button" id="addBtn">파일추가</button>
							<button class="btn btn-outline-danger" type="button" id="delBtn">파일삭제</button>
						</div>
					</div>	
			</td>	
		</tr>				
					
			<tr><td>
					<div style="text-align:right;">
						<button class="btn btn-outline-success" type="button" id="submitBtn">작성완료</button>
					</div>
			</td></tr>		
		</table>
	</form>	
	</div>	
</body>
<script>
	$('#addBtn').click(function(){
		let html= '<div><input type="file" name="noticefile" class="noticefile"></div>';	
		$('#fileinput').append(html);
	});

	$('#delBtn').click(function(){
		$('#fileinput').children().last().remove();
	});

	$('#submitBtn').click(function(){
		let ck = true;
		$('.noticefile').each(function(index, item){
			if($(item).val()==''){
				ck = false;	
			}
		})
		if(ck == false){
			alert('파일을 선택해 주세요');
		}else if($('#noticeContent').val()=="" || $('#noticeTitle').val()==""){
			alert('제목및 내용을 입력해주세요');
		}else{
			$('#addNotice').submit();
		}
	});
</script>
</html>