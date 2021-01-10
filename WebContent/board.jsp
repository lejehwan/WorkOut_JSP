<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.io.PrintWriter" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>WorkOut_JSP</title>
<link rel = "stylesheet" href ="css/bootstrap.css">
<link rel = "stylesheet" href ="css/custom.css">
</head>
<body>
	<%
		int pageNumber = 1;//페이지를 알려주기 위한 기본 페이지
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>

	<%@ include file="header.jsp"%>
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="backgroud-color: #eeeeee; text-align: center">번호</th>
						<th style="backgroud-color: #eeeeee; text-align: center">제목</th>
						<th style="backgroud-color: #eeeeee; text-align: center">작성자</th>
						<th style="backgroud-color: #eeeeee; text-align: center">작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
						BoardDAO boardDAO = new BoardDAO();
						ArrayList<BoardDTO> list = boardDAO.getList(pageNumber);
						for(int i = 0; i < list.size(); i++){
					%>
					<tr>
						<td><%=list.get(i).getBoardID() %></td>
						<td><a href="view.jsp?boardID=<%=list.get(i).getBoardID() %>"><%=list.get(i).getBoardTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
						<td><%=list.get(i).getUserID() %></td>
						<td><%=list.get(i).getBoardDate().substring(0,11) + list.get(i).getBoardDate().substring(11,13) +"시" + list.get(i).getBoardDate().substring(14,16) + "분"%></td>
					</tr>
					<% 		
						}
					%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1){
			%>
				<a href="board.jsp?pageNumber=<%=pageNumber -1 %>" class="btn btn-success btn-arrow-left">이전</a>
			<% 
				} if(boardDAO.nextPage(pageNumber + 1)){
			%>
				<a href="board.jsp?pageNumber=<%=pageNumber +1 %>" class="btn btn-success btn-arrow-left">다음</a>
			<% 
				}
			%>
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
	<script src= "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src= "js/bootstrap.js"></script>
</body>
</html>