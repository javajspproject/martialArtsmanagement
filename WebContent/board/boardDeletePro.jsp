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
	request.setCharacterEncoding("UTF-8");
	String pageNum = request.getParameter("pageNum");
	int b_id = Integer.parseInt(request.getParameter("b_id"));
	String id = request.getParameter("id");
	
	BoardDAO bdao = new BoardDAO();
	int check = bdao.deleteBoard(b_id, id);
	
	if(check == 1){
		%>
		<script type="text/javascript">
		alert("삭제완료");
		location.href="boardListForm.jsp?pageNum=<%=pageNum%>";
		</script>
		<%
	}else if(check == 0){
		%>
		<script type="text/javascript">
		alert("비밀번호 오류");
		history.back();
		</script>
		<%		
	}else{
		%>
		<script type="text/javascript">
		alert("글 번호 없음");
		history.back();
		</script>
		<%
	}
	%>	
</body>
</html>