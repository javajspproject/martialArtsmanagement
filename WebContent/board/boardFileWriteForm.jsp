<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1> 게시판 파일 글쓰기(정보 입력)</h1>
	<%
	String id= (String)session.getAttribute("id");

	if(id == null){
	response.sendRedirect("loginForm.jsp");
	}
	%>
	<fieldset>

		<legend> 파일 글쓰기 </legend>

		<form action="boardFileWritePro.jsp" method="post" enctype="multipart/form-data">
			글쓴이 : <input type="text" name="id" value="<%=id %>" readonly><br> 
			종류 <input type="text" name="b_category"><br> 
			제목 : <input type="text" name="b_title"><br>
			첨부파일 : <input type="file" name="file"><br>
			내용 : <br><textarea rows="10" cols="20" name="b_content"></textarea><br> 
		<input type="submit" value="글쓰기">
		</form>	
	</fieldset>
	
</body>
</html>