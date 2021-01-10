<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WorkOut_JSP</title>
</head>
<body>
	<%
		String userID = null;
		//세션값이 존재한다면 그 아이디 값을 그대로 받아서 사용
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
	%>
	<nav class = "navbar navbar-default bg-dark">
		<div class = "navbar-header">
			<button type="button" class ="navbar-toggle collapsed" 
			data-toggle= "collapse" data-target ="#bs-example-navbar-collapse-1"
			aria-expanded="false">
			<span class = "icon-bar"></span>
			<span class = "icon-bar"></span>
			<span class = "icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">Work out</a>
		</div>
		<div class ="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp">Main</a></li>
				<li><a href="exercise.jsp">Exercise</a></li>
				<li class="active"><a href="board.jsp">Notice Board</a></li>
			</ul>
			<%
				//로그인이 되어 있지 않다면
				if(userID == null){
			%>
			<ul class ="nav navbar-nav navbar-right">
				<li class ="dropdown">
					<a href="#" class ="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Enter<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">Login</a></li>
						<li><a href="join.jsp">Sign up</a></li>
					</ul>
				</li>
			</ul>
			<%
				} else {
			%>
			<ul class ="nav navbar-nav navbar-right">
				<li class ="dropdown">
					<a href="#" class ="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Member Management<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logout.jsp">Logout</a></li>
					</ul>
				</li>
			</ul>
			<% 		
				}
			%>
		</div>
	</nav>
</body>
</html>