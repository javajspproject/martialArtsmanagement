<%@page import="com.martialArtsManagement.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>WebContent/Member/deletePro.jsp</h1>
	
<%
	request.setCharacterEncoding("UTF-8");

	String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("loginForm.jsp");
	}
	String pw = request.getParameter("pw");
	MemberDAO mdao = new MemberDAO();
	int check = mdao.deleteMember(id, pw);

	System.out.println("삭체처리 결과 : "+check);

	if(check == 1){
		session.invalidate();
		%>
		<script type="text/javascript">
		alert("삭제 완료");
		location.href="main.jsp";	
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
		alert("아이디 오류");
		history.back();
		</script>	
		<%
	}
		%>
</body>
</html>