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

	<h1>WebContent/member/joinIDCheck.jsp</h1>
	<%
	String id = request.getParameter("userid");
	MemberDAO mdao = new MemberDAO(); 
	
	int check = mdao.joinIdCheck(id);
	
	if(check ==1){
		out.print("<h3>사용중인 아이디 입니다.</h3>");

	}else{
		out.print("<h3>사용 가능한 아이디 입니다.</h3>");
		%>
		<input type="button" value="아이디 사용하기" onclick="setID();">
		
		<%
	}	
	%>
	 <br><br><br>
	 <fieldset>
	 	<legend>아이디 중복 체크</legend>
	 
	 	<form action="joinIdCheck.jsp" method="post" name="winfr">
	 		아이디 :  <input type=text name="userid" value=<%=id %>>
	 		<input type="submit" value="중복체크">
	 	</form>
	</fieldset>
	
	
	
</body>

	<script type="text/javascript">
	function setID(){
		// alert("setID");
		// 1. 새창에 있는 아이디 정보를 회원가입 페이지로 전달
		opener.document.fr.id.value = document.winfr.userid.value;
		opener.document.fr.id.readOnly=true;
		// 2. 창 종료
		window.close();
		
	}
	
	</script>
</body>
</html>