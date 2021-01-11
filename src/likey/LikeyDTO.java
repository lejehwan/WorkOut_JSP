package likey;

public class LikeyDTO {

	String userID;
	int boardID;
	String userIp;

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public int getBoardID() {
		return boardID;
	}

	public void setBoardID(int boardID) {
		this.boardID = boardID;
	}

	public String getUserIp() {
		return userIp;
	}

	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}
	
	public LikeyDTO() {
		
	}

	public LikeyDTO(String userID, int boardID, String userIp) {
		super();
		this.userID = userID;
		this.boardID = boardID;
		this.userIp = userIp;
	}

	
}
