package com.amenity.business.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.amenity.business.vo.BusinessVO;



@Mapper
@Repository("businessDAO")
public interface BusinessDAO {
	
	public int insertBusiness(Map<String, Object> businessMap) throws DataAccessException;
	public BusinessVO b_signIn(BusinessVO businessVO) throws DataAccessException;
	public boolean checkBusiness(Map<String, Object> businessMap) throws DataAccessException;
	public int changeB_pwd(Map<String, Object> businessMap) throws DataAccessException;
	public int updateInfo(Map<String, Object> businessMap) throws DataAccessException;
	public List<String> businessBill(String company) throws DataAccessException;
	public List<String> businessResdate(String bnum) throws DataAccessException;
	public String businessRoomBill(@Param("company")String company, @Param("room")String room) throws DataAccessException;
	public List<String> businessGrade(String company) throws DataAccessException;
}
