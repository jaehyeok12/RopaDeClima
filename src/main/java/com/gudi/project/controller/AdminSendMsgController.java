package com.gudi.project.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gudi.project.dao.AdminSendMsgDAO;

@Controller
public class AdminSendMsgController {
	//테스트용 클래스
	//이거 복붙해서 써요
	//여기다 코드쓰면 바보
	Logger logger = LoggerFactory.getLogger(this.getClass());
	Date date = null;
	
	@Autowired AdminSendMsgDAO admDAO;
	
	/*
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("정상 실행");
		model.addAttribute("test", "test" );

		return "adminMain";
	}
	*/
	
	@ResponseBody
	@RequestMapping(value = "/sendAdminMsg", method = RequestMethod.POST)
	public HashMap<String, Object> sendAdminMsg(@RequestParam String expDate, @RequestParam String content, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info(content);
		logger.info(expDate);
		LocalDate localToday = LocalDate.now();
		LocalDate localExpDate = LocalDate.parse(expDate);
		String resMSG = "오늘 이후의 날짜를 선택해주세요!!";
		
		//문자열을 sql.date로 변환
		date = Date.valueOf(expDate);
		
		//세션으로 현재 관리자 인덱스 가져오기
		String admin_name = (String) session.getAttribute("id");
		logger.info("세션있어요? ==> " + admin_name);
		//세션 value로 기본키(유저 번호) 가져오기
		int admin_id = admDAO.getIdx(admin_name);
		logger.info("잘 가져 왔는가? ==> " + admin_id);
		
		
		if(!localExpDate.isAfter(localToday)) {//오늘 이전의 날짜를 선택
		map.put("resMSG", resMSG);
		}else {//정상적인 선택 ==> 메세지를 테이블에 저장
			int isSuccess = admDAO.sendMSG(date, admin_id, content);
			if(isSuccess==0) {//실패
				resMSG="전송에 실패했습니다.";
				map.put("resMSG", resMSG);
			}else {//성공
				resMSG="전송에 성공했습니다.";
				map.put("resMSG", resMSG);
			}
		}
		
		return map;
		
		
	}
	
	
}
