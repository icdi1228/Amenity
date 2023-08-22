package com.amenity.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.amenity.admin.vo.AdminVO;
import com.amenity.business.vo.BusinessVO;
import com.amenity.notice.vo.NoticeVO;
import com.amenity.user.vo.UserVO;

@Mapper
@Repository("adminDAO")
public interface AdminDAO {
	public List selectAllArticlesList() throws DataAccessException;
	public List<NoticeVO> listArticles() throws Exception;
	public AdminVO a_signIn(AdminVO adminVO) throws DataAccessException;
	public void insertNewArticle(Map articleMap) throws DataAccessException;
	public int selectNewArticleNO() throws DataAccessException;
	public NoticeVO viewNotice(int articleNO) throws DataAccessException;
	void addNoticeImage(Map<String, Object> imageMap) throws Exception;
	public NoticeVO selectNoticeByArticleNO(int articleNO) throws Exception;
	public List<String> selectImageFileNamesByArticleNO(int articleNO) throws Exception;
	List<UserVO> selectUserList(@Param("start") int start, @Param("limit") int limit) throws Exception;
    public int selectTotalUserCount() throws Exception;
    public List<UserVO> searchUsers(@Param("category") String category, @Param("value") String value, @Param("start") int start, @Param("limit") int limit) throws Exception;
    public int getSearchedUserCount(@Param("category") String category, @Param("value") String value) throws Exception;
    
    List<BusinessVO> selectBusinessList(@Param("start") int start, @Param("limit") int limit) throws Exception;
    public int selectTotalBusinessCount() throws Exception;
    public List<BusinessVO> searchBusinesses(@Param("category") String category, @Param("value") String value, @Param("start") int start, @Param("limit") int limit) throws Exception;
    public int getSearchedBusinessCount(@Param("category") String category, @Param("value") String value) throws Exception;
}
