<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="file.FileDAO" %>
    <%@ page import="java.io.File" %>
	<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
	<%@page import="com.oreilly.servlet.MultipartRequest"%>
	<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WorkOut_JSP</title>
</head>
<body>
	<%
		String directory = application.getRealPath("/upload/");
		/* String directory = "C:/upload/"; */
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest = new MultipartRequest(request, directory, maxSize, encoding, new DefaultFileRenamePolicy());
		
		Enumeration fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasMoreElements()){
			String parameter = (String) fileNames.nextElement();
			
			String fileName = multipartRequest.getOriginalFileName(parameter);
			String fileRealName = multipartRequest.getFilesystemName(parameter);
			
			if(fileName == null){
				continue;
			}
			if(!fileName.endsWith(".jpg") && !fileName.endsWith(".gif") && !fileName.endsWith(".JPG") && !fileName.endsWith(".PNG") &&
					!fileName.endsWith(".png") && !fileName.endsWith(".txt")){
				File file = new File(directory + fileRealName);
				file.delete();
				out.write("업로드 할 수 없는 확장자입니다.");
			}
			else{
				int result = new FileDAO().upload(fileName, fileRealName);
				if(result == 1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('업로드 되었습니다');");
					script.println("location.href='gallery.jsp'");
					script.println("</script>");
					script.close();
				}
				/* out.write("파일명: " + fileName + "<br>");
				out.write("실제파일명: " + fileRealName + "<br>"); */
			}
		}
	%>
</body>
</html>