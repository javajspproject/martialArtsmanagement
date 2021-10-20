<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
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
	String filename = request.getParameter("file_name");
	String savePath = "upload"; 
	
	ServletContext context = getServletContext();
	String DownloadPath = context.getRealPath(savePath);
	
	System.out.println("다운로드(업) 경로 : "+DownloadPath);
	
	String FilePath = DownloadPath+"\\"+filename;
	byte[] b = new byte[4096];
	FileInputStream fis = new FileInputStream(FilePath);
	String MimeType = getServletContext().getMimeType(FilePath);
	
	if(MimeType == null){
    	 MimeType = "application/octect-stream";
     }
	
	System.out.println("MimeType : "+MimeType);
	
	response.setContentType(MimeType);
	String agent = request.getHeader("User-Agent");
	boolean ieBrowser = 
	(agent.indexOf("MSIE") > -1) || (agent.indexOf("Trident") > -1); 
	
	if(ieBrowser){ // IE
		filename = URLEncoder.encode(filename,"UTF-8").replaceAll("\\+", "%20");
	}else{ 
		filename = new String(filename.getBytes("UTF-8"), "iso-8859-1");
	}
	
	response.setHeader("Content-Disposition", "attachment; filename = "+filename);
	ServletOutputStream out2 = response.getOutputStream();
	
	int numRead = 0;
	
	while( (numRead = fis.read(b,0,b.length)) != -1){
		out2.write(b,0,numRead);
	}
	
	out2.close();
	fis.close();
	%>
	
	
</body>
</html>