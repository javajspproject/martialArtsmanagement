<%@page import="com.martialArtsManagement.member.MemberBean"%>
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
<%

String id = (String)session.getAttribute("id");

if(id == null){ 
	response.sendRedirect("loginForm.jsp");
}
%>

	<fieldset>
		<legend>정보입력</legend>

		<form action="deletePro.jsp" method="post">
			 아이디 : <input type="text" name="id" value="<%=id %>" readonly><br>
			비밀번호 : <input type="password" name="pw"><br>
			<input type="submit" value="회원탈퇴">
		</form>
	</fieldset>
	
</body>
</html>