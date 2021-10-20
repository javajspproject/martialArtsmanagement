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

	<h1>WebContent/board/writePro.jsp</h1>
	<%
	request.setCharacterEncoding("UTF-8");	
	%>
	<jsp:useBean id="bb" class="com.martialArtsManagement.board.BoardBean"/>
	<jsp:setProperty property="*" name="bb"/>
	<%
	bb.setIp(request.getRemoteAddr());
	System.out.println("bb객체에 저장된 정보 : "+bb.toString());	
	
	BoardDAO bdao = new BoardDAO();
	bdao.insertBoard(bb);
	
	response.sendRedirect("boardListForm.jsp");
	%>


</body>
</html>