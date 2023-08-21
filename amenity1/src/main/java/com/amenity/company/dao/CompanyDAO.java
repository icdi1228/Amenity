package com.amenity.company.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.amenity.company.vo.CompanyVO;



@Mapper
@Repository("companyDAO")
public interface CompanyDAO {
	
	public void insertCompany(Map<String, Object> companyMap) throws DataAccessException;
	public CompanyVO selectedCompany(String company) throws DataAccessException;
	public List<CompanyVO> listProducts() throws Exception;
    public List<CompanyVO> searchCompaniesByName(String name) throws Exception;
    public List<CompanyVO> searchCompaniesByCategory(String category) throws Exception;
	
}
