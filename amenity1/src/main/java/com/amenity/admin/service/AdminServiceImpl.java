package com.amenity.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.amenity.admin.dao.AdminDAO;
import com.amenity.admin.vo.AdminVO;
import com.amenity.notice.vo.NoticeVO;

@Service("adminService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminServiceImpl implements AdminService{
	@Autowired(required=true)
	private AdminDAO adminDAO;

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
	
}
