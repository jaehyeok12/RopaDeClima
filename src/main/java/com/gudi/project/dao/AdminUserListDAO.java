package com.gudi.project.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.gudi.project.dto.DecListDTO;

public interface AdminUserListDAO {

	int cntUserList();

	ArrayList<DecListDTO> userList();

	int userBan(int id);

	int banLog(int id, int admin_id);

	int getIdx(String admin_name);

	int userRecover(int id);

	int recoverLog(int user_idx, int admin_idx);

	int reviseAuth(String nickname, String auth);

	int getNicknameToIdx(String nickname);

	int reviseLog(int user_idx, int admin_idx, String auth);

	ArrayList<DecListDTO> nickSearch(String nickname);

	ArrayList<DecListDTO> nickAuthSearch(String nickname, String auth);

}
