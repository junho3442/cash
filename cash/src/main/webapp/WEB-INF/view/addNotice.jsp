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
	<form id="addNotice" method="post" action="${pageContext.request.contextPath}/admin/addNotice" enctype="multipart/form-data">
		<table border="1">
			
				<tr>
					<td>notice_title</td>
					<td><input type="text" name="noticeTitle"></td>
				</tr>
				
				<tr>
					<td>notice_content</td>
					<td><input type="text" name="noticeContent"></td>
				</tr>
				
				<tr>
					<td>notice_file</td>
					<td>
						<div>
							<button type="button" id="addBtn">파일추가</button>
							<button type="button" id="delBtn">파일삭제</button>
						</div>
						<div id="fileinput"></div>
					</td>
				</tr>
		</table>
					<div><button type="button" id="submitBtn">작성완료</button></div>
	</form>		
</body>
<script>
	$('#addBtn').click(function(){
		let html= '<div><input type="file" name="noticefile" class="boardfile"></div>';	
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
		}else{
			$('#addNotice').submit();
		}
	});
</script>
</html>