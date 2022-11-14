package com.gudi.project.dao;

import java.util.ArrayList;

import com.gudi.project.dto.CommentDTO;

public interface MemberDAO {

	String login(String id, String pw);

	String overlay(String id);

	int join(String id, String pw, String pw2, String name, String nick, String birth, String phone, String gender);

	String over(String nickName);

	String find_idForm1(String name, String phone);

	String find_pwForm_2(String name, String id);

	String pwUpdate(String newPw);

	int pwUpdate(String newPw, String id);

	int profileInsert(int mem_num);

	int selectMemNum(String id);

	int profilePhoto(int mem_num);
	
	ArrayList<CommentDTO> commentDetail(int boardNum);	

	int commentAdd(int boardNum, int memNum, String commentID);

	int del(int comt_num);

	void commentUpdate(int comt_num, String acontent);








	


}
