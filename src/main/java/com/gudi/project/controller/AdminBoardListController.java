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
import com.gudi.project.dto.DecListDTO;

@Controller
public class AdminBoardListController {
	//테스트용 클래스
	//이거 복붙해서 써요
	//여기다 코드쓰면 바보
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired AdminBoardListDAO ablDAO;
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
	@RequestMapping(value = "/boardLoad", method = RequestMethod.GET)
	public HashMap<String, Object> boardLoad(@RequestParam int page){
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row_board = ablDAO.boardCnt();

		int offset = (page-1)*10;

		dateStrs = new ArrayList<String>();

		logger.info("조회된 게시글의 개수 ==> " + row_board);
		int totalPages=row_board/10;
		if(row_board%10!=0) {
			totalPages++;
		}

		logger.info("게시글 총 페이지 수 조회 : "+totalPages);

		map.put("total",totalPages);

		if(row_board==0) {
			map.put("resBoard", no_Datas);
		}else {
			ArrayList<DecListDTO> boardList = ablDAO.boardLoad(offset);
			for(int i=0; i<boardList.size(); i++) {
				curDate = (long) boardList.get(i).getBoard_time().getTime();
				date = new Date(curDate);
				SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
				if (date != null)
				{
					dateStr = dateFormatter.format(date.getTime());
					dateStrs.add(dateStr);
				}
				logger.info(dateStr);
			}
			map.put("resBoardLoad", boardList);
			map.put("boardDateStrs", dateStrs);
		}

		return map;

	}


	//상태 변경
	@ResponseBody
	@RequestMapping(value = "/reviseState", method=RequestMethod.GET)
	public HashMap<String, Object> reviseState(@RequestParam String board, @RequestParam String state,  HttpSession session){

		HashMap<String, Object> map = new HashMap<String, Object>();
		//권한 수정 처리
		int result = ablDAO.reviseBoardState(board, state);
		if(result==0) {
			map.put("resultMSG","변경 실패");
		}else {
			logger.info("삭제 성공");
			map.put("resultMSG", "변경 성공");
		}
		//탈퇴처리 로그 남기기

		//닉네임으로 번호를 가져온다
		//관리자
		String admin_name = (String) session.getAttribute("id");
		logger.info("세션있어요? ==> " + admin_name);
		//세션 value로 기본키(유저 번호) 가져오기
		int admin_idx = ablDAO.getIdx(admin_name);
		//유저
		int user_idx = ablDAO.getNicknameToIdx(board);

		int log = ablDAO.reviseLog(user_idx, admin_idx, state);
		if(log==0) {
			logger.info("로그 추가 실패");
		}else {
			logger.info("로그 추가 성공");
		}


		return map;

	}
	//라디오버튼 검색
	@ResponseBody
	@RequestMapping(value = "/stateSearch", method = RequestMethod.GET)
	public HashMap<String, Object> stateSearch(@RequestParam String state, @RequestParam int page){
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row_board = ablDAO.searchCnt(state);
		dateStrs = new ArrayList<String>();
		int offset = (page-1)*10;

		logger.info("조회된 게시글의 개수 ==> " + row_board);
		if(row_board==0) {
			map.put("resBoard", no_Datas);
		}else {
			int totalPages=row_board/10;
			if(row_board%10!=0) {
				totalPages++;
			}

			logger.info("조회된 게시글의 페이지 수 ==> " + totalPages);
			map.put("total",totalPages);
			ArrayList<DecListDTO> searchList = ablDAO.searchList(state, offset);
			for(int i=0; i<searchList.size(); i++) {
				curDate = (long) searchList.get(i).getBoard_time().getTime();
				date = new Date(curDate);
				SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
				if (date != null)
				{
					dateStr = dateFormatter.format(date.getTime());
					dateStrs.add(dateStr);
				}
				logger.info(dateStr);
			}
			map.put("searchResBoard", searchList);
			map.put("boardDateStrs", dateStrs);
		}

		return map;

	}
	//email 검색
	@ResponseBody
	@RequestMapping(value = "/emailSearch", method = RequestMethod.GET)
	public HashMap<String, Object> emailSearch(@RequestParam String email, @RequestParam int page){
		HashMap<String, Object> map = new HashMap<String, Object>();
		email = "%"+email+"%";
		int row_board = ablDAO.searchEmailCnt(email);
		int offset = (page-1)*10;
		int totalPages=row_board/10;
		if(row_board%10!=0) {
			totalPages++;
		}
		logger.info("조회된 게시글의 페이지 수 ==> " + totalPages);
		map.put("total",totalPages);
		
		dateStrs = new ArrayList<String>();

		logger.info("조회된 게시글의 개수 ==> " + row_board);
		//if(row_board==0) {
		//	map.put("resBoard", no_Datas);
		//}else {
		ArrayList<DecListDTO> searchEmailList = ablDAO.searchEmailList(email, offset);
		logger.info("rotn : " + searchEmailList.size());
		for(int i=0; i<searchEmailList.size(); i++) {
			curDate = (long) searchEmailList.get(i).getBoard_time().getTime();
			date = new Date(curDate);
			SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
			if (date != null)
			{
				dateStr = dateFormatter.format(date.getTime());
				dateStrs.add(dateStr);
			}
			logger.info(dateStr);
			//}
		}
		map.put("searchResEmailBoard", searchEmailList);
		map.put("boardDateStrs", dateStrs);

		return map;

	}

	//nickname 검색
	@ResponseBody
	@RequestMapping(value = "/nicknameSearch", method = RequestMethod.GET)
	public HashMap<String, Object> nicknameSearch(@RequestParam String nickname, @RequestParam int page){
		HashMap<String, Object> map = new HashMap<String, Object>();
		nickname = '%'+nickname+'%';
		int row_board = ablDAO.searchNickCnt(nickname);
		dateStrs = new ArrayList<String>();
		int offset = (page-1)*10;
		int totalPages=row_board/10;
		if(row_board%10!=0) {
			totalPages++;
		}
		map.put("total",totalPages);
		
		logger.info("조회된 게시글의 개수 ==> " + row_board);
		//if(row_board==0) {
		//	map.put("resBoard", no_Datas);
		//}else {
		ArrayList<DecListDTO> searchNickList = ablDAO.searchNickList(nickname, offset);
		for(int i=0; i<searchNickList.size(); i++) {
			curDate = (long) searchNickList.get(i).getBoard_time().getTime();
			date = new Date(curDate);
			SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
			if (date != null)
			{
				dateStr = dateFormatter.format(date.getTime());
				dateStrs.add(dateStr);
			}
			logger.info(dateStr);
		}
		map.put("searchNickResBoard", searchNickList);
		map.put("boardDateStrs", dateStrs);
		//}

		return map;
	}
}
