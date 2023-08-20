package com.amenity.company.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.amenity.company.dao.CompanyDAO;
import com.amenity.company.vo.CompanyVO;

@Service("companyService")
public class CompanyServiceImpl implements CompanyService{
	@Autowired(required=true)
	private CompanyDAO companyDAO;

	@Autowired
	CompanyVO companyVO;
	
	
	@Override
	public void addNewCompany(Map<String, Object> companyMap) throws DataAccessException {
		companyDAO.insertCompany(companyMap);
		return; 
		
	}
	
	@Override
    public List<CompanyVO> listGoods() throws Exception {
        return companyDAO.listGoods();
    }

    @Override
    public List<CompanyVO> searchCompaniesByName(String name) throws Exception {
        return companyDAO.searchCompaniesByName(name);
    }

	@Override
	public List<CompanyVO> searchCompaniesByCategory(String category) throws Exception {
		 return companyDAO.searchCompaniesByCategory(category);
	}
	
	
}
