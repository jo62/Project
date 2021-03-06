package Service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import Dao.boardDao;
import Model.board;
import Model.boardComment;
import Model.boardRecomment;
import Model.qna;
import Model.qnaComment;
import Model.qnaRecomment;

@Service
public class boardServiceImpl implements boardService{

	@Autowired
	private boardDao boardDao;
	
	@Override
	public List<board> searchBoard(String searchWord, int type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard(board board) {
		return boardDao.insertBoard(board);
	}

	@Override
	public int updateBoard(board board) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<board> selectNotice() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<board> selectBoard() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public board selectOneBoard(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoardComment(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertBoardRecomment(int commentNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<boardComment> selectBoardComment(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<boardRecomment> selectBoardRecomment(int commentNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<qna> searchQna(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertQna(qna qna) {

		return boardDao.insertQna(qna);
	}

	@Override
	public int updateQna(qna qna) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteQna(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<qna> selectQna() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public qna selectOneQna(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertQnaComment(qnaComment qnaComment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertQnaRecomment(qnaRecomment qnaRecomment) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<qnaComment> selectQnaComment(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<qnaRecomment> selectQnaRecomment(int commentNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
