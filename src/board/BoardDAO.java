package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {

	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;

	public BoardDAO() {
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
	
	public String getDate() {
		String SQL = "select now()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}
	
	public int getNext() {
		String SQL = "select boardID from board order by boardID desc";// 가장 마지막 게시글을 가져오기
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;// 그 다음 게시글에 번호가 들어가게 만듬
			}
			return 1;// 첫번째 게시물인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	public int write(String boardTitle, String userID, String boardContent) {
		String SQL = "insert into board values(?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, boardTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, boardContent);
			pstmt.setInt(6, 1);
			pstmt.setInt(7, 0);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	// 게시글 목록 불러오는 메서드
		public ArrayList<BoardDTO> getList(int pageNumber) {
			String SQL = "select * from board where boardID <? and boardAvailable =1 order by boardID desc limit 10";
			ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					BoardDTO bbs = new BoardDTO();
					bbs.setBoardID(rs.getInt(1));
					bbs.setBoardTitle(rs.getString(2));
					bbs.setUserID(rs.getString(3));
					bbs.setBoardDate(rs.getString(4));
					bbs.setBoardContent(rs.getString(5));
					bbs.setBoardAvailable(rs.getInt(6));
					bbs.setLikeCount(rs.getInt(7));
					list.add(bbs);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}
		
		// 게시글 페이지가 1페이지당 10개씩이므로, 다음 페이지를 확인 하는 메서드
		public boolean nextPage(int pageNumber) {
			String SQL = "select * from board where boardID <? and boardAvailable =1 order by boardID desc limit 10";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					if (rs.next()) {
						return true;
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return false;
		}
		
		public BoardDTO getBoard(int boardID) {
			String SQL = "select * from board where boardID = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, boardID);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					BoardDTO bbs = new BoardDTO();
					bbs.setBoardID(rs.getInt(1));
					bbs.setBoardTitle(rs.getString(2));
					bbs.setUserID(rs.getString(3));
					bbs.setBoardDate(rs.getString(4));
					bbs.setBoardContent(rs.getString(5));
					bbs.setBoardAvailable(rs.getInt(6));
					bbs.setLikeCount(rs.getInt(7));
					return bbs;
					}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
		}
		
		
		public int update(String boardTitle, String boardContent, int boardID) {
			String SQL = "update board set boardTitle =? , boardContent =? where boardID =?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, boardTitle);
				pstmt.setString(2, boardContent);
				pstmt.setInt(3, boardID);
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; // 데이터베이스 오류
		}
		
		public int delete(int boardID) {
			String SQL = "update board set boardAvailable = 0 where boardID =?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, boardID);
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1; // 데이터베이스 오류
		}
		
		public int like(String boardID) {
			String SQL = "update board set likeCount = likeCount + 1 where boardID =?";
			try {
				pstmt = conn.prepareStatement(SQL);
				pstmt.setString(1, boardID);
				return pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return -1;// db오류
		}
}
