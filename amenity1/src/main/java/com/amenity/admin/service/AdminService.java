package com.amenity.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.amenity.admin.vo.AdminVO;
import com.amenity.notice.vo.NoticeVO;

public interface AdminService {
	public List<NoticeVO> listArticles() throws Exception;
	public void addNewArticle(Map articleMap) throws Exception;
	public AdminVO a_signIn(AdminVO adminVO) throws DataAccessException;
	public int selectNewArticleNO() throws DataAccessException;
	public NoticeVO viewNotice(int articleNO) throws Exception;
	public void addNoticeImage(Map<String, Object> imageMap) throws Exception;
}
