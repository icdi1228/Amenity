package com.amenity.res.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;


@Component("resVO")
public class ResVO {
	int resNO;
	String u_id;
	String loginState;
	String name;
	String company;
	int g_no;
	Timestamp checkin;
	Timestamp checkout;
	Timestamp resdate;
	String resForm;
	int price;
	String paymentstate;
	
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

	public String getLoginState() {
		return loginState;
	}

	public void setLoginState(String loginState) {
		this.loginState = loginState;
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

	public Timestamp getCheckin() {
		return checkin;
	}

	public void setCheckin(Timestamp checkin) {
		this.checkin = checkin;
	}

	public Timestamp getCheckout() {
		return checkout;
	}

	public void setCheckout(Timestamp checkout) {
		this.checkout = checkout;
	}

	public Timestamp getResdate() {
		return resdate;
	}

	public void setResdate(Timestamp resdate) {
		this.resdate = resdate;
	}

	public String getResForm() {
		return resForm;
	}

	public void setResForm(String resForm) {
		this.resForm = resForm;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPaymentstate() {
		return paymentstate;
	}

	public void setPaymentstate(String paymentstate) {
		this.paymentstate = paymentstate;
	}
	
	
	
	
	
	
}
