package com.amenity.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.amenity.notice.dao.NoticeDAO;
import com.amenity.notice.vo.NoticeVO;
import com.amenity.user.dao.UserDAO;
import com.amenity.user.vo.UserVO;

@Service("noticeService")
@Transactional(propagation = Propagation.REQUIRED)
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired(required=true)
	private NoticeVO noticeVO;
	
	@Autowired(required=true)
	private NoticeDAO noticeDAO;
	

	@Override
	public List<NoticeVO> listArticles(int start, int limit) throws Exception {
		
		return noticeDAO.listArticles();
	}

	@Override
	public int TotalNoticeCount() throws Exception {
		return noticeDAO.select_TotalNoticeCount();
	}

	@Override
	public void addNewArticle(Map<String, Object> noticeMap) throws Exception {
		noticeDAO.insertNewArticle(noticeMap);
		
	}
	
	@Override
	public void addNewArticle2(Map<String, Object> noticeMap) throws Exception {
		noticeDAO.insertNewArticle2(noticeMap);
		
	}

	@Override
	public int selectNewArticleNO() throws DataAccessException {
		return noticeDAO.selectNewArticleNO();
	}

	@Override
	public void deleteNotice(String articleNO) throws Exception {
		noticeDAO.deleteNotice(articleNO);
		
	}

	@Override
	public NoticeVO viewNotice(int articleNO) throws Exception {
		return noticeDAO.viewNotice(articleNO);
	}

	@Override
	public void addNoticeImage(Map<String, Object> imageMap) throws Exception {
		noticeDAO.addNoticeImage(imageMap);
		
	}

	@Override
	public List<String> getImageFileNames(int articleNO) throws Exception {
		return noticeDAO.selectImageFileNamesByArticleNO(articleNO);
	}

	@Override
	public List<NoticeVO> selectMyQuestion(String u_id) throws DataAccessException {
		return noticeDAO.selectMyQuestion(u_id);
	}

	@Override
	public List<NoticeVO> selectUserQuestion() throws DataAccessException {
		
		return noticeDAO.selectUserQuestion();
	}

	@Override
	public List<NoticeVO> selectBusinessQuestion() throws DataAccessException {
		
		return noticeDAO.selectBusinessQuestion();
	}

	@Override
	public List<NoticeVO> selectNotice() throws DataAccessException {
		
		return noticeDAO.selectNotice();
	}

	@Override
	public void addReply(Map<String, Object> noticeMap) throws DataAccessException {
		noticeDAO.addReply(noticeMap);
		
	}

	@Override
	public List<NoticeVO> selectMyQuestion2(String b_no) throws DataAccessException {
		
		return noticeDAO.selectMyQuestion2(b_no);
	}

	@Override
	public void deleteNotice(int articleNO) throws DataAccessException {
		noticeDAO.deleteNotice(articleNO);
		
	}

	@Override
	public void insertNotice(Map<String, Object> noticeMap) throws DataAccessException {
		noticeDAO.insertNotice(noticeMap);
		
	}

	@Override
	public List<NoticeVO> selectOnlyNotice() throws DataAccessException {
		return noticeDAO.selectOnlyNotice();
		
	}
	
	
	
	
	
}
