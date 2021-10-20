<%@page import="com.martialArtsManagement.member.MemberBean"%>
<%@page import="java.util.ArrayList"%>
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

		if(id == null || !id.equals("admin")){
			response.sendRedirect("loginForm.jsp");
		}

		MemberDAO mdao = new MemberDAO();

		ArrayList<MemberBean> memberList = mdao.getMemberList(); // 이 타입만 담아서 쓸것 

		System.out.println("회원의 수 : "+memberList.size());
	%>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>나이</td>
			<td>성별</td>
			<td>이메일</td>
			<td>폰번호</td>
			<td>주소</td>
			<td>가입일자</td>
		</tr>
		<%
			for (int i = 0; i < memberList.size(); i++) {
				MemberBean mb = memberList.get(i); 
		%>
		<tr>
			<td><%=mb.getId()%></td>
			<td><%=mb.getPw()%></td>
			<td><%=mb.getName()%></td>
			<td><%=mb.getGender()%></td>
			<td><%=mb.getAge()%></td>
			<td><%=mb.getEmail()%></td>
			<td><%=mb.getPhone()%></td>
			<td><%=mb.getAddr()%></td>
			<td><%=mb.getReg_date() %></td>
		</tr>
		<%} %>
	</table>

	<h2><a href="main.jsp">메인페이지</a></h2>
	
</body>
</html>