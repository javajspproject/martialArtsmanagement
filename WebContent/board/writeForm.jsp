<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="../js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
			//textarea 태그에 글자수를 계산해서 h2 태그 값을 변경
			// 키보드 입력시 (keyup) 이벤트 처리
			// 글자가 200자 넘을 경우 빨간색의 - 숫자형태로 표시
			//    "      안넘을 경우 남은 글자수를 검정색으로 표시
			
			$('textarea').keyup(function(){
				var value = 200 - $(this).val().length;
				// alert(value);
				// 이벤트 발생한 대상(텍스트에어리어)의 내용의 길이를 계산
				$('h2#cnt').html(value);
				
				// 200 보다 적은경우 - 검정색
				if(value>=0){
					$("#cnt").css('color','black');
				}
				// 200 보다 큰경우 - 빨간색 
				else{
					$("#cnt").css('color','red');
				}
				
			});
			
			
		});
		
	</script>

</head>
<body>
	
	<h1> 게시판 파일 글쓰기(정보 입력)</h1>
<%

	String id= (String)session.getAttribute("id");

	if(id == null){
	response.sendRedirect("loginForm.jsp");
	}
%>

	<h1> 게시판 글쓰기(정보 입력)</h1>
	
	<fieldset>
	
		<legend> 글쓰기 </legend>
		
		<form action="writePro.jsp" method="post">
			글쓴이 : <input type="text" name="id" value="<%=id %>" readonly><br>  
			제목 : <input type="text" name="b_title"><br> 
			종류 : <input type="text" name="b_category"><br>
			<h2 id="cnt">200</h2>
			내용 : <br><textarea rows="10" cols="20" name="b_content"></textarea><br> 
			<input type="submit" value="글쓰기">
		</form>	
	</fieldset>

</body>
</html>