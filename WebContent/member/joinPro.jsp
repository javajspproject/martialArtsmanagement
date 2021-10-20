<%@page import="com.martialArtsManagement.member.MemberDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>WebContent/member/joinPro.jsp</h1>
	<%
	request.setCharacterEncoding("UTF-8");
	%>
	<jsp:useBean id="mb" class="com.martialArtsManagement.member.MemberBean"/>
	<jsp:setProperty property="*" name="mb"/>	
	<%
	mb.setReg_date(new Timestamp(System.currentTimeMillis())); 
	
	System.out.println("저장정보 : "+mb.toString());
		
	MemberDAO mdao = new MemberDAO(); 

	mdao.insertMember(mb); 
	
	%>
	<script type="text/javascript">
	alert("회원가입 성공");
	location.href="loginForm.jsp";
	
	</script>
	

</body>
</html>