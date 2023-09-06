package com.amenity.res.vo;


import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;


@Component("resVO")
public class ResVO {
	int resNO;
	String u_id;

	String name;
	String company;
	int g_no;
	Date checkIn;
	Date checkOut;
	Time checkInTime;
	Time checkOutTime;
	Timestamp resdate;
	String resform;
	int price;
	String room; // 이미지출력용 ;;;;;;;;;;;; 아오 상원시치
	
	
	
	
	
	
	public ResVO() {
		System.out.println("resVO");
    }

	public int getResNO() {
		return resNO;
	}

	public void setResNO(int resNO) {
		this.resNO = resNO;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getG_no() {
		return g_no;
	}

	public void setG_no(int g_no) {
		this.g_no = g_no;
	}


	public Timestamp getResdate() {
		return resdate;
	}

	public void setResdate(Timestamp resdate) {
		this.resdate = resdate;
	}

	public String getResform() {
		return resform;
	}

	public void setResForm(String resform) {
		this.resform = resform;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}	
	
	
}
