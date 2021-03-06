<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="joinAction.jsp">
					<h3 style="text-align: center;">Sign up Page</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Input ID" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="Input Password" name="userPassword" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Input Name" name="userName" maxlength="20">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active">
								<input type="radio" name="userGender" autocomplete="off" value="Male" checked>Male
							</label>
							<label class="btn btn-primary">
								<input type="radio" name="userGender" autocomplete="off" value="Female">Female
							</label>
						</div>
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="Input Email" name="userEmail" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="Sign up">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<%@ include file="footer.jsp"%>
	<script src= "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src= "js/bootstrap.js"></script>
</body>
</html>