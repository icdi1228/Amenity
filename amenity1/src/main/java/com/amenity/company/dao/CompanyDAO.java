package com.amenity.company.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;



@Mapper
@Repository("companyDAO")
public interface CompanyDAO {
	
	public void insertCompany(Map<String, Object> companyMap) throws DataAccessException;
	
	
}
