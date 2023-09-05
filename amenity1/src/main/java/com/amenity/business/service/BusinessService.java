package com.amenity.business.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.amenity.business.vo.BusinessVO;



public interface BusinessService {
	public int businessSignup(Map<String, Object> businessMap) throws DataAccessException;
	public BusinessVO b_signIn(BusinessVO businessVO) throws DataAccessException;
	public boolean checkBusiness(Map<String, Object> businessMap) throws DataAccessException;
	public int changeB_pwd(Map<String, Object> businessMap) throws DataAccessException;
	public int updateInfo(Map<String, Object> businessMap) throws DataAccessException;
	public List<String> businessBill(String company)throws DataAccessException;
	public List<String> businessResdate(String bnum) throws DataAccessException;
}
