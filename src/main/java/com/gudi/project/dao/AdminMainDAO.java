package com.gudi.project.dao;

import java.util.ArrayList;

import com.gudi.project.dto.DecListDTO;

public interface AdminMainDAO {
	int cntDesList();
	ArrayList<DecListDTO> recDesList();
	int cntAdmList();
	ArrayList<DecListDTO> recAdmList();
	int cntRecJoinList();
	ArrayList<DecListDTO> recJoinList();
	int cntBoardList();
	ArrayList<DecListDTO> recBoardList();

}
