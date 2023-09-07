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
	public String companyName(Map<String, Object> companyMap) throws DataAccessException;
	public void insertMainImg(Map<String, Object> companyMap) throws DataAccessException;
	public void insertSubImg(Map<String, Object> companyMap) throws DataAccessException;
	public List<String> viewMainImg(String company) throws Exception;
	public List<String> viewSubImg(String company) throws Exception;
	public String viewCompanyListMainImage(String company) throws Exception;
	

	//사업자의 사업장(company) 목록조회
	public List<String> selectCompanyByBno(String b_no) throws DataAccessException;
    public List<String> myCompanyList(String b_no) throws DataAccessException;

	
	//사업자의 사업장(company) 기존정보 불러오기
	public CompanyVO modCompanyInList(String company) throws DataAccessException;
	
	//사업자의 사업장(company) 정보수정 업데이트
	public void modCompanyInList(Map<String, Object> companyMap) throws DataAccessException;
	public void modCompanyMainImg(Map<String, Object> companyMap) throws DataAccessException;
	public void modComapnySubImg(Map<String, Object> companyMap) throws DataAccessException;
	
	
	//사업장의 사업장(company) 정보 삭제
	public int deleteCompanyInList(int c_no) throws DataAccessException;
	
	//2
	public String viewCompanyMainImage2(String company) throws Exception;
	public String getBno(String company) throws DataAccessException;

}
