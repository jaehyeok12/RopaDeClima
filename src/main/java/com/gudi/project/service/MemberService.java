package com.gudi.project.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.project.dao.memberDAO;


@Service
public class MemberService {
	
	@Autowired memberDAO dao;
	
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

	

}

