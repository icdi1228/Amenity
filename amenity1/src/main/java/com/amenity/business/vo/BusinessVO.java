package com.amenity.business.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("businessVO")
public class BusinessVO {


	private String b_no;
	private String b_pw;
	private String tel1;
	private String tel2;
	private String tel3;
	private String name;
	private String addr;
	private String email;
	private String account;
	private Date credate;
	
	public String getB_no() {
		return b_no;
	}
	public void setB_no(String b_no) {
		this.b_no = b_no;
	}
	public String getB_pw() {
		return b_pw;
	}
	public void setB_pw(String b_pw) {
		this.b_pw = b_pw;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public Date getCredate() {
		return credate;
	}
	public void setCredate(Date credate) {
		this.credate = credate;
	}
	
}