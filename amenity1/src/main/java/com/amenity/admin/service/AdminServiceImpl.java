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
	
}
