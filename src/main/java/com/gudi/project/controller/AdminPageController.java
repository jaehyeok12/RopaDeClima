package com.gudi.project.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gudi.project.dao.AdminMainDAO;

@Controller
public class AdminPageController {

	/**
	 * Admin페이지에서 해야 할 일
	 * 1. 메인 - 신고리스트, 공지 리스트, 최근 가입 리스트, 최근 게시글 리스트
	 * 최신순, 5개 씩 페이징
	 * 갱신
	 * 2. 유저 리스트 - 유저 리스트 가져와야 할 데이터 10개씩 페이징
	 * 3. 유저 상세 리스트
	 * 4. 게시글 리스트
	 * 5. 신고 결과 리스트
	 * 6. 최고관리자 - 의상, 색상, 신고, 날씨 추가 및 갱신 
	 * */
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired AdminMainDAO amDAOs;
	@ResponseBody
	@RequestMapping(value = "/adminJoin", method = RequestMethod.POST)
	public HashMap<String, Object> admin(Model model) {
		//최근 신고 리스트 조회
		logger.info("신고 리스트 조회 중..");
		amDAOs.recDesList();
		logger.info("공지 리스트 조회 중..");
		//최근 가입 유저 리스트 조회
		logger.info("최근 가입 유저 리스트 조회 중..");
		//최근 게시글 리스트 조회
		logger.info("최근 게시글 리스트 조회 중..");
		
		HashMap map = new HashMap<>();
		return map;
	}

}
