package com.gudi.project.controller;

import java.util.ArrayList;
import java.util.HashMap;

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

import com.gudi.project.dao.AdminMainDAO;
import com.gudi.project.dao.AdminUserListDAO;
import com.gudi.project.dto.DecListDTO;

@Controller
public class AdminUserListController {

	/**
	 * 검색기능
	 * 전체조회 - 완
	 * 탈퇴처리 - 완
	 * 
	 * */
	Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired AdminUserListDAO aulDAOs;
	@ResponseBody
	@RequestMapping(value = "/userLoad", method = RequestMethod.GET)
	public HashMap<String, Object> admin(@RequestParam int page) {
		//최근 신고 리스트 조회
		logger.info("유저 리스트 조회 중..");
		
		int offset = (page-1)*10;
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row_Des = aulDAOs.cntUserList();
		logger.info("유저 리스트 개수 조회 : "+row_Des);
		int totalPages=row_Des/10;
		if(row_Des%10!=0) {
			totalPages++;
		}
		logger.info("유저 총 페이지 수 조회 : "+totalPages);
		
		map.put("total",totalPages);
		if(row_Des==0) {
			map.put("resUserList","조회된 유저 데이터가 없습니다.");
		}else {
			ArrayList<DecListDTO> list_Des = aulDAOs.userList(offset);
			map.put("list", list_Des);
		}
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/userBan", method = RequestMethod.GET)
	public HashMap<String, Object> userBan(@RequestParam int id) {
		//최근 신고 리스트 조회
		logger.info("삭제할 유저 번호 ==> " + id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		//유저 탈퇴 처리
		int result = aulDAOs.userBan(id);
		if(result==0) {
			map.put("resUserList","삭제 실패");
		}else {
			logger.info("삭제 성공");
			map.put("resultMSG", "삭제 성공");
		}
		//탈퇴처리 로그 남기기
		int admin_id = 5;
		int log = aulDAOs.banLog(id, admin_id);
		if(log==0) {
			logger.info("로그 추가 실패");
		}else {
			logger.info("로그 추가 성공");
		}
		
		return map;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/userRecover", method = RequestMethod.GET)
	public HashMap<String, Object> userRecover(@RequestParam int id, HttpSession session) {
		logger.info("삭제할 유저 번호 ==> " + id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		//유저 복구 처리
		int result = aulDAOs.userRecover(id);
		if(result==0) {
			map.put("resUserList","복구 실패");
		}else {
			logger.info("삭제 성공");
			map.put("resultMSG", "복구 성공");
		}
		//탈퇴처리 로그 남기기
		
		String admin_name = (String) session.getAttribute("id");
		logger.info("세션있어요? ==> " + admin_name);
		//세션 value로 기본키(유저 번호) 가져오기
		int admin_id = aulDAOs.getIdx(admin_name);
		logger.info("잘 가져 왔는가? ==> " + admin_id);
		
		int log = aulDAOs.recoverLog(id, admin_id);
		if(log==0) {
			logger.info("로그 추가 실패");
		}else {
			logger.info("로그 추가 성공");
		}
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/reviseAuth", method = RequestMethod.GET)
	public HashMap<String, Object> reviseAuth(@RequestParam String nickname,@RequestParam String auth, HttpSession session) {
		logger.info("권한을 수정할 유저 닉네임 ==> " + nickname);
		logger.info("어떤 권한으로?? ==> " + auth);
		HashMap<String, Object> map = new HashMap<String, Object>();
		//권한 수정 처리
		int result = aulDAOs.reviseAuth(nickname, auth);
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
		int admin_idx = aulDAOs.getIdx(admin_name);
		logger.info("관리자 잘 가져 왔는가? ==> " + admin_name);
		//유저
		int user_idx = aulDAOs.getNicknameToIdx(nickname);
		logger.info("유저 잘 가져 왔는가? ==> " + user_idx);
		
		int log = aulDAOs.reviseLog(user_idx, admin_idx, auth);
		if(log==0) {
			logger.info("로그 추가 실패");
		}else {
			logger.info("로그 추가 성공");
		}
		
		return map;
	}
	
	//검색
	@ResponseBody
	@RequestMapping(value = "/nickSearch", method = RequestMethod.GET)
	public HashMap<String, Object> nickSearch(@RequestParam String nickname, @RequestParam int page){
		logger.info("이 닉네임을 검색할게요.");
		logger.info(" ==> " + nickname);
		int offset = (page-1)*10;
		HashMap<String, Object> map = new HashMap<String, Object>();
		nickname = '%'+nickname+'%';
		int row_Des = aulDAOs.cntUserNickSearchList(nickname);
		logger.info("유저 수 조회 : "+row_Des);
		int totalPages=row_Des/10;
		if(row_Des%10!=0) {
			totalPages++;
		}
		logger.info("유저 총 페이지 수 조회 : "+totalPages);

		map.put("total",totalPages);
		
		ArrayList<DecListDTO> list_nickSearch = aulDAOs.nickSearch(nickname, offset);
		logger.info("조회된 검색 결과"+list_nickSearch.size());
		map.put("list", list_nickSearch);
		return map;
	}
	//닉네임과 권한
	@ResponseBody
	@RequestMapping(value = "/nickAuthSearch", method = RequestMethod.GET)
	public HashMap<String, Object> nickAuthSearch(@RequestParam String nickname, @RequestParam String auth, @RequestParam int page){
		logger.info("이 닉네임을 검색할게요.");
		logger.info(" ==> " + nickname);
		logger.info("이 권한을 검색할게요.");
		logger.info(" ==> " + auth);
		int offset = (page-1)*10;
		nickname = '%'+nickname+'%';
		
		int row_Des = aulDAOs.cntUserNickAndAuthSearchList(nickname, auth);
		logger.info("유저 수 조회 : "+row_Des);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalPages=row_Des/10;
		if(row_Des%10!=0) {
			totalPages++;
		}
		logger.info("유저 총 페이지 수 조회 : "+totalPages);

		map.put("totals",totalPages);
		
		
		ArrayList<DecListDTO> list_nickAuthSearch = aulDAOs.nickAuthSearch(nickname, auth, offset);
		logger.info("조회된 검색 결과"+list_nickAuthSearch.size());
		map.put("list", list_nickAuthSearch);
		
		return map;
	}
}