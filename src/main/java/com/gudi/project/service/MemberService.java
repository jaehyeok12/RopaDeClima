package com.gudi.project.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.project.dao.MemberDAO;
import com.gudi.project.dto.CommentDTO;

@Service
public class MemberService {
	
	@Autowired MemberDAO dao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public String login(String id, String pw) {
		logger.info("로그인 서비스");
		return dao.login(id,pw);
	}

	public boolean overlay(String id) {
		String overlayId = dao.overlay(id);
		logger.info("overlay ID : "+overlayId);		
		return overlayId == null ? false : true;
	}

	public int join(String id, String pw, String pw2, String name, String nick, String birth, String phone,
			String gender) {
		logger.info("회원가입 서비스");
		return dao.join(id, pw, pw2, name, nick, birth, phone, gender);
	}

	public boolean over(String nickName) {
		String overNickName = dao.over(nickName);
		logger.info("over nickName : "+overNickName);		
		return overNickName == null ? false : true;
	}

	public String find_idForm1(String name, String phone) {
		
		return dao.find_idForm1(name,phone);
	}

	public String find_pwForm_2(String name, String id) {
		
		logger.info("비밀번호 찾기");
		
		return dao.find_pwForm_2(name,id);
	}

	public int pwUpdate(String newPw, String id) {
		
		return dao.pwUpdate(newPw,id);
	}

	public int profileInsert(int mem_num) {
		// TODO Auto-generated method stub
		return dao.profileInsert(mem_num);
	}

	public int selectMemNum(String id) {
		// TODO Auto-generated method stub
		return dao.selectMemNum(id);
	}

	public int profilePhoto(int mem_num) {
		
		return dao.profilePhoto(mem_num);
	}


	public ArrayList<CommentDTO> commentDetail(int boardNum) {
		
		return dao.commentDetail(boardNum);
	}

	public int commentAdd(int boardNum, int memNum, String commentID) {
		
		return dao.commentAdd(boardNum,memNum,commentID);
	}

	public int del(int comt_num) {
		
		return dao.del(comt_num);
	}

	public void commentUpdate(int comt_num, String acontent) {
		dao.commentUpdate(comt_num,acontent);
	}

	

	

	

	



	


	

}









