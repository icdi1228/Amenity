package com.amenity.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface MainService {
	public void userSignup(Map userMap) throws DataAccessException;
	public int idCheck(String u_id);
}
