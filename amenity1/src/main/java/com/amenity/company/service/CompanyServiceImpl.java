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
	private static final String CompanyVO = null;

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
	@Override
    public List<String> myCompanyList(String b_no) throws DataAccessException {
		return companyDAO.selectMyCompanyList(b_no);
	}
	
	//사업자의 사업장(company) 기존정보 불러오기
	 @Override public CompanyVO modCompanyInList(String company) throws DataAccessException{ 
		 return companyDAO.modCompanyInList(company); 
		 }
	 
	//사업자의 사업장(company) 정보수정 업데이트
	@Override
	public void modCompanyInList(Map<String, Object> companyMap) throws DataAccessException {
		companyDAO.updateCompanyInfo(companyMap);
	}
	
	@Override
	public void modCompanyMainImg(Map<String, Object> companyMap) throws DataAccessException {
		companyDAO.updateCompanyMainImg(companyMap);
	}
	

	@Override
	public void modComapnySubImg(Map<String, Object> companyMap) throws DataAccessException {
		companyDAO.updateCompanySubImg(companyMap);
	}

	//사업장의 사업장(company) 정보 삭제
	@Override
	public int deleteCompanyInList(int c_no) throws DataAccessException{
		return companyDAO.deleteCompanyInList(c_no);
	}

	//2
	@Override
	public String viewCompanyMainImage2(String company) throws Exception {
		return companyDAO.viewCompanyMainImage2(company);
	}
	
	
	
}
