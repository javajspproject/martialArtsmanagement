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

	<h1>WebContent/board/updatePro.jsp</h1>
	<%
	request.setCharacterEncoding("UTF-8");	
	String pageNum = request.getParameter("pageNum");
	%>
	
	<jsp:useBean id="bb" class="com.martialArtsManagement.board.BoardBean"/>
	<jsp:setProperty property="*" name="bb"/>
	
	<%
	System.out.println("bb객체에 저장된 정보 : "+bb.toString());	
	BoardDAO bdao = new BoardDAO();
	bdao.updateBoard(bb);
	
	int check = bdao.updateBoard(bb);
	
	if(check == 1){
		%>
		<script type="text/javascript">
		alert("정보수정 완료");
		location.href="boardListForm.jsp?pageNum=<%=pageNum%>";
		</script>
		<%
	}else if(check == 0){
		%>
		<script type="text/javascript">
		alert("비밀번호 오류");
		histoy.back();
		</script>
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("글 번호 없음");
		histoy.back();
		</script>				
		<%
	}
	%>
	
	
	
	
</body>
</html>