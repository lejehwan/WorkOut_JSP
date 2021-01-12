<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="file.FileDTO" %>
    <%@ page import="file.FileDAO" %>
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
	<%@ include file="header.jsp"%>
	
	<div class="container">
		<div class="col-lg-14">
			<form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<tr>
						<th>업로드하실 정면 사진을 선택해 주세요. >>> <input type="file" name="file1" style="float: right"></th>
						<th>업로드하실 후면 사진을 선택해 주세요. >>> <input type="file" name="file2" style="float: right"></th>
					</tr>
				</table>
				<input type="submit" value="업로드" style="float: left">
			</form>
			<form action="fileDownload.jsp" method="post">
				<input type="submit" value="다운로드 하러가기" style="float: right">
			</form>
		</div>
	</div>
	<%
		FileDAO fileDAO = new FileDAO();
		ArrayList<FileDTO> list = fileDAO.getList();
		for(int i = 0; i < list.size(); i++){
	%>
	<div class="container">
		<div class="col-md-6">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<tr>
						<th><img src="C:\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Workout\upload\
						<%=list.get(i).getFileRealName()%>"></th>
						<td><p><%=list.get(i).getFileRealName()%></p></td>
						<td><p><%=list.get(i).getFileDate().substring(0,10) %></p></td>
					</tr>
				</table>
			
		</div>
	</div>
	<%
		}
	%>
	
	<%@ include file="footer.jsp"%>
	<script src= "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src= "js/bootstrap.js"></script>
</body>
</html>