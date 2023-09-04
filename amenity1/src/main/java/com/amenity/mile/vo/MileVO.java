package com.amenity.mile.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component("mileVO")
public class MileVO {
	private int m_no;
	private String u_id;
	private int varmile;
	private String varstate;
	private Timestamp vartime;
	private int mileage;
	
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getVarmile() {
		return varmile;
	}
	public void setVarmile(int varmile) {
		this.varmile = varmile;
	}
	public String getVarstate() {
		return varstate;
	}
	public void setVarstate(String varstate) {
		this.varstate = varstate;
	}
	public Timestamp getVartime() {
		return vartime;
	}
	public void setVartime(Timestamp vartime) {
		this.vartime = vartime;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	
	
}
