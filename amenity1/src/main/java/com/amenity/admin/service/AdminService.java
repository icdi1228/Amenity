package com.amenity.admin.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import com.amenity.admin.vo.AdminVO;
import com.amenity.business.vo.BusinessVO;
import com.amenity.company.vo.CompanyVO;
import com.amenity.goods.vo.GoodsVO;
import com.amenity.notice.vo.NoticeVO;
import com.amenity.user.vo.UserVO;

public interface AdminService {
	// 공지사항 목록
	public List<NoticeVO> listArticles(int start, int limit) throws Exception;
	//공지 개수
	public int TotalNoticeCount() throws Exception;
	
	public void addNewArticle(Map articleMap) throws Exception;
	public AdminVO a_signIn(AdminVO adminVO) throws DataAccessException;
	public int selectNewArticleNO() throws DataAccessException;
	
	// 공지 삭제
	public void deleteNotice(String articleNO) throws Exception;
	
	public NoticeVO viewNotice(int articleNO) throws Exception;
	public void addNoticeImage(Map<String, Object> imageMap) throws Exception;
	public List<String> getImageFileNames(int articleNO) throws Exception;
	public List<UserVO> getUserList(@Param("start") int start, @Param("limit") int limit) throws Exception;
    public int getTotalUserCount() throws Exception;
    public List<UserVO> searchUsers(String category, String value, int start, int limit) throws Exception;
    public int getSearchedUserCount(String category, String value) throws Exception;
    public List<BusinessVO> getBusinessList(int start, int limit) throws Exception;
    public int getTotalBusinessCount() throws Exception;
    public List<BusinessVO> searchBusinesses(String category, String value, int start, int limit) throws Exception;
    public int getSearchedBusinessCount(String category, String value) throws Exception;
    
    //관리자 리스트의 회원정보 수정기능
    public UserVO modMember(String u_id) throws DataAccessException;
    
	//관리자의 수정회원정보 업데이트기능
    public void updateMember(UserVO userVO) throws DataAccessException;
    
    //  
	public UserVO findUserInfo(String u_id) throws Exception;

	// 유저 정보수정
	public void updateU_Info(UserVO uinfo) throws DataAccessException;
		
	// 유저 정보삭제
	public void u_deleteInfo(String u_id) throws DataAccessException;
    
    //
    public BusinessVO findBusinessInfo(String b_no) throws DataAccessException;
    
    // 기업 정보수정
	public void updateB_Info(BusinessVO nbinfo) throws DataAccessException;
	
	// 기업 정보삭제
	public void b_deleteInfo(String b_no) throws DataAccessException;
	
	// 업체 관리 조회
	public List<CompanyVO> select_CompanyList(int start, int limit) throws Exception;
	
	// 업체 개수 조회
	public int TotalCompanyCount() throws Exception;
	
	// 업체 검색 기능
	public List<CompanyVO> searchCompany(String category, String value, int start, int limit) throws Exception;
	
	// 업체 검색 개수
	public int searchCompanyCount(String category, String value) throws Exception;
	
	//  
	public CompanyVO findCompanyInfo(String c_no) throws Exception;
	
	// 업체 정보수정
	public void updateC_Info(CompanyVO cpinfo) throws DataAccessException;
	
	// 업체 정보삭제
	public void c_deleteInfo(String c_no) throws DataAccessException;
	
	// 상품 관리 조회
	public List<GoodsVO> select_GoodsList(int start, int limit) throws Exception;
	
	// 상품 개수 조회
	public int TotalGoodsCount() throws Exception;
	
	// 업체 검색 기능
	public List<GoodsVO> searchGoods(String category, String value, int start, int limit) throws Exception;
		
	// 업체 검색 개수
	public int searchGoodsCount(String category, String value) throws Exception;
		
	//  
	public GoodsVO findGoodsInfo(String g_no) throws Exception;

	// 업체 정보수정
	public void updateG_Info(GoodsVO gdinfo) throws DataAccessException;
		
	// 업체 정보삭제
	public void g_deleteInfo(String g_no) throws DataAccessException;
	
	
	
	
}
