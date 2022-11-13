package com.gudi.project.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {
	//테스트용 클래스
	//이거 복붙해서 써요
	//여기다 코드쓰면 바보
	Logger logger = LoggerFactory.getLogger(this.getClass());
	/*
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("정상 실행");
		model.addAttribute("test", "test" );

		return "adminMain";
	}
	*/
}
