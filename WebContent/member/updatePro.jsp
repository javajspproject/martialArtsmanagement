<%@page import="java.sql.Timestamp"%>
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

	<h1>WebContent/member/updatePro.jsp</h1>

	<%
	request.setCharacterEncoding("UTF-8");
	String id= (String)session.getAttribute("id");

	if(id == null){
	response.sendRedirect("loginForm.jsp");	
	}	
	%>
	<jsp:useBean id="mb" class="com.martialArtsManagement.member.MemberBean"/>
	<jsp:setProperty property="*" name="mb"/>	
	<%
	mb.setReg_date(new Timestamp(System.currentTimeMillis())); 
	
	System.out.println("수정할 정보 : "+mb);
		
	MemberDAO mdao = new MemberDAO();
	mdao.updateMember(mb);
	
	int check = mdao.updateMember(mb);
		
	if(check == 1){
		%>
		<script type="text/javascript">
		alert("회원정보 수정완료");
		location.href="main.jsp";
		</script>
		<%
	}else if(check == 0){
		%>
		<script type="text/javascript">
		alert("비밀번호");
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