package com.amenity.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.amenity.admin.vo.AdminVO;
import com.amenity.business.vo.BusinessVO;
import com.amenity.company.vo.CompanyVO;
import com.amenity.goods.vo.GoodsVO;
import com.amenity.notice.vo.NoticeVO;
import com.amenity.user.vo.UserVO;

@Mapper
@Repository("adminDAO")
public interface AdminDAO {
	public List<NoticeVO> selectAllArticlesList(@Param("start") int start, @Param("limit") int limit) throws DataAccessException;
	
	public AdminVO a_signIn(AdminVO adminVO) throws DataAccessException;

	

	List<UserVO> selectUserList(@Param("start") int start, @Param("limit") int limit) throws Exception;

	public int selectTotalUserCount() throws Exception;

	public List<UserVO> searchUsers(@Param("category") String category, @Param("value") String value,
			@Param("start") int start, @Param("limit") int limit) throws Exception;

	public int getSearchedUserCount(@Param("category") String category, @Param("value") String value) throws Exception;

	//
	public UserVO findUserInfo(String u_id) throws DataAccessException;

	//업체 정보수정
	public void updateU_Info(UserVO uinfo) throws DataAccessException;

	//업체 정보삭제
	public void u_deleteInfo(String u_id) throws DataAccessException;
	
	List<BusinessVO> selectBusinessList(@Param("start") int start, @Param("limit") int limit) throws Exception;

	public int selectTotalBusinessCount() throws Exception;

	public List<BusinessVO> searchBusinesses(@Param("category") String category, @Param("value") String value,
			@Param("start") int start, @Param("limit") int limit) throws Exception;

	public int getSearchedBusinessCount(@Param("category") String category, @Param("value") String value)
			throws Exception;

	// 관리자 리스트의 회원정보 수정기능
	public UserVO modMemberById(String u_id) throws DataAccessException;
	
	//관리자의 수정회원정보 업데이트기능
	public void updataMember(UserVO userVO) throws DataAccessException;

	// 
	public BusinessVO findBusinessInfo(String b_no) throws DataAccessException;
	
	//기업 정보 수정
	public void updateB_Info(BusinessVO nbinfo) throws DataAccessException;
	
	// 기업 정보 삭제
	public void b_deleteInfo(String b_no) throws DataAccessException;

	// 업체 관리 조회
	public List<CompanyVO> select_CompanyList(@Param("start") int start, @Param("limit") int limit) throws Exception;

	// 업체 개수 조회
	public int select_TotalCompanyCount() throws DataAccessException;
	
	// 업체 검색
	public List<CompanyVO> searchCompany(@Param("category") String category, @Param("value") String value,
			@Param("start") int start, @Param("limit") int limit) throws DataAccessException;

	// 업체 검색 개수
	public int searchCompanyCount(@Param("category") String category, @Param("value") String value) throws DataAccessException;

	//
	public CompanyVO findCompanyInfo(String c_no) throws DataAccessException;

	//업체 정보수정
	public void updateC_Info(CompanyVO cpinfo) throws DataAccessException;

	//업체 정보삭제
	public void c_deleteInfo(String c_no) throws DataAccessException;

	// 상품 목록 조회
	public List<GoodsVO> select_GoodsList(@Param("start") int start, @Param("limit") int limit) throws Exception;

	// 상품 개수 조회
	public int select_TotalGoodsCount() throws DataAccessException;

	// 업체 검색
	public List<GoodsVO> searchGoods(@Param("category") String category, @Param("value") String value,
			@Param("start") int start, @Param("limit") int limit) throws DataAccessException;

	// 업체 검색 개수
	public int searchGoodsCount(@Param("category") String category, @Param("value") String value) throws DataAccessException;

	//
	public GoodsVO findGoodsInfo(String g_no) throws DataAccessException;

	//업체 정보수정
	public void updateG_Info(GoodsVO gdinfo) throws DataAccessException;

	//업체 정보삭제
	public void g_deleteInfo(String g_no) throws DataAccessException;

	

	
	
	
	
	
	
}
