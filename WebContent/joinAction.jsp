<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDTO"%>
<%@ page import="user.UserDAO"%>
<%@ page import="util.SHA256"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인이 된 상태입니다.');");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	String userPassword = null;
	String userName = null;
	String userGender = null;
	String userEmail = null;
	if(request.getParameter("userID") != null){
		userID = request.getParameter("userID");
	}
	if(request.getParameter("userPassword") != null){
		userPassword = request.getParameter("userPassword");
	}
	if(request.getParameter("userName") != null){
		userName = request.getParameter("userName");
	}
	if(request.getParameter("userGender") != null){
		userGender = request.getParameter("userGender");
	}
	if(request.getParameter("userEmail") != null){
		userEmail = request.getParameter("userEmail");
	}
	if(userID == null || userPassword == null || userName == null || userGender == null || userEmail == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('enter all items.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(new UserDTO(userID ,userPassword, userName, userGender, userEmail, SHA256.getSHA256(userEmail),false));
	
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('You are already logged in.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	else{
		session.setAttribute("userID", userID);
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='emailSendAction.jsp'");
		script.println("</script>");
		script.close();
	}
%>
</body>
</html>