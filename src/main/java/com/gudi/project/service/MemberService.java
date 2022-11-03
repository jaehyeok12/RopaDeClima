package com.gudi.project.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.project.dao.memberDAO;

@Service
public class MemberService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired memberDAO dao;

	public String login(String id, String pw) {
	
		return dao.login(id,pw);
	}

	public boolean overlay(String id) {
		String overlayId = dao.overlay(id);
		logger.info("overlay ID : "+overlayId);		
		return overlayId == null ? false : true;
	}

	public int join(String id, String pw, String pw2, String name, String nick, String birth, String phone,
			String gender) {
		
		return dao.join(id, pw, pw2, name, nick, birth, phone, gender);
	}

	
	
	
	
	}


