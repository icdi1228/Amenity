package com.amenity.business.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.amenity.business.dao.BusinessDAO;
import com.amenity.business.vo.BusinessVO;
import com.amenity.user.vo.UserVO;

@Service("businessService")
public class BusinessServiceImpl implements BusinessService{
	@Autowired(required=true)
	private BusinessDAO businessDAO;

	@Autowired
	BusinessVO businessVO;
	
	
	@Override
	public int businessSignup(Map<String, Object> businessMap) {
		return businessDAO.insertBusiness(businessMap);
		
	}
	@Override
	public BusinessVO b_signIn(BusinessVO businessVO) throws DataAccessException {
		return businessDAO.b_signIn(businessVO);
	}
	
	
}
