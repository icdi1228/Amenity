package com.amenity.company.vo;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("companyVO")
public class CompanyVO {
	private int c_no;
	private String b_no;
	private String company;
	private String category;
	private String detail;
	private String location;
	private int grade;
	private String type;
	private String locationdetail;
	private String latitude;
	private String longitude;
	
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public String getB_no() {
		return b_no;
	}
	public void setB_no(String b_no) {
		this.b_no = b_no;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getLocationdetail() {
		return locationdetail;
	}
	public void setLocationdetail(String locationdetail) {
		this.locationdetail = locationdetail;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	
	
}
