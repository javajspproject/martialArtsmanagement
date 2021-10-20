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
	String id= (String)session.getAttribute("id");

	if(id == null){
	response.sendRedirect("loginForm.jsp");
	}
%>

<h2><%=id %>님 로그인 성공!</h2>
<input type="button" value="로그아웃" onclick="location.href='logoutPro.jsp'">
<hr><hr>
<a href="infoForm.jsp">회원 정보 조회</a>

<hr><hr>
<a href="updateForm.jsp">회원 정보 수정</a>

<hr><hr>
<a href="deleteForm.jsp">회원 정보 삭제</a>

<hr><hr>
<a href="../board/boardListForm.jsp">게시판</a>

<hr><hr>
<a href="../file/fileUploadForm.jsp">자료실</a>

<%
if(id != null){	
	if(id.equals("admin")){
%>

<hr><hr>
<a href="listForm.jsp">회원 정보 목록보기</a>
<%
	}
}
%>
</body>
</html>