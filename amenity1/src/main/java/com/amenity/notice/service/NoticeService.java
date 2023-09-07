package com.amenity.notice.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.amenity.admin.vo.AdminVO;
import com.amenity.notice.vo.NoticeVO;

public interface NoticeService {
	
	// 공지사항 목록
		public List<NoticeVO> listArticles(int start, int limit) throws Exception;
		//공지 개수
		public int TotalNoticeCount() throws Exception;
		
		public void addNewArticle(Map<String, Object> noticeMap) throws Exception;
		public void addNewArticle2(Map<String, Object> noticeMap) throws Exception;
		
		public int selectNewArticleNO() throws DataAccessException;
		
		// 공지 삭제
		public void deleteNotice(String articleNO) throws Exception;
		// 공지열람
		public NoticeVO viewNotice(int articleNO) throws Exception;
		// 공지 이미지추가
		public void addNoticeImage(Map<String, Object> imageMap) throws Exception;
		// 공지 이미지 가져오기
		public List<String> getImageFileNames(int articleNO) throws Exception;
		// 사용자 내문의 내역
		public List<NoticeVO> selectMyQuestion(String u_id) throws DataAccessException;
		// 사업자 내문의 내역
		public List<NoticeVO> selectMyQuestion2(String b_no) throws DataAccessException;
		
		// 관리자 사용자,사업자 문의내역 
		public List<NoticeVO> selectUserQuestion() throws DataAccessException;
		public List<NoticeVO> selectBusinessQuestion() throws DataAccessException;
		
		
		//관리자 공지사항만 조회
		public List<NoticeVO> selectNotice() throws DataAccessException;
		
		// 문의내역 답글 달기
		public void addReply(Map<String,Object> noticeMap) throws DataAccessException;
		

		public void deleteNotice(int articleNO) throws DataAccessException;
		
		public void insertNotice(Map<String, Object> noticeMap) throws DataAccessException;
		
		public List<NoticeVO> selectOnlyNotice() throws DataAccessException;
}
