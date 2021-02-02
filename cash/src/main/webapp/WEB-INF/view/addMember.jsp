<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('#id').focus();
		$('#id').blur(function(){
			//입력한 id값과 db에있는 아이디값을 비교
			
			if($('#id').val()==''){
				$('#id').focus();
				return;
				}
			$.ajax({
				url:'/admin/idCheck',
				type:'post',
				data:{id:$('#id').val()}, //id라는 이름안에 입력한 id값을 보냄 
				success:function(data){
					if(data=='yes'){
						alert($('#id').val()+'는 사용가능 아이디 입니다.');
						$('#pw').focus();
						}else{
							alert($('#id').val()+'는 사용불가 아이디 입니다.');
							$('#id').select();
							$('#id').focus();
							}
					}
				});
			
			});
		});
</script>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath}/admin/addMember">
				<div>
					ID:<input type="text" name="id" id="id">
				</div>
				
				<div>
					PW:<input type="text" name="pw" id="pw">
				</div>
		
			<button type="submit" id="addMember">완료</button>
	</form>
</body>
</html>