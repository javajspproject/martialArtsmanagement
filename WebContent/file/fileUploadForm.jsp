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
	
	
	<section id="uploadFormArea">
		<form action="fileUploadPro.jsp" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<td colspan="2" class="td_title">파일 업로드 폼</td>
				</tr>
				<tr>
					<td>올린 사람 : </td>
					<td><input type="text" name="id" value=<%=id %> readonly></td>
				</tr>
				<tr>
					<td>제목 : </td>
					<td><input type="text" name="f_title"></td>
				</tr>
				<tr>
					<td>파일명 : </td>
					<td><input type="file" name="file"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="업로드"></td>
				</tr>
			</table>
		</form>
	</section>
	
</body>
</html>