package com.amenity.business.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
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
	@Override
	public boolean checkBusiness(Map<String, Object> businessMap) throws DataAccessException {
				return businessDAO.checkBusiness(businessMap);
	}
	@Override
	public int changeB_pwd(Map<String, Object> businessMap) throws DataAccessException {
		return businessDAO.changeB_pwd(businessMap);
	}
	@Override
	public int updateInfo(Map<String, Object> businessMap) throws DataAccessException {
		return businessDAO.updateInfo(businessMap);
	}
	
	@Override
	public List<String> businessBill(String company) throws DataAccessException {
		return businessDAO.businessBill(company);
	}
	
	@Override
	public List<String> businessResdate(String bnum) throws DataAccessException {
		return businessDAO.businessResdate(bnum);
	}
	
	@Override
	public String businessRoomBill(@Param("company")String company, @Param("room")String room) throws DataAccessException {
		return businessDAO.businessRoomBill(company, room);
	}
	
	@Override
	public List<String> businessGrade(String company) throws DataAccessException {
		return businessDAO.businessGrade(company);
	}
	
}
