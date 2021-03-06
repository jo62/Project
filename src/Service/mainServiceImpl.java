package Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.artDao;
import Dao.lectureDao;
import Dao.mainDao;
import Dao.memberDao;
import Model.alarm;
import Model.art;
import Model.member;
import Model.message;

@Service
public class mainServiceImpl implements mainService{

	@Autowired
	private mainDao mainDao;
	
	@Autowired
	private memberDao memberDao;
	
	@Autowired
	private artDao artDao;
	
	@Autowired
	private lectureDao lectureDao;
	
	@Override
	public List<member> containerOne() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<member> containerTwo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<art> containerThree() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<art> containerFour() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<art> feed(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<member> searchID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> selectFollowing(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int sendMessage(message message) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<message> logMessage(String to, String from) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteMessage(String to, String from) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertAlarm(String type, String to, String from) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateAlarm(String from) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAlarm(String from) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<alarm> selectAlarm(String from) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getStartPage(int page) {
		return ((page-1)/10*10)+1;
	}

	@Override
	public int getEndPage(int page) {
		return (((page-1)/10)+1)*10;
	}

	@Override
	public int getSkip(int page, int num) {
		return (page-1)*num;
	}
	
	@Override
	public int getMemberLastPage(HashMap<String, Object> params) {
		// TODO Auto-generated method stub
		return (memberDao.getCount(params) - 1) / 10 + 1;
	}

	@Override
	public int getAttendLecLastPage(String id) {
		return ((memberDao.getAttendLecCount(id)-1)/5)+1;
	}

	@Override
	public int getGatherLecLastPage(String id) {
		HashMap<String, Object> params = new HashMap<>();
		if (memberDao.selectOneMember(id).getIsCheck()==2) {
			params.put("artistID", id);
		}if (memberDao.selectOneMember(id).getIsCheck()==3) {
			params.put("guestID", id);
		}
		return ((memberDao.getGatherLecCount(params)-1)/5)+1;
	}

	@Override
	public int getRequestLecLastPage(String id) {
		return ((memberDao.getRequestLecCount(id)-1)/5)+1;
	}

	@Override
	public int getApproveLecLastPage(String id) {
		return ((memberDao.getApproveLecCount(id)-1)/5)+1;
	}

	@Override
	public int getBuyingArtLastPage(String id) {
		return ((memberDao.getBuyingArtCount(id)-1)/5)+1;
	}

	@Override
	public int getSellingArtLastPage(String id) {
		return ((memberDao.getSellingArtCount(id)-1)/5)+1;
	}

	@Override
	public int getSoldArtLastPage(String id) {
		return ((memberDao.getSoldArtCount(id)-1)/5)+1;
	}

	@Override
	public int getOnePayLastPage(String id) {
		return ((memberDao.getOnePayCount(id)-1)/5)+1;
	}

	@Override
	public int getSearchArtLastPage(HashMap<String, Object> params) {
		return ((artDao.searchArtCount(params)-1)/9)+1;
	}

	@Override
	public int getRecentArtLastPage(String genre) {
		return ((artDao.selectRecentArtCount(genre)-1)/9)+1;
	}

	@Override
	public int getSearchLectureLastPage(HashMap<String, Object> params) {
		return ((lectureDao.searchLectureCount(params)-1)/5)+1;
	}

	@Override
	public int getAllLectureALastPage() {
		return ((lectureDao.selectAllLectureACount()-1)/5)+1;
	}

	@Override
	public int getAllLectureGLastPage() {
		return ((lectureDao.selectAllLectureGCount()-1)/5)+1;
	}



}
