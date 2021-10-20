<%@page import="com.martialArtsManagement.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <title>Door page</title>  
  <link href="../css/alert.css" rel="stylesheet">
  

</head>
<body>
	<script type="text/javascript">
	Alert.render("You look very pretty today.");
	</script>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	MemberDAO mdao = new MemberDAO();	
	
	int check = mdao.loginCheck(id,pw);
		
	if(check == 1){
		session.setAttribute("id", id);
		%>
		<script type="text/javascript">
		alert("로그인 성공");
		location.href="main.jsp";
		</script>
		<%		
	}else if(check == 0){
		%>
		<script type="text/javascript">
		Alert.render("You look very pretty today.");
		history.back();
		</script>
		<%							
	}else{
		%>
		<script type="text/javascript">
		var result = confirm("아이디가 없음 회원가입 ok?");
		if(result){
			location.href="joinForm.jsp";
		}else{
			history.back();			
		}
		</script>
		<%		
	}
	%>
	
	  <script type="text/javascript" src="../js/alert.js"></script>
</body>
</html>