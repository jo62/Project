package Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.artistDao;
import Model.art;
import Model.lecture;
import Model.likes;
import Model.member;
@Service
public class artistServiceImpl implements artistService{

	@Autowired
	private artistDao artistDao;
	
	@Override
	public int insertFollow(String followerID, String followingID) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<String> selectFollower(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<String> selectFollowing(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteFollow(String followerID, String followingID) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertLikes(likes likes) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<art> selectLikesArt(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<lecture> selectLikesLecture(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteLikesArt(String id, int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteLikesLecture(String id, int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<member> searchArtist(String searchWord, int type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Object> selectTopArtist() {
		HashMap<String, Object> result = new HashMap<>();
		result.put("originalList", artistDao.selectTopArtist("original"));
		result.put("paintingList", artistDao.selectTopArtist("painting"));
		result.put("sculptureList", artistDao.selectTopArtist("sculpture"));
		return result;
	}

	@Override
	public List<member> selectRecentArtist(String genre) {
		// TODO Auto-generated method stub
		return null;
	}

}
