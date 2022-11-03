package com.gudi.project.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gudi.project.service.MemberService;

@Controller
public class MemberController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired MemberService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		logger.info("정상 실행");
		return "index";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest req) {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		logger.info(id+"/"+pw);
		
		String page = "index";
		String loginId = service.login(id,pw);
		logger.info("loginId : "+loginId);
		
		if(loginId !=null && !loginId.equals("")) {
			page = "main";
			
			HttpSession session = req.getSession();
			session.setAttribute("loginId", loginId);
		}else {
			model.addAttribute("msg", "이메일, 패스워드를 다시 확인 하세요");
		}
		
		return page;
	}
		
	
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm(Model model) {
		return "join";
	}
	
	@RequestMapping(value="ajaxJoin")
	@ResponseBody
	public HashMap<String, Object> ajaxJoin(
			@RequestParam HashMap<String, String> params){
		
		logger.info("params : {}",params);
		String id = params.get("id");
		String pw = params.get("pw");
		String pw2 = params.get("pw2");
		String name = params.get("name");
		String nick = params.get("nick");
		String birth = params.get("birth");
		String phone = params.get("phone");
		String gender = params.get("gender");
		
		int row = service.join(id, pw, pw2, name, nick, birth, phone, gender);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("success", row);
		
		return map;
	}
	
	
	
	
	
	
	
	
	
	/*
	 * @RequestMapping(value="/overlay")
	 * 
	 * @ResponseBody public HashMap<String, Object> overlay(@RequestParam String
	 * id){ boolean overlay = true; logger.info("아이디 중복 체크 :"+id);
	 * 
	 * HashMap<String, Object> map = new HashMap<String, Object>();
	 * 
	 * overlay = service.overlay(id);
	 * 
	 * return map; }
	 */
	
	

}
