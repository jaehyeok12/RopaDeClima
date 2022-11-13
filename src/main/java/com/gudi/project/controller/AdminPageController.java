package com.gudi.project.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.datetime.DateFormatter;
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
	long curDate;
	Date date=null;
	String dateStr ="";
	ArrayList<String> dateStrs = null;
	@RequestMapping(value = "/")
	public String gotest(HttpSession session) {
		session.setAttribute("id", "관리자");//관리자 세션 등록 ==> 나중에 로그인한 계정으로 세션 Value 변경
		logger.info("세션 저장 했어요");
		return "adminMain";
	}

	@ResponseBody
	@RequestMapping(value = "/adminDes", method = RequestMethod.POST)
	public HashMap<String, Object> admin() {
		//최근 신고 리스트 조회
		logger.info("신고 리스트 조회 중..");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row_Des = amDAOs.cntDesList();
		dateStrs = new ArrayList<String>();
		logger.info("신고 리스트 개수 조회 : "+row_Des);
		map.put("desCnt",row_Des);
		if(row_Des==0) {
			map.put("resDes","조회된 신고 데이터가 없습니다.");
		}else {
			ArrayList<DecListDTO> list_Des = amDAOs.recDesList();
			logger.info("신고 리스트 조회 : "+list_Des.size());
			//시간 가져온다.
			for(int i=0; i<list_Des.size(); i++) {
				curDate = (long) list_Des.get(i).getDec_date().getTime();
				date = new Date(curDate);
				SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
				if (date != null)
				{
					dateStr = dateFormatter.format(date.getTime());
					dateStrs.add(dateStr);
				}
				logger.info(dateStr);
				
			}
			
			map.put("resDes", list_Des);
			map.put("resDateStrs", dateStrs);
			
		}
		return map;
	}
	@ResponseBody
	@RequestMapping(value = "/adminAdm", method = RequestMethod.POST)
	public HashMap<String, Object> adminAdm(Model model) {
		//최근 작성한 공지
		logger.info("공지 리스트 조회 중..");
		HashMap<String, Object> map = new HashMap<String, Object>();
		dateStrs = new ArrayList<String>();
		int row_Adm = amDAOs.cntAdmList();
		logger.info("공지 리스트 개수 조회 : "+row_Adm);
		map.put("AdmCnt",row_Adm);
		if(row_Adm==0) {
			map.put("resAdm","조회된 공지 데이터가 없습니다.");
		}else {
			ArrayList<DecListDTO> list_Adm = amDAOs.recAdmList();
			logger.info("공지 리스트 조회 : "+list_Adm.size());
			
			for(int i=0; i<list_Adm.size(); i++) {
				curDate = (long) list_Adm.get(i).getWrite_time().getTime();
				date = new Date(curDate);
				SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
				if (date != null)
				{
					dateStr = dateFormatter.format(date.getTime());
					dateStrs.add(dateStr);
				}
				logger.info(dateStr);
				
			}
			map.put("resAdm", list_Adm);
			map.put("resAdmDates", dateStrs);
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
		dateStrs = new ArrayList<String>();
		logger.info("최근 가입 리스트 개수 조회 : "+row_RecJoin);
		map.put("RecJoinCnt",row_RecJoin);
		if(row_RecJoin==0) {
			map.put("resRecJoin","조회된 최근 가입 데이터가 없습니다.");
		}else {
			ArrayList<DecListDTO> list_RecJoin = amDAOs.recJoinList();
			logger.info("최근 가입 리스트 조회 : "+list_RecJoin.size());
			
			for(int i=0; i<list_RecJoin.size(); i++) {
				curDate = (long) list_RecJoin.get(i).getMem_regDate().getTime();
				date = new Date(curDate);
				SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
				if (date != null)
				{
					dateStr = dateFormatter.format(date.getTime());
					dateStrs.add(dateStr);
				}
				logger.info(dateStr);
				
			}
			map.put("resRecJoin", list_RecJoin);
			map.put("resRecJoinDates", dateStrs);
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
			
			for(int i=0; i<list_Board.size(); i++) {
				curDate = (long) list_Board.get(i).getBoard_time().getTime();
				date = new Date(curDate);
				SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
				if (date != null)
				{
					dateStr = dateFormatter.format(date.getTime());
					dateStrs.add(dateStr);
				}
				logger.info(dateStr);
				
			}
			
			map.put("resBoard", list_Board);
			map.put("resBoardDates", dateStrs);
		}
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/goUser", method=RequestMethod.POST)
	public HashMap<String, Object> goUser(){
		HashMap<String, Object> map = new HashMap<String, Object>();
		return map;
	}
}

