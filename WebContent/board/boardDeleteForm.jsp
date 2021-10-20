<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>게시판 글 삭제</h1>
	
	<%
	int b_id = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	%>
	
	<fieldset>
		<legend> 글 삭 제</legend>
		<form action="boardDeletePro.jsp?pageNum=<%=pageNum %>" method="post">
			<input type="hidden" name="b_id" value="<%=b_id%>">
			아이디 : <input type="text" name="id"><br>
			<input type="submit" value="삭제하기" >
		</form>
	</fieldset>

</body>
</html>