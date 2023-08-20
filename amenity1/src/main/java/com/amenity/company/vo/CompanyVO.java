package com.amenity.company.vo;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("companyVO")
public class CompanyVO {
	private String b_no;
	private String company;
	private String category;
	private String location;
	private String grade;
	private String main_img;
	private String sub_img;
	private int price;
	private String detail;
	
	
	public CompanyVO() {
		System.out.println("CompanyVO ACTIVATE");
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
	
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getMain_img(String main_img) {
		try {
			if(main_img != null && main_img.length() !=0) {
				main_img = URLDecoder.decode(main_img, "UTF-8");
			}
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return main_img;
	}

	public void setMain_img(String main_img) {
		try {
			if(main_img != null && main_img.length() !=0) {
				this.main_img = URLEncoder.encode(main_img, "UTF-8");
			}
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	
	public String getSub_img(String sub_img) {
		try {
			if(sub_img != null && sub_img.length() !=0) {
				sub_img = URLDecoder.decode(sub_img, "UTF-8");
			}
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return sub_img;
	}

	public void setSub_img(String sub_img) {
		try {
			if(sub_img != null && sub_img.length() !=0) {
				this.sub_img = URLEncoder.encode(sub_img, "UTF-8");
			}
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}


	
	
	
	
	
	
}
