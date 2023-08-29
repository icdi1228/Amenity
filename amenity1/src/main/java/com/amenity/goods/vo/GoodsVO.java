package com.amenity.goods.vo;

import java.sql.Date;
import java.sql.Time;

import org.springframework.stereotype.Component;

@Component("goodsVO")
public class GoodsVO {
	private int g_no;
	private String company;
	private String room;
	private int price;
	private int timeprice;
	private int stdper;
	private String detail;
	private int gno;
	private String type;
	private Date checkIn;
	private Date checkOut;
	private Time checkInTime;
	private Time checkOutTime;
	private String resform;
	private int c_no;
	
	public int getG_no() {
		return g_no;
	}
	public void setG_no(int g_no) {
		this.g_no = g_no;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getTimeprice() {
		return timeprice;
	}
	public void setTimeprice(int timeprice) {
		this.timeprice = timeprice;
	}
	public int getStdper() {
		return stdper;
	}
	public void setStdper(int stdper) {
		this.stdper = stdper;
	}
	public Date getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(Date checkIn) {
		this.checkIn = checkIn;
	}
	public Date getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(Date checkOut) {
		this.checkOut = checkOut;
	}
	public Time getCheckInTime() {
		return checkInTime;
	}
	public void setCheckInTime(Time checkInTime) {
		this.checkInTime = checkInTime;
	}
	public Time getCheckOutTime() {
		return checkOutTime;
	}
	public void setCheckOutTime(Time checkOutTime) {
		this.checkOutTime = checkOutTime;
	}
	public String getResform() {
		return resform;
	}
	public void setResform(String resform) {
		this.resform = resform;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	
	
}

