package com.amenity.business.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.amenity.business.vo.BusinessVO;



public interface BusinessService {
	public int businessSignup(Map<String, Object> businessMap) throws DataAccessException;
	public BusinessVO b_signIn(BusinessVO businessVO) throws DataAccessException;
	
}
