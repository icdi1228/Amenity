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
    public List<CompanyVO> listProducts() throws Exception {
        return companyDAO.listProducts();
    }

    @Override
    public List<CompanyVO> searchCompaniesByName(String name) throws Exception {
        return companyDAO.searchCompaniesByName(name);
    }

	@Override
	public List<CompanyVO> searchCompaniesByCategory(String category) throws Exception {
		 return companyDAO.searchCompaniesByCategory(category);
	}

	@Override
	public CompanyVO selectedCompany(String company) throws DataAccessException {
		return companyDAO.selectedCompany(company);
	}

	@Override
	public CompanyVO selectCompanyByNo(int c_no) throws DataAccessException {
		return companyDAO.selectCompanyByNo(c_no);
	}

	@Override
  public String companyName(Map<String, Object> companyMap) throws DataAccessException {
		return companyDAO.selectCompanyName(companyMap);
	}

	@Override
	public void insertMainImg(Map<String, Object> companyMap) throws DataAccessException {
		companyDAO.insertCompanyMainImage(companyMap);
		
	}

	@Override
	public void insertSubImg(Map<String, Object> companyMap) throws DataAccessException {
		companyDAO.insertCompanySubImage(companyMap);
	}

	@Override
	public List<String> viewMainImg(String company) throws Exception {
		return companyDAO.viewCompanyMainImage(company);
	}

	@Override
	public List<String> viewSubImg(String company) throws Exception {
		return companyDAO.viewCompanySubImage(company);
	}
	
	
	
}
