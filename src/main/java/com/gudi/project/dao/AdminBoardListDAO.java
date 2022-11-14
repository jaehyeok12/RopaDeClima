package com.gudi.project.dao;

import java.util.ArrayList;

import com.gudi.project.dto.DecListDTO;

public interface AdminBoardListDAO {

/*
 * 참고용.
 * start_mapper 확인할 것
 * 여기다 코드 적으면 바보
 * */

	int boardCnt();
	ArrayList<DecListDTO> boardLoad(int offset);
	int getIdx(String admin_name);
	int getNicknameToIdx(String nickname);
	int reviseLog(int user_idx, int admin_idx, String state);
	int reviseBoardState(String board, String state);
	int searchCnt(String state);
	ArrayList<DecListDTO> searchList(String state, int offset);
	int searchEmailCnt(String email);
	ArrayList<DecListDTO> searchEmailList(String email, int offset);
	int searchNickCnt(String nickname);
	ArrayList<DecListDTO> searchNickList(String nickname, int offset);
}
