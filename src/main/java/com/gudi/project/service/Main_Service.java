package com.gudi.project.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gudi.project.dao.MainDAO;
import com.gudi.project.dto.MainDTO;

@Service
public class Main_Service {

	@Autowired MainDAO dao;
	Logger logger = LoggerFactory.getLogger(this.getClass());

	
	public ArrayList<MainDTO> list() {
		logger.info("service 접속");
		return dao.list();
	}

}
