package com.amenity.goods.vo;

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
	
	
}

