package Controller;

import java.io.IOException;
import java.text.ParseException;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import Model.art;
import Model.board;
import Model.lecture;
import Model.member;
import Model.pay;
import Model.qna;
import Service.artService;
import Service.artistService;
import Service.boardService;
import Service.lectureService;
import Service.memberService;

@Controller
public class boardController {
	
	@Autowired
	private lectureService lectureService;
	
	@Autowired
	private boardService boardService;
	
	@Autowired
	private artService artService;
	
	@Autowired
	private artistService artistService;

	@Autowired
	private memberService memberService;
	
	@RequestMapping("artistForm.do")
	public ModelAndView artistForm() {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> result = new HashMap<>();
		result = artistService.selectTopArtist();
		mav.addAllObjects(result);
		mav.addObject("viewChoice", 1);
		mav.setViewName("artistForm");
		return mav;
	}

	@RequestMapping("searchArtist.do")
	public void searchArtist() {}

	@RequestMapping("genreArtist.do")
	public void genreArtist() {}

	@RequestMapping("artForm.do")
	public ModelAndView artForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("originalList", artService.selectTopArt("original"));
		mav.addObject("paintingList", artService.selectTopArt("painting"));
		mav.addObject("sculptureList", artService.selectTopArt("sculpture"));
		mav.addObject("viewChoice", 1);
		mav.setViewName("artForm");
		return mav;
	}

	@RequestMapping("searchArt.do")
	public ModelAndView searchArt(@RequestParam(defaultValue="0")int type, @RequestParam(defaultValue="1")int page,
			@RequestParam(required=false)String searchWord, @RequestParam(required=false)String genre) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> params = new HashMap<>();
		params.put("page", page);
		params.put("type", type);
		params.put("searchWord", searchWord);
		params.put("genre", genre);
		if (type==1) {
			params.put("title", searchWord);
		}
		if (type==2) {
			params.put("nickname", searchWord);
		}
		if (type==3) {
			params.put("content", searchWord);
		}
		if (type==4) {
			params.put("title", searchWord);
			params.put("content", searchWord);
		}
		HashMap<String, Object> result = new HashMap<>();
		result = artService.searchArt(params, page);
		mav.addAllObjects(params);
		mav.addAllObjects(result);
		mav.addObject("viewChoice", 2);
		mav.setViewName("artForm");
		return mav;
	}

	@RequestMapping("genreArt.do")
	public ModelAndView genreArt(@RequestParam(defaultValue="1")int page, int genre) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> result = new HashMap<>();
		String genreStr = null;
		if (genre==1) {
			genreStr = "original";
		}
		if (genre==2) {
			genreStr = "painting";
		}
		if (genre==3) {
			genreStr = "sculpture";
		}
		result = artService.selectRecentArt(genreStr, page);
		mav.addAllObjects(result);
		mav.addObject("genre", genreStr);
		mav.addObject("genreInt", genre);
		mav.addObject("viewChoice", 3);
		mav.setViewName("artForm");
		return mav;
	}

	@RequestMapping("selectOneArt.do")//작품 상세페이지로 이동
	public String selectOneArt(@RequestParam int no, Model model) {
		//해당 작품 정보와 댓글 정보를 담고 상세 페이지로 이동함
		//art 객체 : 상세 정보
		//comment 객체 : 해당 작품에 달린 댓글들
		
		art art = new art();
		art = artService.selectOneArt(no);
		model.addAttribute(art);

		return "artDetail";
	}

	@RequestMapping("artComment.do")
	public void artComment() {}	

	@RequestMapping("artReComment.do")
	public void artReComment() {}

	@RequestMapping("artPayForm.do") //결제 폼 요청
	public String artPayForm(HttpServletRequest request, Model model) throws ParseException {
		
//		String id  = (String)request.getSession().getAttribute("id"); //세션에서 id 가져오기
		String id = "test";
		
		//art 자료 객체 생성하여 value 대입
		//String 으로 넘어온 값들 모델 클래스 자료형에 맞게 형변환!
		art art = new art();
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
		int no = Integer.parseInt(request.getParameter("no"));
		art.setNo(no);
		art.setContent(request.getParameter("conetent"));
		Date date1 = dateformat.parse((request.getParameter("artDate")));
		art.setArtDate(date1);
		int price = Integer.parseInt(request.getParameter("price"));
		art.setPrice(price);
		art.setId("id");
		art.setGenre("genre");
		
		//member 객체 생성하여 주문자 정보 가져오기
		member member = new member();
		member = memberService.selectOneMember(id);
		
		
		//주문 번호 생성
		//고유한 값이 필요하기에 생성
		//주문품목명 + 구매자 id + 구입한 시간
		String orderNumber = request.getParameter("no") + "_" 
								+ id + "_"
								+ new Date().getTime();
		
		//각 정보들 모델에 담아서 결제 폼으로 이동!
		model.addAttribute(member);
		model.addAttribute(art);
		model.addAttribute("orderNumber", orderNumber);
		model.addAttribute("payMethod", request.getParameter("payMethod"));

		return "artPayForm";
	}

	@RequestMapping("artPay.do") //결제 액션 실행
	public void artPay(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//카드 결제 시 수행되는 메소드
		//결제 성공 시에 해당 정보를 받아 pay 테이블에 삽입하기 위함
		
		pay pay = new pay();
		int no = Integer.parseInt(request.getParameter("no"));
		pay.setNo(no);
		pay.setId(request.getParameter("customer_uid"));
//		int isCheck = Integer.parseInt(request.getParameter("isCheck"));
//		pay.setIsCheck(isCheck);
		pay.setIsCheck(0);
		pay.setAddr(request.getParameter("buyer_addr"));
		pay.setPhone(request.getParameter("buyer_tel"));
		pay.setName(request.getParameter("buyer_name"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		pay.setTotalPrice(amount);
		pay.setPayMethod(1);
		pay.setState(1);
		pay.setOrderNumber(request.getParameter("merchant_uid"));
		
		int result = artService.insertArtPay(pay);
		
		//DB입력 성공/실패 여부 확인 후 JSON으로 바꿔주고
		//다시 페이지로 전달
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("result", result);
		response.getWriter().println(jsonObj);
	}

	@RequestMapping("lectureForm.do") // lecture 게시판으로 이동
	public ModelAndView lectureForm() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("recentLectureA", lectureService.selectRecentLectureA());
		mav.addObject("recentLectureG", lectureService.selectRecentLectureG());
		mav.addObject("viewChoice", 1);
		mav.setViewName("lectureForm");
		return mav;
	}

	@RequestMapping("allLectureA.do")
	public ModelAndView allLectureA(@RequestParam(defaultValue="1")int page) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> result = new HashMap<>();
		result = lectureService.selectAllLectureA(page);
		mav.addAllObjects(result);
		mav.addObject("viewChoice", 3);
		mav.addObject("who", "A");
		mav.setViewName("lectureForm");
		return mav;
	}

	@RequestMapping("allLectureG.do")
	public ModelAndView allLectureG(@RequestParam(defaultValue="1")int page) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> result = new HashMap<>();
		result = lectureService.selectAllLectureG(page);
		mav.addAllObjects(result);
		mav.addObject("viewChoice", 3);
		mav.addObject("who", "G");
		mav.setViewName("lectureForm");
		return mav;
	}

	@RequestMapping("searchLecture.do")
	public ModelAndView searchLecture(@RequestParam(defaultValue="0")int type, @RequestParam(defaultValue="1")int page,
			@RequestParam(required=false)String searchWord, @RequestParam(required=false)String genre) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> params = new HashMap<>();
		params.put("page", page);
		params.put("type", type);
		params.put("searchWord", searchWord);
		params.put("genre", genre);
		if (type==1) {
			params.put("title", searchWord);
		}
		if (type==2) {
			params.put("nickname", searchWord);
		}
		if (type==3) {
			params.put("content", searchWord);
		}
		if (type==4) {
			params.put("title", searchWord);
			params.put("content", searchWord);
		}
		HashMap<String, Object> result = new HashMap<>();
		result = lectureService.searchLecture(params, page);
		mav.addAllObjects(result);
		mav.addAllObjects(params);
		mav.addObject("viewChoice", 2);
		mav.setViewName("lectureForm");
		return mav;
	}	

	@RequestMapping("addLectureForm.do") //강의 등록 폼 요청
	public void addLectureForm() {}

	@RequestMapping("addLecture.do") //lecture 테이블에 insert 요청
	public String addLecture(HttpServletRequest request, @RequestParam("ufile") MultipartFile ufile) throws ParseException {
		lecture lecture = new lecture();
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd"); //String으로 넘어오기 때문에 형 변환!
		lecture.setTitle(request.getParameter("title"));
		lecture.setPlace(request.getParameter("place"));
		lecture.setGenre(request.getParameter("genre"));
		Date date1 = dateformat.parse((request.getParameter("startDate"))); //String으로 넘어오기 때문에 형 변환!
		lecture.setStartDate(date1);
		Date date2 = dateformat.parse((request.getParameter("endDate"))); //String으로 넘어오기 때문에 형 변환!
		lecture.setEndDate(date2);
		int num = Integer.parseInt(request.getParameter("maxPeople")); //String으로 넘어오기 때문에 형 변환!
		lecture.setMaxPeople(num);
		lecture.setContent(request.getParameter("content"));
		lectureService.insertLecture(lecture, ufile);
		return "redirect:myLectureFormA.do";
	}

	@RequestMapping("selectOneLecutre.do")
	public void selectOneLecutre() {}

	@RequestMapping("lectureComment.do")
	public void lectureComment() {}

	@RequestMapping("lectureReComment.do")
	public void lectureReComment() {}

	@RequestMapping("updateLectureForm.do")
	public void updateLectureForm() {}

	@RequestMapping("updateLecture.do")
	public void updateLecture() {}
	
	@RequestMapping("deleteLecture.do")
	public void deleteLecture() {}
	
	@RequestMapping("lectureAttendForm.do")
	public void lectureAttendForm() {}
	
	@RequestMapping("lectureAttend.do")
	public void lectureAttend() {}
	
	@RequestMapping("boardForm.do") //자유게시판 이동
	public void boardForm() {}

	@RequestMapping("searchBoard.do")
	public void searchBoard() {}

	@RequestMapping("writeBoardForm.do") //자유게시판 글쓰기 이동
	public void writeBoardForm() {}
	
	@RequestMapping("writeBoard.do") 
	public String writeBoard(HttpServletRequest request) {
		//입력된 데이터들을 art 객체로 받아서 테이블에 insert
		//아이디 체크 후 함수 호출
		//관리자 : boardService.selectNotice
		//게스트 : boardService.selectBoard
		
		board board = new board();
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setId(request.getParameter("id"));
		boardService.insertBoard(board);
		return "redirect:artistMyPage.do";
	}

	@RequestMapping("selectOneBoard.do")
	public void selectOneBoard() {}

	@RequestMapping("updateBoardForm.do")
	public void updateBoardForm() {}

	@RequestMapping("updateBoard.do")
	public void updateBoard() {}

	@RequestMapping("deleteBoard.do")
	public void deleteBoard() {}
	
	@RequestMapping("boardComment.do")
	public void boardComment() {}

	@RequestMapping("boardReComment.do")
	public void boardReComment() {}
	
	@RequestMapping("qnaForm.do") //QnA게시판 이동
	public void qnaForm() {}	

	@RequestMapping("selectOneQna.do")
	public void selectOneQna() {}	

	@RequestMapping("searchQna.do")
	public void searchQna() {}

	@RequestMapping("writeQnaForm.do") //QnA게시판 글쓰기 이동
	public void writeQnaForm() {}
	
	@RequestMapping("writeQna.do") 
	public String writeQna(HttpServletRequest request) { 
		qna qna = new qna();
		
		qna.setTitle(request.getParameter("title"));
		qna.setId(request.getParameter("id"));
		qna.setContent(request.getParameter("content"));
		qna.setPw(request.getParameter("pw"));
		boardService.insertQna(qna);
		return "redirect:artistMyPage.do";
	}
	
	@RequestMapping("updateQnaForm.do")
	public void updateQnaForm() {}

	@RequestMapping("updateQna.do")
	public void updateQna() {}	

	@RequestMapping("deleteQna.do")
	public void deleteQna() {}	

	@RequestMapping("qnaComment.do")
	public void qnaComment() {}	

	@RequestMapping("qnaReComment.do")
	public void qnaReComment() {}	

}// public class의 끝.
