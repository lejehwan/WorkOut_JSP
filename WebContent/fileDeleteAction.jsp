<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="file.FileDTO" %>
<%@ page import="file.FileDAO" %>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WorkOut_JSP</title>
</head>
<body>
	<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을  하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	String fileRealName = null;
	if(request.getParameter("fileRealName") != null){
		fileRealName = request.getParameter("fileRealName");
	}
	
	FileDAO fileDAO = new FileDAO();	
	int result = fileDAO.delete(fileRealName);
	
	
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미지 삭제에 실패했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미지를 삭제했습니다.')");
		script.println("location.href = 'gallery.jsp'");
		script.println("</script>");
	}
	
	%>
</body>
</html>