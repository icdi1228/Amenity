package com.amenity.admin.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import com.amenity.admin.vo.AdminVO;
import com.amenity.business.vo.BusinessVO;
import com.amenity.notice.vo.NoticeVO;
import com.amenity.user.vo.UserVO;

public interface AdminService {
	public List<NoticeVO> listArticles() throws Exception;
	public void addNewArticle(Map articleMap) throws Exception;
	public AdminVO a_signIn(AdminVO adminVO) throws DataAccessException;
	public int selectNewArticleNO() throws DataAccessException;
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
}
