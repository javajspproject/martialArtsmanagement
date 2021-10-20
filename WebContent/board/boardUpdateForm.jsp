<%@page import="com.martialArtsManagement.board.BoardBean"%>
<%@page import="com.martialArtsManagement.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	int b_id = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");	
	
	BoardDAO bdao = new BoardDAO();
	bdao.updateReadCount(b_id); 
	
	BoardBean bb = bdao.getBoard(b_id); 
	
	%>
	
	<fieldset>
		<legend> 글 수정하기 </legend>
		<form action="boardUpdatePro.jsp?pageNum=<%=pageNum %>" method="post">
		<!-- num form 태그 방식-->
		<input type="hidden" name="b_id" value="<%=bb.getB_id() %>"> 
		글쓴이 : <input type="text" name="id" value="<%=bb.getId()%>" readonly><br> 
		종류 : <input type="text" name="b_category" value="<%=bb.getB_category()%>"><br> 
		제목 : <input type="text" name="b_title" value="<%= bb.getB_title()%>"><br> 
		내용 : <br><textarea rows="10" cols="20" name="b_content"><%=bb.getB_content()%></textarea><br> 
		<input type="submit" value="수정하기">
		</form>	
	</fieldset>

</body>
</html>