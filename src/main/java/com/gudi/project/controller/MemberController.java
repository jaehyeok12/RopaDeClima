package com.gudi.project.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gudi.project.dto.CommentDTO;
import com.gudi.project.service.MemberService;

@Controller
public class MemberController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired MemberService service;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest req) {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		logger.info("id : " + id + "/" + "pw : " + pw);

		
		String loginId = service.login(id, pw);
		logger.info("loginId : " + loginId);
		int mem_num = service.selectMemNum(id);//$$$$$$$$
		logger.info("mem_num : " + mem_num);
		

		if (loginId != null && !loginId.equals("")) {
			
			HttpSession session = req.getSession();
			session.setAttribute("loginId", loginId);
			session.setAttribute("memNum", mem_num);
		} else {
			model.addAttribute("msg", "아이디 또는 패스워드를 확인해 주세요");
		}

		logger.info("mem_num : " + mem_num);
		
		return "redirect:/";
	}

	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm(Model model) {

		return "join";
	}

	@RequestMapping(value = "/ajaxJoin")
	@ResponseBody
	public HashMap<String, Object> ajaxJoin(@RequestParam HashMap<String, String> params) {

		logger.info("params : {}", params);
		String id = params.get("id");
		String pw = params.get("pw");
		String pw2 = params.get("pw2");
		String name = params.get("name");
		String nick = params.get("nick");
		String birth = params.get("birth");
		String phone = params.get("phone");
		String gender = params.get("gender");
		logger.info(id + pw + pw2 + name + nick + birth + phone + gender);

		// 회원가입 등록
		int row = service.join(id, pw, pw2, name, nick, birth, phone, gender);
		// 회원정보 넘버값 조회
		int mem_num = service.selectMemNum(id);
		// 프로필 등록
		int result = service.profileInsert(mem_num);

		if (row < 0) {

		}

		logger.info("mem_num : " + mem_num);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", row);

		return map;
	}

	@RequestMapping(value = "/overlay")
	@ResponseBody
	public HashMap<String, Object> overlay(@RequestParam String id) {
		boolean overlay = true;
		logger.info("아이디 중복 체크 : " + id);
		HashMap<String, Object> map = new HashMap<String, Object>();

		overlay = service.overlay(id);

		map.put("overlay", overlay);
		return map;
	}

	@RequestMapping(value = "/over")
	@ResponseBody
	public HashMap<String, Object> over(@RequestParam String nickName) {
		boolean over = true;
		logger.info("닉네임 중복 체크 : " + nickName);
		HashMap<String, Object> map = new HashMap<String, Object>();

		over = service.over(nickName);

		map.put("over", over);
		return map;
	}

	@RequestMapping(value = "/find_id", method = RequestMethod.GET)
	public String find_id(Model model) {

		return "find_idForm";
	}

	@RequestMapping(value = "/find_idForm_2", method = RequestMethod.POST)
	public String find_idForm(Model model, HttpServletRequest req) {

		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		logger.info("name : " + name + " phone : " + phone);

		String page = "/find_idForm";
		String loginId = service.find_idForm1(name, phone);

		logger.info("loginId : " + loginId);

		if (loginId != null && !loginId.equals("")) {
			page = "loginEmail";
			HttpSession session = req.getSession();
			session.setAttribute("loginId", loginId);
			logger.info(loginId);
		} else {
			model.addAttribute("msg", "입력한 정보가 없습니다.");
		}

		return page;
	}

	@RequestMapping(value = "/find_pw", method = RequestMethod.GET)
	public String find_pw(Model model) {

		return "find_pwForm";
	}

	@RequestMapping(value = "/find_pwForm_2", method = RequestMethod.GET)
	public String find_pwForm_2(Model model, HttpServletRequest req) {

		String name = req.getParameter("name");
		String id = req.getParameter("id");

		logger.info("name : " + name + " id : " + id);
		String page = "find_pwForm";

		String loginPw = service.find_pwForm_2(name, id);
		if (loginPw != null && !loginPw.equals("")) {
			page = "find_pwForm_2";
			req.setAttribute("id", id);
			model.addAttribute("msg", "조회완료!");
			logger.info(loginPw);
		} else {
			model.addAttribute("msg", "입력하신 정보가 없습니다.");
		}

		return page;
	}

	@RequestMapping(value = "/pwUpdate", method = RequestMethod.GET)
	public String pwUpdate(Model model, HttpServletRequest req) {

		String newPw = req.getParameter("newPw");
		String id = req.getParameter("id");

		logger.info(newPw + "/" + id);
		String page = "find_pwForm_2";

		int pwUpt = service.pwUpdate(newPw, id);
		logger.info("pwUpt : " + pwUpt);
		if (pwUpt > 0) {
			page = "index";

		} else {
			model.addAttribute("msg", "사용 가능하지 않은 비밀번호입니다.");
		}

		return page;
	}

	
	// 게시글 상세보기
	@RequestMapping(value = "/detail")
	public String detail(Model model, HttpSession session, HttpServletRequest req) {
		logger.info("게시글 상세보기");

		int boardNum = Integer.parseInt(req.getParameter("post.board_num"));
		System.out.println("boardNum:" + boardNum);
		
		ArrayList<CommentDTO> commentDetail = service.commentDetail(boardNum);
		model.addAttribute("commentDetail", commentDetail);
		
//		//일반포문
//		for(int i = 0; i<commentDetail.size(); i++) {
//			commentDetail.get(i).getBoard_num();
//		}
//		
//		//확장포문
//		for(CommentDTO comment : commentDetail) {
//			comment.getBoard_num();
//		}
		
		//게시글 넘버 리스트 받은거 0번째 가져오기.
//		System.out.println("commentDetail.board_num : "+commentDetail.get(0).getBoard_num());
		// int comtNum = Integer.parseInt(req.getParameter("post.comt_num"));
		model.addAttribute("boardNum", boardNum);
		// model.addAttribute("comtNum", comtNum);

		logger.info("commentDetail : " + commentDetail);

		logger.info("boardNum :" + boardNum);

		return "detail";
	}
	
	// 댓글 작성 기능
	@RequestMapping(value = "/commentAdd")
	@ResponseBody
	public HashMap<String, Object> commentAdd(HttpSession session, HttpServletRequest req,@RequestParam("boardNum") int boardNum) {
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (session.getAttribute("memNum") != null) {
			int memNum = Integer.parseInt(req.getParameter("memNum"));
			String commentID = req.getParameter("commentID");
			logger.info("boardNum :" + boardNum + "memNum : " + memNum + "commentID" + commentID);
			int commentAdd = service.commentAdd(boardNum, memNum, commentID);
			
			map.put("commentAdd", commentAdd);
			map.put("login", true);
		} else {
			map.put("login", false);
		}
		return map;
	}
	
	// 댓글 수정 기능
	@RequestMapping(value = "/updateComment")
	@ResponseBody
	public HashMap<String, Object> updateComment(HttpSession session,
			@RequestParam("comt_num") int comt_num,
			@RequestParam("acontent") String acontent) {
		System.out.println("------------------------------------------");
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (session.getAttribute("memNum") != null) {
			logger.info("comt_num :" + comt_num + "acontent : " + acontent);
			
			service.commentUpdate(comt_num,acontent);
			
			map.put("login", true);
			
		} else {
			map.put("login", false);
		}
		return map;
	}

	// 댓글 삭제 기능
	@RequestMapping(value="/del")
	@ResponseBody 
	public HashMap<String, Object> del(HttpSession session, HttpServletRequest req){
		System.out.println("=============================================");
		HashMap<String, Object> map = new HashMap<String, Object>();
		if(session.getAttribute("memNum")!= null){
			System.out.println("==================1111===========================");
			int comt_num = Integer.parseInt(req.getParameter("comt_num"));
			System.out.println("comt_num:+"+comt_num);
			int delete = service.del(comt_num);

			map.put("delete", delete); 
			map.put("login", true); 
		}else { 
			map.put("login",false); 
		} 
		return map; 
	}
	
	// 로그아웃 기능
	@RequestMapping(value="/logout")
	public String logout(HttpSession session, HttpServletRequest req){
		
		session = req.getSession();
		session.invalidate();
		
		return "index";
	}
}
