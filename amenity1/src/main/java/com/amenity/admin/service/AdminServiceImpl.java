package com.amenity.admin.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.amenity.admin.dao.AdminDAO;
import com.amenity.admin.vo.AdminVO;
import com.amenity.business.vo.BusinessVO;
import com.amenity.company.vo.CompanyVO;
import com.amenity.goods.vo.GoodsVO;
import com.amenity.notice.vo.NoticeVO;
import com.amenity.user.dao.UserDAO;
import com.amenity.user.vo.UserVO;


@Service("adminService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminServiceImpl implements AdminService{
	@Autowired(required=true)
	private AdminDAO adminDAO;

	@Autowired(required=true)
	private UserDAO userDAO;
	
	@Autowired(required=true)
	private UserVO userVO;
	
	@Override
	public void addNewArticle(Map articleMap) throws Exception {
		adminDAO.insertNewArticle(articleMap);
		
	}
	@Override
	public AdminVO a_signIn(AdminVO adminVO) throws DataAccessException {
		return adminDAO.a_signIn(adminVO);
	}
	
	@Override
	public int selectNewArticleNO() throws DataAccessException {
		int num = adminDAO.selectNewArticleNO();
		return num;
	}
	@Override
	public List<NoticeVO> listArticles() throws Exception {
		List<NoticeVO> noticeList = adminDAO.selectAllArticlesList();
		System.out.println("articlesList : " + noticeList);
		return noticeList;
	}
	@Override
	public NoticeVO viewNotice(int articleNO) throws Exception {
		NoticeVO noticeVO = adminDAO.viewNotice(articleNO);
		System.out.println(noticeVO);
		return noticeVO;
	}
	
	@Override
	public void addNoticeImage(Map<String, Object> imageMap) throws Exception {
	     adminDAO.addNoticeImage(imageMap);
	}
	
	@Override
	public List<String> getImageFileNames(int articleNO) throws Exception {
		return adminDAO.selectImageFileNamesByArticleNO(articleNO);
	}

	@Override
	public List<UserVO> getUserList(@Param("start") int start, @Param("limit") int limit) throws Exception {
	    List<UserVO> userList = adminDAO.selectUserList(start, limit);
	    return userList;
	}

    @Override
    public int getTotalUserCount() throws Exception {
        return adminDAO.selectTotalUserCount();
    }
    
    @Override
    public List<UserVO> searchUsers(String category, String value, int start, int limit) throws Exception {
        return adminDAO.searchUsers(category, value, start, limit);
    }
    
    @Override
    public int getSearchedUserCount(String category, String value) throws Exception {
        return adminDAO.getSearchedUserCount(category, value);
    }
    
    //
	@Override
	public UserVO findUserInfo(String u_id) throws Exception {
		return adminDAO.findUserInfo(u_id);
	}
		
	// 상품 정보수정
	@Override
	public void updateU_Info(UserVO uinfo) throws DataAccessException {
		adminDAO.updateU_Info(uinfo);
	}
		
	// 상품 정보삭제
	@Override
	public void u_deleteInfo(String u_id) throws DataAccessException {
		adminDAO.u_deleteInfo(u_id);
	}
    
    
    @Override
    public List<BusinessVO> getBusinessList(int start, int limit) throws Exception {
        return adminDAO.selectBusinessList(start, limit);
    }
    
    @Override
    public int getTotalBusinessCount() throws Exception {
        return adminDAO.selectTotalBusinessCount();
    }

    @Override
    public List<BusinessVO> searchBusinesses(String category, String value, int start, int limit) throws Exception {
        return adminDAO.searchBusinesses(category, value, start, limit);
    }
    
    @Override
    public int getSearchedBusinessCount(String category, String value) throws Exception {
        return adminDAO.getSearchedBusinessCount(category, value);
    }
    
  //관리자 리스트의 회원정보 수정기능
  	@Override
  	public UserVO modMember(String u_id) throws DataAccessException {
  		return adminDAO.modMemberById(u_id);
  	}
  	
	//관리자의 수정회원정보 업데이트기능
  	@Override
  	public void updateMember(UserVO modMemInfo) throws DataAccessException {
  		adminDAO.updataMember(modMemInfo);
  	}
  	
	@Override
	public BusinessVO findBusinessInfo(String b_no) throws DataAccessException {
		return adminDAO.findBusinessInfo(b_no);
	}
	
	// 기업정보수정
	@Override
	public void updateB_Info(BusinessVO nbinfo) throws DataAccessException {
		adminDAO.updateB_Info(nbinfo);
	}
	
	// 기업정보삭제
	@Override
	public void b_deleteInfo(String b_no) throws DataAccessException {
		adminDAO.b_deleteInfo(b_no);
	}
	
	// 업체 관리 조회
	@Override
	public List<CompanyVO> select_CompanyList(int start, int limit) throws Exception {
		return adminDAO.select_CompanyList(start, limit);
	}
	
	// 업체 개수 조회
	@Override
	public int TotalCompanyCount() throws Exception {
		return adminDAO.select_TotalCompanyCount();
	}
	
	// 업체 검색 조회
	@Override
	public List<CompanyVO> searchCompany(String category, String value, int start, int limit) throws Exception {
		return adminDAO.searchCompany(category, value, start, limit);
	}
	
	// 업체 검색 개수
	@Override
	public int searchCompanyCount(String category, String value) throws Exception {
		return adminDAO.searchCompanyCount(category, value);
	}
	
	//
	@Override
	public CompanyVO findCompanyInfo(String c_no) throws Exception {
		return adminDAO.findCompanyInfo(c_no);
	}
	
	// 업체 정보수정
	@Override
	public void updateC_Info(CompanyVO cpinfo) throws DataAccessException {
		adminDAO.updateC_Info(cpinfo);
	}
	
	// 업체 정보삭제
	@Override
	public void c_deleteInfo(String c_no) throws DataAccessException {
		adminDAO.c_deleteInfo(c_no);
	}
  	
	// 상품 목록 조회
	@Override
	public List<GoodsVO> select_GoodsList(int start, int limit) throws Exception {
		return adminDAO.select_GoodsList(start, limit);
	}
		
	// 상품 개수 조회
	@Override
	public int TotalGoodsCount() throws Exception {
		return adminDAO.select_TotalGoodsCount();
	}
  	
	// 상품 검색 조회
	@Override
	public List<GoodsVO> searchGoods(String category, String value, int start, int limit) throws Exception {
		return adminDAO.searchGoods(category, value, start, limit);
	}
		
	// 상품 검색 개수
	@Override
	public int searchGoodsCount(String category, String value) throws Exception {
		return adminDAO.searchGoodsCount(category, value);
	}
		
	//
	@Override
	public GoodsVO findGoodsInfo(String g_no) throws Exception {
		return adminDAO.findGoodsInfo(g_no);
	}
		
	// 상품 정보수정
	@Override
	public void updateG_Info(GoodsVO gdinfo) throws DataAccessException {
		adminDAO.updateG_Info(gdinfo);
	}
		
	// 상품 정보삭제
	@Override
	public void g_deleteInfo(String g_no) throws DataAccessException {
		adminDAO.g_deleteInfo(g_no);
	}
	
	
}
