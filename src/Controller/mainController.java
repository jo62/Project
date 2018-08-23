package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import Model.member;
import Service.memberService;


@Controller
public class mainController {
	@Autowired
	private memberService memberService;
	
	// 메인 페이지 이동
		@RequestMapping("main.do") 
		public void main() {}
		
		@RequestMapping("loginForm.do")
		public void loginForm() {}
		
		@RequestMapping("joinForm.do")
		public void joinForm() {}
		
		@RequestMapping("join.do")
		public String join(member member, @RequestParam("pwCheck") String pwCheck, 
				@RequestParam(value="uProfile", required=false) MultipartFile uProfile, 
				@RequestParam(value="uFile", required=false) MultipartFile uFile,
				@RequestParam(value="datepicker1", required=false) String datepicker1,
				@RequestParam(value="datepicker2", required=false) String datepicker2) throws ParseException {
			Date birth = null;
			if(datepicker1 != null) {
				birth = new SimpleDateFormat("yyyyMMdd").parse(datepicker1);
			} else if(datepicker2 != null) {
				birth = new SimpleDateFormat("yyyyMMdd").parse(datepicker2);
			}
			member.setBirth(birth);
			System.out.println(member);
			
			if(memberService.insertMember(member, uProfile, uFile) == 1) {
				return "redirect:main.do";
			} else {
				return "redirect:joinForm.do";
			}
		}
		
		@RequestMapping("login.do")
		public String login(HttpSession session, String id, String pw) {
			if(memberService.login(id, pw) == 1) {
				session.setAttribute("id", id);
			
				return "redirect:main.do";
			} else {
				return "redirect:loginForm.do";
			}
		}
		
		@RequestMapping("adminForm.do")
		public void adminForm() {}
		
		@RequestMapping("searchMember.do")
		public void searchMember() {}
		
		@RequestMapping("selectAllMember.do")
		public void selectAllMember(HttpServletRequest req, HttpServletResponse resp) throws IOException {
			int page = Integer.parseInt(req.getParameter("page"));
			JSONObject jsonObject = new JSONObject();
			HashMap<String, Object> params = new HashMap<>();
			HashMap<String, Object> memberList = memberService.selectAllMember(params, page);
			
			jsonObject.put("member", memberList);
			
			resp.setContentType("text/html; charset=UTF-8"); 
			PrintWriter pw = resp.getWriter();
			pw.println(jsonObject);
		}
		
		@RequestMapping("blackList.do")
		public void blackList() {}
		
		@RequestMapping("searchApproveArtist.do")
		public void searchApproveArtist() {}
		
		@RequestMapping("approveView.do")
		public void approveView() {}
		
		@RequestMapping("updateApproveArtist.do")
		public void updateApproveArtist() {}
		
		@RequestMapping("updateRefuseArtist.do")
		public void updateRefuseArtist() {}
		
		@RequestMapping("updateMemberForm.do")
		public void updateMemberForm() {}
		
		@RequestMapping("updateMember.do")
		public void updateMember() {}
		
		@RequestMapping("myLectureFormG.do")
		public void myLectureFormG(HttpSession session, HttpServletResponse response, @RequestParam(defaultValue="1") int pageA, @RequestParam(defaultValue="1") int pageG) 
				throws ServerException, IOException{
			String id = (String)session.getAttribute("id"); 
			response.setCharacterEncoding("UTF-8");
			PrintWriter pw = response.getWriter();

			HashMap<String, Object> params = new HashMap<>();
			params.put("pageA", pageA);
			params.put("pageG", pageG);
			HashMap<String, Object> resultA = new HashMap<>();
			HashMap<String, Object> resultG = new HashMap<>();
			resultA = memberService.selectMyAttendLec(id, pageA, params);	// 강의신청 map을 resultA HashMap에 담기
			resultG = memberService.selectGatherLec(id, pageG, params); // 모집 중인 강의 map을 resultG HashMap에 담기
			
			JSONObject jsonObj = new JSONObject();					// map을 담을 JSONObject 생성
			jsonObj.put("attendList", resultA.get("attendList"));	// 강의 신청 map JSONObject에 담기
			jsonObj.put("currentA", resultA.get("currentA"));
			jsonObj.put("startA", resultA.get("startA"));
			jsonObj.put("endA", resultA.get("endA"));
			jsonObj.put("lastA", resultA.get("lastA"));
			
			jsonObj.put("gatherList", resultG.get("gatherList"));	// 모집 중인 강의 map JSONObject에 담기	
			jsonObj.put("currentG", resultG.get("currentG"));
			jsonObj.put("startG", resultG.get("startG"));
			jsonObj.put("endG", resultG.get("endG"));
			jsonObj.put("lastG", resultG.get("lastG"));
			pw.println(jsonObj); // printWriter로 뷰에 JSONObject 보내기.
		}
		
