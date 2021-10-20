<%@page import="com.martialArtsManagement.board.BoardDAO"%>
<%@page import="com.martialArtsManagement.board.BoardBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/board/fwritePro.jsp</h1>
	
	<%
	request.setCharacterEncoding("UTF-8");	
	String realPath = request.getRealPath("/upload");
    System.out.println("물리적 경로 : "+realPath);
	int maxSize = 10 * 1024 * 1024;
	MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

	BoardBean bb = new BoardBean();
	
	bb.setId(multi.getParameter("id"));
	bb.setB_category(multi.getParameter("b_category"));
	bb.setB_title(multi.getParameter("b_title"));
	bb.setB_content(multi.getParameter("b_content"));
	bb.setFile(multi.getFilesystemName("file")); // o
	bb.setIp(request.getRemoteAddr());
	
	System.out.println("파일 업로드 중 정보 확인 : "+bb.toString());
	System.out.println("upload 폴더에 저장된 파일 이름 : "+multi.getFilesystemName("file"));
	System.out.println("사용자가 올린 원본 파일 이름 : "+multi.getOriginalFileName("file"));
	
	BoardDAO bdao = new BoardDAO();
	bdao.insertBoard(bb);
	
	response.sendRedirect("boardListForm.jsp");
	%>
	
</body>
</html>