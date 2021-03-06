package Service;

import java.util.HashMap;
import java.util.List;

import Model.alarm;
import Model.art;
import Model.member;
import Model.message;

public interface mainService {

	public	List<member>	containerOne	();
	public	List<member>	containerTwo	();
	public	List<art>	containerThree	();
	public	List<art>	containerFour	();
	public	List<art>	feed	(String id);
	public	List<member>	searchID	(String id);
	public	List<String>	selectFollowing	(String id);
	public	int	sendMessage	(message message);
	public	List<message>	logMessage	(String to, String from);
	public	int	deleteMessage	(String to, String from);
	public	int	insertAlarm	(String type, String to, String from);
	public	int	updateAlarm	(String from);
	public	int	deleteAlarm	(String from);
	public	List<alarm>	selectAlarm	(String from);
	
	public int getStartPage(int page);
	public int getEndPage(int page);
	public int getSkip(int page, int num); 		// 수정
	
	public int getMemberLastPage(HashMap<String, Object> params); // 추가
	public int getAttendLecLastPage(String id);
	public int getGatherLecLastPage(String id);
	public int getRequestLecLastPage(String id);
	public int getApproveLecLastPage(String id);
	public int getBuyingArtLastPage(String id);
	public int getSellingArtLastPage(String id);
	public int getSoldArtLastPage(String id);
	public int getOnePayLastPage(String id);
	public int getSearchArtLastPage(HashMap<String, Object>params); // 추가
	public int getRecentArtLastPage(String genre);	// 추가
	public int getSearchLectureLastPage(HashMap<String, Object>params); // 추가
	public int getAllLectureALastPage(); //추가
	public int getAllLectureGLastPage(); //추가
	
	
}
