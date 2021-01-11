<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardDTO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="board" class="board.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="boardTitle" name="board" />
<jsp:setProperty property="boardContent" name="board" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	
	<%
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을  하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	}
	else{
		if (board.getBoardTitle() == null || board.getBoardContent() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			BoardDAO boardDAO = new BoardDAO();
			int result = boardDAO.write(board.getBoardTitle(), userID , board.getBoardContent());
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href = 'board.jsp'");
				script.println("</script>");
			}
		}
	}
	%>
	
	<%@ include file="footer.jsp"%>
</body>
</html>