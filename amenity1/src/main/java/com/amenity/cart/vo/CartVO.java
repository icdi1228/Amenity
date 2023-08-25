package com.amenity.cart.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;


@Component("cartVO")
public class CartVO {
	private String u_id;
	private int g_no;
	private int c_no;
	private int price;
	private String company;
	private String detail;
	private String room;
	private String location;
	private String main_img;
	private Timestamp checkIn;
	private Timestamp checkOut;
	private int grade;
	
	
	
	public CartVO() {
		System.out.println("CartVO ACTIVATED");
	}
	
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getG_no() {
		return g_no;
	}
	public void setG_no(int g_no) {
		this.g_no = g_no;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}

	public String getCompany() {
		return company;
	}


	public void setCompany(String company) {
		this.company = company;
	}


	public String getDetail() {
		return detail;
	}


	public void setDetail(String detail) {
		this.detail = detail;
	}


	public String getRoom() {
		return room;
	}


	public void setRoom(String room) {
		this.room = room;
	}


	public String getLocation() {
		return location;
	}


	public void setLocation(String location) {
		this.location = location;
	}


	public String getMain_img() {
		return main_img;
	}


	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}


	public int getGrade() {
		return grade;
	}


	public void setGrade(int grade) {
		this.grade = grade;
	}


	public Timestamp getCheckIn() {
		return checkIn;
	}


	public void setCheckIn(Timestamp checkIn) {
		this.checkIn = checkIn;
	}


	public Timestamp getCheckOut() {
		return checkOut;
	}


	public void setCheckOut(Timestamp checkOut) {
		this.checkOut = checkOut;
	}


	
}
