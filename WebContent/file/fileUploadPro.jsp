<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>WebContent/fileUpload/fileUploadPro.jsp</h1>
	<%
	String name="";
	String f_title="";
	String fileName="";
	String OFileName="";
	
	try{
	
	String realPath = request.getRealPath("/upload");
	System.out.println("물리적 경로 : "+realPath);
	
	int maxSize = 10*1024*1024;
	
	MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	
    // 전달된 정보(이름, 제목, 파일)
	name = multi.getParameter("id");
	f_title = multi.getParameter("f_title");
	fileName = multi.getFilesystemName("fileName");
	
	// 다수의 파일 업로드 시
	Enumeration files = multi.getFileNames();
	
	String file1 = (String)files.nextElement();
	fileName = multi.getFilesystemName(file1);
	OFileName = multi.getOriginalFileName(file1);

	System.out.println("파일 이름 : "+fileName);
	System.out.println("원본 파일 이름 : "+OFileName);
	System.out.println("이름 : "+name);
	System.out.println("제목 : "+f_title);
	
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
	<h1>업로드 성공!</h1>
		<form action="fileCheckForm.jsp" method="post" name="fm">
			<input type="hidden" name="name" value="<%=name%>"> <!-- try문에 있는 것은 사용 불가 -->
			<input type="hidden" name="f_title" value="<%=f_title%>">
			<input type="hidden" name="fileName" value="<%=fileName%>">
			<input type="hidden" name="OFileName" value="<%=OFileName%>">
		</form>
	
	<h2>
		<a href="#" onclick="javascript:fm.submit()">
		업로드 성공 확인 & 다운로드 페이지 이동
		</a>
	</h2>
	
</body>
</html>