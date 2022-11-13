package com.gudi.project.dto;

import java.sql.Date;

public class MainDTO {
	private int board_num;
	private Date board_time;
	private int board_good;
	private String board_place;
	private Date board_date;
	private String board_state;
	private int mem_num;
	private int sortcode;
	private int weather_num;
	private double board_tmn;
	private double board_tmx;
	private String photo_name;
	private String newPhoto_name;
	
	
	public String getPhoto_name() {
		return photo_name;
	}
	public void setPhoto_name(String photo_name) {
		this.photo_name = photo_name;
	}
	public String getNewPhoto_name() {
		return newPhoto_name;
	}
	public void setNewPhoto_name(String newPhoto_name) {
		this.newPhoto_name = newPhoto_name;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public Date getBoard_time() {
		return board_time;
	}
	public void setBoard_time(Date board_time) {
		this.board_time = board_time;
	}
	public int getBoard_good() {
		return board_good;
	}
	public void setBoard_good(int board_good) {
		this.board_good = board_good;
	}
	public String getBoard_place() {
		return board_place;
	}
	public void setBoard_place(String board_place) {
		this.board_place = board_place;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public String getBoard_state() {
		return board_state;
	}
	public void setBoard_state(String board_state) {
		this.board_state = board_state;
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
	public int getWeather_num() {
		return weather_num;
	}
	public void setWeather_num(int weather_num) {
		this.weather_num = weather_num;
	}
	public double getBoard_tmn() {
		return board_tmn;
	}
	public void setBoard_tmn(double board_tmn) {
		this.board_tmn = board_tmn;
	}
	public double getBoard_tmx() {
		return board_tmx;
	}
	public void setBoard_tmx(double board_tmx) {
		this.board_tmx = board_tmx;
	}
}
