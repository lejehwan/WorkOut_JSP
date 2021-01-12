package exercise;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ExerciseDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ExerciseDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/project_wo";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int write(ExerciseDTO exerciseDTO) {
		String SQL = "insert into exercise values (?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, exerciseDTO.getExerciseName().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setString(2, exerciseDTO.getExercisePart().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setString(3, exerciseDTO.getExercisePlan().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setString(4, exerciseDTO.getExerciseLevel().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setString(5, exerciseDTO.getExerciseIntensity().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;// db오류
	}
	
	public ArrayList<ExerciseDTO> getList(String exercisePart, String search, int pageNumber){
		if (exercisePart.equals("운동 부위")) {
			exercisePart = "";
		}
		ArrayList<ExerciseDTO> exerciseList = null;
		
		try {
			String SQL = "select * from exercise where exercisePart like ? and concat(exerciseName, exercisePart, exercisePlan) like" +
					"? order by exercisePlan desc limit " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + exercisePart + "%");
			pstmt.setString(2, "%" + search + "%");
			rs = pstmt.executeQuery();
			exerciseList = new ArrayList<ExerciseDTO>();
			while (rs.next()) {
				ExerciseDTO exercise = new ExerciseDTO(
						rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)
				);
				exerciseList.add(exercise);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return exerciseList;
	}
}
