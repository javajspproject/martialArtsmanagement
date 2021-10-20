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

	<h1>WebContent/board/reWritePro.jsp</h1>
	<%
	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
	%>
	  <jsp:useBean id="bb" class="com.martialArtsManagement.board.BoardBean"/>
	  <jsp:setProperty property="*" name="bb"/>	
	<%
	bb.setIp(request.getRemoteAddr());
    System.out.println("답글 정보 :"+bb);

    BoardDAO bdao = new BoardDAO();
	bdao.reInsertBoard(bb);
	

	response.sendRedirect("boardListForm.jsp?pageNum="+pageNum);
	%>
</body>
</html>