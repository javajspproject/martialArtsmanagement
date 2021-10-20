<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1> 게시판 글쓰기(정보 입력)</h1>
	<%
	int b_id = Integer.parseInt(request.getParameter("num"));
	int re_ref = Integer.parseInt(request.getParameter("re_ref"));
	int re_lev = Integer.parseInt(request.getParameter("re_lev"));
	int re_seq = Integer.parseInt(request.getParameter("re_seq"));
	String id= (String)session.getAttribute("id");
	String pageNum = request.getParameter("pageNum");
	%>
	<fieldset>

		<legend> 답글쓰기 </legend>

		<form action="boardReWritePro.jsp?pageNum=<%=pageNum%>" method="post">
			<input type="hidden" name="b_id" value="<%=b_id%>">
			<input type="hidden" name="re_ref" value="<%=re_ref%>">
			<input type="hidden" name="re_lev" value="<%=re_lev%>">
			<input type="hidden" name="re_seq" value="<%=re_seq%>"> 
			
			글쓴이 : <input type="text" name="id" value=<%=id%> readonly><br>
			종류 : <input type="text" name="b_category"><br>
			제목 : <input type="text" name="b_title" value="[re]"><br>
			내용 : <br><textarea rows="10" cols="20" name="b_content"></textarea><br>
			<input type="submit" value="답글쓰기">
		</form>
	</fieldset>

</body>
</html>