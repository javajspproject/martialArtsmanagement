<%@page import="com.martialArtsManagement.board.BoardBean"%>
<%@page import="java.util.List"%>
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
	String id= (String)session.getAttribute("id");

	if(id == null){
	response.sendRedirect("loginForm.jsp");
	}
	
	BoardDAO bdao = new BoardDAO();	
	int cnt = bdao.getBoardCount();
	
	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null){
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow =(currentPage-1)*pageSize+1;
	int endRow = currentPage * pageSize;

	List boardList  = null;	
	
	if(cnt != 0){
		boardList = bdao.getBoardList(startRow, pageSize);
	} 
	%>
	<h1> 게시판 글 목록 [전체 개수 : <%=cnt %>개 ]</h1>
	
	<h2><a href="writeForm.jsp">게시판 글쓰기</a></h2>
	<h2><a href="boardFileWriteForm.jsp">파일 게시판 글쓰기</a></h2>
	
	<table border = "1">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>글쓴이</td>
			<td>날짜</td>
			<td>조회수</td>
			<td>IP</td>
		</tr>
		<% 
		if(boardList != null){
			for(int i=0; i<boardList.size();i++){
				BoardBean bb = (BoardBean)boardList.get(i);
		%>
			<tr>
				<td><%=bb.getB_id()%></td>
				<td>
					<%
					int wid = 0;
					if(bb.getRe_lev() > 0){
						wid = 20* bb.getRe_lev();
					%>
						<img src="level.gif"height="15" width="<%=wid%>">
						<img src="re.gif">
					<%
					}
					%>
					<a href="contentForm.jsp?num=<%=bb.getB_id() %>&pageNum=<%=pageNum%>"><%=bb.getB_title() %> 
					</a></td>
				<td><%=bb.getId() %></td>
				<td><%=bb.getDate() %></td>
				<td><%=bb.getReadcount()%></td>
				<td><%=bb.getIp() %></td>
			</tr>
		<%
			} 
		}
		%>
	</table>
	<%
	if(cnt != 0){
		int pageCount = cnt / pageSize + (cnt%pageSize == 0? 0:1);
		
		int pageBlock = 5;
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		int endPage = startPage + pageBlock-1;
		if(endPage > pageCount){
			endPage = pageCount;
		}
		if(startPage > pageBlock){
			%>
			<a href="boardListForm.jsp?pageNum=<%=startPage-pageBlock %>">[이전]</a>
			
			<%
		}
		for(int i=startPage;i<=endPage;i++){
			%>
			<a href="boardListForm.jsp?pageNum=<%=i%>"> [<%=i %>] </a>
			<%
		}
		if(endPage < pageCount){
		%>
		<a href="boardListForm.jsp?pageNum=<%=startPage+pageBlock %>">[다음]</a>
		<%	
		}
	}
	%>
	
	
</body>
</html>