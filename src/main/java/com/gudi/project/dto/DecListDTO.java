package com.gudi.project.dto;

import java.sql.Date;

public class DecListDTO {
	//dec_list
	private int report_num;
	private int write_num;
	private int mem_num;
	private int sortcode;
	private int res_num;
	private Date dec_date;
	
	//dec
	private int res_dis;
	private int res_state;
	private String reason;
	
	//member
	
	private String mem_name;
	private String mem_email;
	
	private String mem_nickname;
	private Date mem_birth;
	private String mem_phon;
	private String mem_pw;
	private String mem_sex;
	private boolean mem_ban;
	private String mem_autority;
	
	//admin_msg
	private int msg_id;
	private String msg_content;
	private Date write_time;
	private int sender;
	private boolean exp_state;
	private Date exp_time;
	
	
	public int getReport_num() {
		return report_num;
	}
	public void setReport_num(int report_num) {
		this.report_num = report_num;
	}
	public int getWrite_num() {
		return write_num;
	}
	public void setWrite_num(int write_num) {
		this.write_num = write_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public int getSortcode() {
		return sortcode;
	}
	public void setSortcode(int sortcode) {
		this.sortcode = sortcode;
	}
	public int getRes_num() {
		return res_num;
	}
	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}
	public Date getDec_date() {
		return dec_date;
	}
	public void setDec_date(Date dec_date) {
		this.dec_date = dec_date;
	}
	public int getRes_dis() {
		return res_dis;
	}
	public void setRes_dis(int res_dis) {
		this.res_dis = res_dis;
	}
	public int getRes_state() {
		return res_state;
	}
	public void setRes_state(int res_state) {
		this.res_state = res_state;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public int getMsg_id() {
		return msg_id;
	}
	public void setMsg_id(int msg_id) {
		this.msg_id = msg_id;
	}
	public String getMsg_content() {
		return msg_content;
	}
	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}
	public Date getWrite_time() {
		return write_time;
	}
	public void setWrite_time(Date write_time) {
		this.write_time = write_time;
	}
	public int getSender() {
		return sender;
	}
	public void setSender(int sender) {
		this.sender = sender;
	}
	public boolean isExp_state() {
		return exp_state;
	}
	public void setExp_state(boolean exp_state) {
		this.exp_state = exp_state;
	}
	public Date getExp_time() {
		return exp_time;
	}
	public void setExp_time(Date exp_time) {
		this.exp_time = exp_time;
	}
	
}
