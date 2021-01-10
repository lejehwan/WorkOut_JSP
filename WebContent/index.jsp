<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<%@ include file="header.jsp"%>
	
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h1>Introduce</h1>
				<p>This web site is designed to motivate and improve your athletic performance.</p>
				<p><a class="btn btn-primary btn-pull" href="#" role="button">See More</a></p>
			</div>
		</div>	
	</div>
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target = #myCarousel data-slide-to="0" class="active"></li>
				<li data-target = #myCarousel data-slide-to="1" ></li>
				<li data-target = #myCarousel data-slide-to="2" ></li>
			</ol>
			<div class="carousel-inner">
				<div class="item active">
					<img src="images/first.jpg">
				</div>
				<div class="item">
					<img src="images/second.jpg">
				</div>
				<div class="item">
					<img src="images/third.jpg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	<%@ include file="footer.jsp"%>
	<script src= "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src= "js/bootstrap.js"></script>
</body>
</html>