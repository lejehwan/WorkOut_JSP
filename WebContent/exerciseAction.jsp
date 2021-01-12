<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="exercise.ExerciseDTO"%>
<%@ page import="exercise.ExerciseDAO"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요');");
		script.println("location.href='login.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
	String exerciseName = null;
	String exercisePart = null;
	String exercisePlan = null;
	String exerciseLevel = null;
	String exerciseIntensity = null;

	if(request.getParameter("exerciseName") != null){
		exerciseName = request.getParameter("exerciseName");
	}
	if(request.getParameter("exercisePart") != null){
		exercisePart = request.getParameter("exercisePart");
	}
	
	if(request.getParameter("exercisePlan") != null){
		exercisePlan = request.getParameter("exercisePlan");
	}
	if(request.getParameter("exerciseLevel") != null){
		exerciseLevel = request.getParameter("exerciseLevel");
	}
	if(request.getParameter("exerciseIntensity") != null){
		exerciseIntensity = request.getParameter("exerciseIntensity");
	}
	
	
	if(exerciseName.equals("") || exerciseName.equals("") || exercisePlan.equals("") || exerciseLevel.equals("") || exerciseIntensity.equals("")){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	
	ExerciseDAO exerciseDAO = new ExerciseDAO();
	int result = exerciseDAO.write(new ExerciseDTO(exerciseName, exercisePart, exercisePlan, exerciseLevel, exerciseIntensity));
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('강의 평가 등록에 실패했습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='exercise.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
%>