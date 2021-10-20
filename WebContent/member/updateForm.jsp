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
	String id= (String)session.getAttribute("id");
	
	if(id == null){
	response.sendRedirect("loginForm.jsp");	
	}
	MemberDAO mdao = new MemberDAO();

	MemberBean mb = mdao.getMember(id);

	if(mb != null){

		String gender = mb.getGender();
		if(gender == null){
			gender = "남";
		}		
%>

	<fieldset>
		
		<legend> 회원 정보 수정</legend>
	
		<form action="updatePro.jsp" method="post">
			아이디 :  <input type="text" name="id" value="<%=mb.getId() %>" readonly><br>
			비밀번호 : <input type="password" name="pw" value="<%=mb.getPw() %>"><br>
			이름 : <input type="text" name="name" value="<%=mb.getName()%>"><br>
			성별 : <input type="radio" name="gender" value="남" 
	         <% if( gender.equals("남")){ %>
	         	checked
	         <%} %>
	         > 남
	         <input type="radio" name="gender" value="여"
	          <% if( gender.equals("여")){ %>
	         	checked
	         <%} %>
	         > 여<br>
			나이 : <input type="text" name="age" value="<%=mb.getAge() %>"><br>
			이메일 : <input type="text" name="email" value="<%=mb.getEmail() %>"><br>
			주소 : <input type="text" name="addr" value="<%=mb.getAddr() %>"><br>			
			전화번호 : <input type="text" name="phone" value="<%=mb.getPhone() %>"><br>

			<input type="submit" value="회원 정보 수정">
		
		</form>
		<% } %>
	</fieldset>

</body>
</html>