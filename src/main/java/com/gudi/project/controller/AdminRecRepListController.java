package com.gudi.project.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gudi.project.dao.AdminBoardListDAO;
import com.gudi.project.dao.AdminRecRepListDAO;
import com.gudi.project.dto.DecListDTO;

@Controller
public class AdminRecRepListController {
	//테스트용 클래스
	//이거 복붙해서 써요
	//여기다 코드쓰면 바보
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired AdminRecRepListDAO arrlDAO;
	/*
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("정상 실행");
		model.addAttribute("test", "test" );

		return "adminMain";
	}
	 */
	long curDate=0;
	String dateStr="";
	Date date=null;
	ArrayList<String> dateStrs = null;
	String no_Datas = "조회된 게시글이 없습니다";


	@ResponseBody
	@RequestMapping(value = "/RecRepLoad", method = RequestMethod.GET)
	public HashMap<String, Object> RecRepLoad(){
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row_RecRep = arrlDAO.recRepCnt();
		dateStrs = new ArrayList<String>();

		logger.info("조회된 처리 결과 리스트의 개수 ==> " + row_RecRep);
		if(row_RecRep==0) {
			map.put("resBoard", no_Datas);
		}else {
			ArrayList<DecListDTO> RecRepList = arrlDAO.RecRepList();

			//처리 담당자 조회
			ArrayList<String> repRecManagerList = arrlDAO.recRepManagerList();
			logger.info(repRecManagerList.size()+"개");
			for(int i=0; i<RecRepList.size(); i++) {
				curDate = (long) RecRepList.get(i).getDec_date().getTime();
				date = new Date(curDate);
				SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
				if (date != null)
				{
					dateStr = dateFormatter.format(date.getTime());
					dateStrs.add(dateStr);
				}
				logger.info(dateStr);
			}
			map.put("repRecManager", repRecManagerList);
			map.put("RecRepLoad", RecRepList);
			map.put("RecRepDateStrs", dateStrs);
		}

		return map;

	}
	//라디오버튼 검색
	@ResponseBody
	@RequestMapping(value = "/stateRepSearch", method = RequestMethod.GET)
	public HashMap<String, Object> stateSearch(@RequestParam String state){
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row_board = arrlDAO.searchRepCnt(state);
		dateStrs = new ArrayList<String>();

		if(row_board==0) {
			map.put("resBoard", no_Datas);
		}else {
			ArrayList<DecListDTO> searchRepList = arrlDAO.searchRepList(state);
			
			//처리 담당자 조회
			ArrayList<String> repRecManagerList = arrlDAO.recRepManagerList();
			
			for(int i=0; i<searchRepList.size(); i++) {
				curDate = (long) searchRepList.get(i).getDec_date().getTime();
				date = new Date(curDate);
				SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
				if (date != null)
				{
					dateStr = dateFormatter.format(date.getTime());
					dateStrs.add(dateStr);
				}
				logger.info(dateStr);
			}
			map.put("repRecManagerList", repRecManagerList);
			map.put("searchRepList", searchRepList);
			map.put("RecRepDateStrs", dateStrs);
		}

		return map;

	}
}
