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
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("loginForm.jsp");	
	}

	MemberDAO mdao = new MemberDAO();

	MemberBean mb = mdao.getMember(id);	

%>
<table border="1">
<tr>
<td>아이디</td><td><%=mb.getId() %></td>
</tr>
<tr>
<td>비밀번호</td><td><%=mb.getPw() %></td>
</tr>
<tr>
<td>이름</td><td><%=mb.getName() %></td>
</tr>
<tr>
<td>나이</td><td><%=mb.getAge() %></td>
</tr>
<tr>
<td>이메일</td><td><%=mb.getEmail() %></td>
</tr>
<tr>
<td>폰번호</td><td><%=mb.getPhone() %></td>
</tr>
<tr>
<td>성별</td><td><%=mb.getGender() %></td>
</tr>
<tr>
<td>주소</td><td><%=mb.getAddr() %></td>
</tr>
<tr>
<td>가입일자</td><td><%=mb.getReg_date() %></td>
</tr>
<tr>
<td colspan="2"><a href="main.jsp">메인페이지</a></td>
</tr>
<tr>
<td colspan="2"><a href="updateForm.jsp">정보 수정</a></td>
</tr>
</table>
</body>
</html>