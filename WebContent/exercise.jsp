<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
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
	
	<section class="container">
		<form action="exercise.jsp" method="get" class="form-inline mt-3">
			<select name="part" class="form-control mx-1 mt-2">
				<option value="운동 부위">운동부위</option>
				<option value="등">등</option>
				<option value="가슴">가슴</option>
				<option value="팔">팔</option>
				<option value="어깨">어깨</option>
				<option value="하체">하체</option>
			</select>
			<select name="searchType" class="form-control mx-1 mt-2">
				<option value="최신순">최신순</option>
			</select>
			<input type="text" name="search" class="form-control mx-1 mt-2" placeholder="운동명을 입력하세요.">
			<button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>
			<a class="btn btn-primary mx-1 mt-2" data-toggle="modal" href="#registerModal">운동 등록</a>
			<a class="btn btn-danger mx-1 mt-2" data-toggle="modal" href="#reportModal">오류 제보</a>
		</form>
		<!-- 운동 종류 설명란 -->
		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left" style="color: red">데드리프트&nbsp;<small style="color: black">(DEADLIFT)</small>
					</div>
					<div class="col-4 text-right">
						부위 :<span style="color: red;">등</span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<p class="card-text">데드리프트는 데드리프트다...</p>
				<div class="row">
					<div class="col-9 text-left">
						난이도 :<span style="color:red;">S</span>
						강도 :<span style="color:red;">S</span>
					</div>
					<div class="col-3 text-right">
						<span style="color:green;">상급자</span>
					</div>
				</div>
			</div>
		</div>
		
		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left" style="color: red">벤치프레스&nbsp;<small style="color: black">(BENCHPRESS)</small>
					</div>
					<div class="col-4 text-right">
						부위 :<span style="color: red;">가슴</span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<p class="card-text">벤치프레스는 벤치프레스다...</p>
				<div class="row">
					<div class="col-9 text-left">
						난이도 :<span style="color:red;">B</span>
						강도 :<span style="color:red;">A</span>
					</div>
					<div class="col-3 text-right">
						<span style="color:green;">초,중급자</span>
					</div>
				</div>
			</div>
		</div>
		
		<div class="card bg-light mt-3">
			<div class="card-header bg-light">
				<div class="row">
					<div class="col-8 text-left" style="color: red">스쿼트&nbsp;<small style="color: black">(SQUART)</small>
					</div>
					<div class="col-4 text-right">
						부위 :<span style="color: red;">하체</span>
					</div>
				</div>
			</div>
			<div class="card-body">
				<p class="card-text">스쿼트는 스쿼트다...</p>
				<div class="row">
					<div class="col-9 text-left">
						난이도 :<span style="color:red;">A</span>
						강도 :<span style="color:red;">S</span>
					</div>
					<div class="col-3 text-right">
						<span style="color:green;">중,상급자</span>
					</div>
				</div>
			</div>
		</div>
		
	</section>
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