		@RequestMapping("myOrderFormG.do")
		public void myOrderFormG(HttpSession session, HttpServletResponse response, @RequestParam(defaultValue="1") int pageBuy) throws ServletException, IOException {
			String id = (String)session.getAttribute("id"); 
			response.setCharacterEncoding("UTF-8");
	    	PrintWriter pw = response.getWriter();
	    	HashMap<String, Object> params = new HashMap<>();
	    	params.put("pageBuy", pageBuy);
	    	HashMap<String, Object> resultBuy = new HashMap<>();
	    	resultBuy = memberService.selectBuyingArt(id, pageBuy, params);
	    	
	    	JSONObject jsonObj = new JSONObject();
	    	jsonObj.put("buyingList", resultBuy.get("buyingList"));	// 구매내역 map을 JSONObject에 담기
			jsonObj.put("currentBuy", resultBuy.get("currentBuy"));
			jsonObj.put("startBuy", resultBuy.get("startBuy"));
			jsonObj.put("endBuy", resultBuy.get("endBuy"));
			jsonObj.put("lastBuy", resultBuy.get("lastBuy"));
			pw.println(jsonObj);
		}	
		
		@RequestMapping("feed.do")
		public void feed() {}
		
		@RequestMapping("myPage.do")
		public String myPage(HttpSession session) {				// 권한에 따라 이동할 페이지 다름  ★ 코드 추가해야함
			String id = (String) session.getAttribute("id");
			member member = memberService.selectOneMember(id);
			
			if (member.getIsCheck() == 1) {
				return "redirect:adminForm.do";
			} else if (member.getIsCheck() == 2) {
				return "artistMyPage";	// 권한이 아티스트(Artist)인 경우
			} else {
				return "myLectureFormG";	// 권한이 사용자(Guest)인 경우
			}
		}
		
		@RequestMapping("updateAlarm.do")
		public void updateAlarm() {}
		
		@RequestMapping("deleteAlarm.do")
		public void deleteAlarm() {}
		
		@RequestMapping("selectAlarm.do")
		public void selectAlarm() {}
		
		@RequestMapping("check.do")
		public void check(HttpServletRequest req, HttpServletResponse resp) throws ParseException, IOException {
			String id = req.getParameter("id");
			String pw = req.getParameter("pw");
			String pwd = req.getParameter("pwd"); // 비밀번호 확인
			String name = req.getParameter("name");
			String phone = req.getParameter("phone");
			if(req.getParameter("guestAddr") != null) {
				String addr = req.getParameter("guestAddr");
			} else if(req.getParameter("artistAddr") != null) {
				String addr = req.getParameter("artistAddr");
			}
			String email = req.getParameter("email");
			String nickname = req.getParameter("nickname");
//			Date birth = new SimpleDateFormat("yy-mm-dd").parse(req.getParameter("birth"));
			String content = req.getParameter("content");
			boolean idCheck, pwCheck, nameCheck, phoneCheck, addrCheck, emailCheck, nicknameCheck, contentCheck;
			JSONObject jsonObject = new JSONObject();
		
			
			if (memberService.selectOneMember(id) == null && id != "") {
				idCheck = true;
			} else {
				idCheck = false;
			}
			if (pw != "" && pw == pwd) {
				pwCheck = true;
			} else {
				pwCheck = false;
			}
			if (memberService.selectOneNickname(nickname) == null && nickname != "") {
				nicknameCheck = true;
			} else {
				nicknameCheck = false;
			}
			
			jsonObject.put("idCheck", idCheck);
			jsonObject.put("pwCheck", pwCheck);
			jsonObject.put("nicknameCheck", nicknameCheck);
			
			resp.setContentType("text/html; charset=UTF-8");
			PrintWriter pwr = resp.getWriter();
			pwr.println(jsonObject);
		}
		
		@RequestMapping("logout.do")
		public String logout(HttpSession session) {
			session.invalidate();
			
			return "redirect:main.do";
		}
		
	// 주문내역 조회 페이지로 이동
	@RequestMapping("myOrderFormG0.do") 
	public String myOrderFormG0() {
		return "myOrderFormG";
	}
	// 강의내역 조회 페이지로 이동
	@RequestMapping("myLectureFormG0.do") 
	public String myLectureFormG0() {
		return "myLectureFormG";
	}
} // public class의 끝.

//	@RequestMapping("isCheckMember.do")
//	public ModelAndView isCheckMember(HttpServletRequest request, HttpSession session) {
//		ModelAndView mav = new ModelAndView();
//		String id = (String) session.getAttribute("id");
//		String requestURI = request.getRequestURI();
//		mav.addObject("isCheck", memberService.selectOneMember(id).getIsCheck());
//		mav.setViewName(requestURI);
//		return mav;
//	}
