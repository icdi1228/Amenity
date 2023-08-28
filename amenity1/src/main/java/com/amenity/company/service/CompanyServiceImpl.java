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
	//사업자의 사업장(company) 목록조회
	@Override
	public List<String> selectCompanyByBno(String b_no) throws DataAccessException{
		return companyDAO.selectCompanyByBno(b_no);
	}
	
	//사업자의 사업장(company) 정보 수정
	@Override
	public CompanyVO modCompanyInList(String company) throws DataAccessException{
		return companyDAO.modCompanyInList(company);
	}
	
	//사업자의 사업장(company) 수정한 정보 갱신하기	
	@Override
	public void updateCompanyInList(CompanyVO companyVO) throws DataAccessException{
		companyDAO.updateCompanyInList(companyVO);
	}
	
	@Override
	public void updateComapnyImgInList(Map<String, Object> companyMap) throws DataAccessException{
		companyDAO.updateCompanyImgInList(companyMap);
	}
  
	@Override
	public int deleteCompanyInList(int c_no) throws DataAccessException{
		return companyDAO.deleteCompanyInList(c_no);
	}


}
