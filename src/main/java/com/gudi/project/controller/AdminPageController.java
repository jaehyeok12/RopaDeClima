package com.gudi.project.controller;

import java.util.ArrayList;
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
import com.gudi.project.dto.DecListDTO;

@Controller
public class AdminPageController {

	/**
	 * Admin페이지에서 해야 할 일
	 * 1. 메인 - 신고리스트, 공지 리스트, 최근 가입 리스트, 최근 게시글 리스트 - 완
	 * 최신순 - 완 , 5개 씩 페이징
	 * 갱신?
	 * 2. 유저 리스트 - 유저 리스트 가져와야 할 데이터 10개씩 페이징 - 완
	 * 3. 유저 상세 리스트 
	 * 4. 게시글 리스트 -완
	 * 5. 신고 결과 리스트 - 완 
	 * 6. 최고관리자 - 의상, 색상, 신고, 날씨 추가 및 갱신 
	 * */
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired AdminMainDAO amDAOs;
	@ResponseBody
	@RequestMapping(value = "/adminDes", method = RequestMethod.POST)
	public HashMap<String, Object> admin(Model model) {
		//최근 신고 리스트 조회
		logger.info("신고 리스트 조회 중..");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row_Des = amDAOs.cntDesList();
		logger.info("신고 리스트 개수 조회 : "+row_Des);
		map.put("desCnt",row_Des);
		if(row_Des==0) {
			map.put("resDes","조회된 신고 데이터가 없습니다.");
		}else {
			ArrayList<DecListDTO> list_Des = amDAOs.recDesList();
			logger.info("신고 리스트 조회 : "+list_Des.size());
			map.put("resDes", list_Des);
		}
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/adminAdm", method = RequestMethod.POST)
	public HashMap<String, Object> adminAdm(Model model) {
		//최근 작성한 공지
		logger.info("공지 리스트 조회 중..");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row_Adm = amDAOs.cntAdmList();
		logger.info("공지 리스트 개수 조회 : "+row_Adm);
		map.put("AdmCnt",row_Adm);
		if(row_Adm==0) {
			map.put("resAdm","조회된 공지 데이터가 없습니다.");
		}else {
			ArrayList<DecListDTO> list_Adm = amDAOs.recAdmList();
			logger.info("공지 리스트 조회 : "+list_Adm.size());
			map.put("resAdm", list_Adm);
		}
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/adminRecJoin", method = RequestMethod.POST)
	public HashMap<String, Object> adminRecJoin(Model model) {
		//최근 가입 유저 리스트 조회
		logger.info("최근 가입 유저 리스트 조회 중..");
		int row_RecJoin = amDAOs.cntRecJoinList();
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("최근 가입 리스트 개수 조회 : "+row_RecJoin);
		map.put("RecJoinCnt",row_RecJoin);
		if(row_RecJoin==0) {
			map.put("resRecJoin","조회된 최근 가입 데이터가 없습니다.");
		}else {
			ArrayList<DecListDTO> list_RecJoin = amDAOs.recJoinList();
			logger.info("최근 가입 리스트 조회 : "+list_RecJoin.size());
			map.put("resRecJoin", list_RecJoin);
		}
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/adminBoard", method = RequestMethod.POST)
	public HashMap<String, Object> adminBoard(Model model) {
		//최근 게시글 리스트 조회
		logger.info("최근 게시글 리스트 조회 중..");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row_Board = amDAOs.cntBoardList();
		logger.info("게시글 리스트 개수 조회 : "+row_Board);
		map.put("desCnt",row_Board);
		if(row_Board==0) {
			map.put("resBoard","조회된 게시글 데이터가 없습니다.");
		}else {
			ArrayList<DecListDTO> list_Board = amDAOs.recBoardList();
			logger.info("게시글 리스트 조회 : "+list_Board.size());
			map.put("res", list_Board);
		}
		return map;
	}
}

