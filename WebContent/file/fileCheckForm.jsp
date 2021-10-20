<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/fileUpload/fileCheck.jsp</h1>
	<h1>파일 업로드 확인 & 다운로드 기능</h1>
	<%
	
	request.setCharacterEncoding("UTF-8");
	
	// 전달된 파리미터값 저장(name, subject, fileName,OFileName)
	String name = request.getParameter("name");
	String f_title = request.getParameter("f_title");
	String fileName = request.getParameter("fileName");
	String OFileName = request.getParameter("OFileName");
	%>

	올린사람 : <%=name %><br>
	제목 : <%=f_title %><br>
	파일이름 : 
	<a href="fileDownloadForm.jsp?file_name=<%=fileName%>">
	<%=fileName %><br>
	</a>
	원본 파일 이름 : <%=OFileName %><br>
	

</body>
</html>