package com.gudi.project.dto;

import java.sql.Date;

public class CommentDTO {

	private int comt_num;
	private Date comt_time;
	private int comt_state;
	private int board_num;
	private int mem_num;
	private String comt_content;
	private Date newComt_time;
	
	
	public int getComt_num() {
		return comt_num;
	}
	public void setComt_num(int comt_num) {
		this.comt_num = comt_num;
	}
	public Date getComt_time() {
		return comt_time;
	}
	public void setComt_time(Date comt_time) {
		this.comt_time = comt_time;
	}
	public int getComt_state() {
		return comt_state;
	}
	public void setComt_state(int comt_state) {
		this.comt_state = comt_state;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getMem_num() {
		return mem_num;
	}
	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}
	public String getComt_content() {
		return comt_content;
	}
	public void setComt_content(String comt_content) {
		this.comt_content = comt_content;
	}
	public Date getNewComt_time() {
		return newComt_time;
	}
	public void setNewComt_time(Date newComt_time) {
		this.newComt_time = newComt_time;
	}



}
