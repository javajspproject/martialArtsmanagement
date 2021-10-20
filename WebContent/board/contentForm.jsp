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
	<h1>WebContent/board/content.jsp</h1>
	<h1> 글 본문 내용 보기</h1>
	
	<table border="1">
		<tr>
			<td>글 번 호</td><td><%=bb.getB_id() %></td>
			<td>조 회 수</td><td><%=bb.getReadcount() %></td>	
		</tr>
		<tr>
			<td>글 쓴 이</td><td><%=bb.getId() %></td>
			<td>작 성 일</td><td><%=bb.getDate() %></td>	
		</tr>
		<tr>
			<td>글 제 목</td><td colspan="3"><%=bb.getB_title() %></td>		
		</tr>
		<tr>
			<td>첨부파일</td><td colspan="3"><a href="../upload/<%=bb.getFile()%>"><%=bb.getFile() %></a></td>		
		</tr>
		<tr>
			<td>글 내 용</td><td colspan="3"><%=bb.getB_content() %></td>	
		</tr>
		<tr>
			<td colspan="4">
				<input type ="button" value="수정하기"
				onclick="location.href ='boardUpdateForm.jsp?num=<%=bb.getB_id()%>&pageNum=<%=pageNum%>';">
				<input type ="button" value="삭제하기"
					   onclick="location.href ='boardDeleteForm.jsp?num=<%=bb.getB_id()%>&pageNum=<%=pageNum%>';">
				<input type ="button" value="답글쓰기"
					   onclick="location.href='boardReWriteForm.jsp?num=<%=bb.getB_id()%>&pageNum=<%=pageNum%>&re_ref=<%=bb.getRe_ref() %>&re_lev=<%=bb.getRe_lev() %>&re_seq=<%=bb.getRe_seq() %>'">
				<input type ="button" value="목록보기" 
				onclick="location.href='boardListForm.jsp?pageNum=<%=pageNum%>';">
			</td>
		</tr>
	</table>
	
	
</body>
</html>