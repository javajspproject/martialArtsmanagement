<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>WebContent/member/logoutPro.jsp</h1>

<%
	session.invalidate(); 
%>

	<script type="text/javascript">
		alert("๋ก๊ทธ์์!");
		location.href="main.jsp";
	</script>


</body>
</html>