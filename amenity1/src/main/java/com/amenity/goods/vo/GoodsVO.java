package com.amenity.goods.vo;

import org.springframework.stereotype.Component;

@Component("goodsVO")
public class GoodsVO {
	private String company;
	private String room;
	private int price;
	private String location;
	private String grade;
	private String main_img;
	private String sub_img;
	private String detail;
	private int gno;
	
	public GoodsVO() {
		System.out.println("GoodsVO ACTIVATED");
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public String getSub_img() {
		return sub_img;
	}
	public void setSub_img(String sub_img) {
		this.sub_img = sub_img;
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
	
	
	
}

