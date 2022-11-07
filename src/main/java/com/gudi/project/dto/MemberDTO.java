package com.gudi.project.dto;

import java.sql.Date;

public class MemberDTO {
	private int mem_num;
	private String mem_name;
	private String mem_email;
	private Date mem_birth;
	private String mem_phon;
	private String mem_pw;
	private String mem_sex;
	private int mem_ban;
	private String mem_autority;
	private String mem_nickname;
	
	
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public Date getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(Date mem_birth) {
		this.mem_birth = mem_birth;
	}
	public String getMem_phon() {
		return mem_phon;
	}
	public void setMem_phon(String mem_phon) {
		this.mem_phon = mem_phon;
	}
	public String getMem_pw() {
		return mem_pw;
	}
	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}
	public String getMem_sex() {
		return mem_sex;
	}
	public void setMem_sex(String mem_sex) {
		this.mem_sex = mem_sex;
	}
	public int getMem_ban() {
		return mem_ban;
	}
	public void setMem_ban(int mem_ban) {
		this.mem_ban = mem_ban;
	}
	public String getMem_autority() {
		return mem_autority;
	}
	public void setMem_autority(String mem_autority) {
		this.mem_autority = mem_autority;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	
	
}
