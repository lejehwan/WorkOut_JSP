<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="java.util.ArrayList" %>
	<%@ page import="java.net.URLEncoder" %>
	<%@ page import="exercise.ExerciseDTO" %>
	<%@ page import="exercise.ExerciseDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>WorkOut_JSP</title>
<link rel = "stylesheet" href ="css/bootstrap.minn.css">
<link rel = "stylesheet" href ="css/customm.css">
</head>
<body>
	<%@ include file="header.jsp"%>
	<%
		request.setCharacterEncoding("UTF-8");
		String exercisePart = "운동 부위";
		String search = "";
		int pageNumber = 0;
		if(request.getParameter("exercisePart") != null){
			exercisePart = request.getParameter("exercisePart");
		}
		if(request.getParameter("search") != null){
			search = request.getParameter("search");
		}
		if(request.getParameter("pageNumber") != null){
			try{
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			} catch(Exception e){
				System.out.println("검색 페이지 번호 오류");
			}
		}
	%>
	
	<section class="container">
		<form action="exercise.jsp" method="get" class="form-inline mt-3">
			<select name="exercisePart" class="form-control mx-1 mt-2">
				<option value="운동 부위">운동부위</option>
				<option value="back" <%if(exercisePart.equals("back")) out.println("selected"); %>>등</option>
				<option value="chest" <%if(exercisePart.equals("chest")) out.println("selected"); %>>가슴</option>
				<option value="arm" <%if(exercisePart.equals("arm")) out.println("selected"); %>>팔</option>
				<option value="shoulder" <%if(exercisePart.equals("shoulder")) out.println("selected"); %>>어깨</option>
				<option value="leg" <%if(exercisePart.equals("leg")) out.println("selected"); %>>하체</option>
			</select>
			<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="운동명을 입력하세요.">
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
			<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">운동 등록</a>
			<a class="btn btn-danger mx-1 mt-2" data-toggle="modal" href="#reportModal">오류 제보</a>
		</form>
		
 		<%
			ArrayList<ExerciseDTO> exerciseList = new ArrayList<ExerciseDTO>();
			exerciseList = new ExerciseDAO().getList(exercisePart, search, pageNumber);
			if(exerciseList != null)
				for(int i = 0; i< exerciseList.size(); i++){
					if(i == 5) break;
					ExerciseDTO exercise = exerciseList.get(i);  
		%>
		
		<!-- 운동 종류 설명란 -->
		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left" style="color: red"><%=exercise.getExerciseName() %>&nbsp;<small style="color: black">란</small>
					</div>
					<div class="col-4 text-right">
						부위 :<span style="color: red;"><%=exercise.getExercisePart() %></span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<p class="card-text"><%=exercise.getExercisePlan() %></p>
				<div class="row">
					<div class="col-12 text-right">
						난이도 :<span style="color:red;"><%=exercise.getExerciseLevel() %></span>
						강도 :<span style="color:red;"><%=exercise.getExerciseIntensity() %></span>
					</div>
					<!-- <div class="col-3 text-right">
						<span style="color:green;">상급자</span>
					</div> -->
				</div>
			</div>
		</div>
		
		<%
			}
		%>
		
	</section>
	
	<ul class="pagination justify-content-center mt-3">
		<li class="page-item">
			<%
				if(pageNumber <= 0){
			%>
				<a class="page-link disabled">이전</a>
			<%
				} else{
			%>
				<a class="page-link" href="./exercise.jsp?exercisePart<%= URLEncoder.encode(exercisePart, "UTF-8")%>
				&search=<%= URLEncoder.encode(search,"UTF-8")%>	&pageNumber=<%= pageNumber - 1%>">이전</a>
			<%
				}
			%>
		</li>
		<li>
			<%
				if(exerciseList.size() < 6){
			%>
				<a class="page-link disabled">다음</a>
			<%
				} else{
			%>
				<a class="page-link" href="./exercise.jsp?exercisePart<%= URLEncoder.encode(exercisePart, "UTF-8")%>
				&search=<%= URLEncoder.encode(search,"UTF-8")%>	&pageNumber=<%= pageNumber + 1%>">다음</a>
			<%
				}
			%>
		</li>
	</ul>
	
	<!-- 운동 등록 -->
	<div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">운동 등록</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="exerciseAction.jsp" method="post">
						<div class="form-row">
							<div class="form-group col-sm-6">
								<label>운동명(영문명)</label>
								<input type="text" name="exerciseName" class="form-control" maxlength="20">
							</div>
							<div class="form-group col-sm-6">
								<label>운동 부위</label>
								<input type="text" name="exercisePart" class="form-control" maxlength="20">
							</div>
						</div>
						<div class="form-group">
							<label>운동 설명</label>
							<textarea name="exercisePlan" class="form-control" maxlength="2048" style="height:180px"></textarea>
						</div>
						<div class="form-row">
							<div class="form-group col-sm-3">
								<label>난이도</label>
								<select name="exerciseLevel" class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>
							<div class="form-group col-sm-3">
								<label>강도</label>
								<select name="exerciseIntensity" class="form-control">
									<option value="A" selected>A</option>
									<option value="B">B</option>
									<option value="C">C</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-primary">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 오류 제보 -->
	<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="modal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modal">오류 제보하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="./reportAction.jsp" method="post">
						<div class="form-group">
							<label>오류 부분</label>
							<input type="text" name="reportTitle" class="form-control" maxlength="30">
						</div>
						<div class="form-group">
							<label>오류 설명</label>
							<textarea name="reportContent" class="form-control" maxlength="2048" style="height:180px"></textarea>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-danger">제보하기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="footer.jsp"%>
	<!-- <script src= "https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src= "js/bootstrap.js"></script> -->
	<script src="./js/jquery-3.5.1.min.js"></script>
	<script src="./js/popper.js"></script>
	<script src="./js/bootstrap.minin.js"></script>
</body>
</html>