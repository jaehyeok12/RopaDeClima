package com.gudi.project.dao;

import java.util.ArrayList;

import com.gudi.project.dto.MainDTO;

public interface MainDAO {

	ArrayList<MainDTO> list();

	ArrayList<String> allShow();

	ArrayList<String> recommend(int tmn, int tmx);

	ArrayList<String> newOrder();

	ArrayList<String> like();

	
	

}
