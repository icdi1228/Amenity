package com.amenity.company.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

public interface CompanyService {
	
	
	public void addNewCompany(Map<String, Object> companyMap) throws DataAccessException;
}
