package com.amenity.company.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.amenity.company.vo.CompanyVO;

public interface CompanyService {
	
	
	public void addNewCompany(Map<String, Object> companyMap) throws DataAccessException;
	public List<CompanyVO> listProducts() throws Exception;
    public List<CompanyVO> searchCompaniesByName(String name) throws Exception;
    public List<CompanyVO> searchCompaniesByCategory(String category) throws Exception;
    public CompanyVO selectedCompany(String company) throws DataAccessException;
    public CompanyVO selectCompanyByNo(int c_no) throws DataAccessException;
}
