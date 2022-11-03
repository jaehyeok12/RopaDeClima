package com.gudi.project.dao;

public interface memberDAO {

	String login(String id, String pw);

	String overlay(String id);

	int join(String id, String pw, String pw2, String name, String nick, String birth, String phone, String gender);

	
}
