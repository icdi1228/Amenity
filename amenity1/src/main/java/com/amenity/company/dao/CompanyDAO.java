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
	public CompanyVO selectCompanyByNo(int c_no) throws DataAccessException;
	public String selectCompanyName(Map<String, Object> companyMap) throws DataAccessException;
	public void insertCompanyMainImage(Map<String, Object> companyMap) throws DataAccessException;
	public void insertCompanySubImage(Map<String, Object> companyMap) throws DataAccessException;
	public List<String> viewCompanyMainImage(String company) throws Exception;
	public List<String> viewCompanySubImage(String company) throws Exception;
	
	//사업자의 사업장(company) 목록조회
	public List<String> selectMyCompanyList(String b_no) throws DataAccessException;

	//사업자의 사업장(company) 정보 수정
	public CompanyVO modCompanyInList(String company) throws DataAccessException;
	
	//사업자의 사업장(company) 수정한 정보 갱신하기	
	public void updateCompanyInList(CompanyVO companyVO) throws DataAccessException;
	
	public void updateCompanyImgInList(Map<String, Object> companyMap) throws DataAccessException;
	
	//사업자의 사업장(company) 정보 삭제
	public int deleteCompanyInList(int c_no) throws DataAccessException;

} 
