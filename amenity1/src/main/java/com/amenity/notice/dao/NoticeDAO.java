package com.amenity.notice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.amenity.notice.vo.NoticeVO;
@Mapper
@Repository("noticeDAO")
public interface NoticeDAO {
	public List<NoticeVO> selectAllArticlesList(@Param("start") int start, @Param("limit") int limit) throws DataAccessException;

	//공지 목록 조회
	public List<NoticeVO> listArticles() throws Exception;

	//공지 개수 조회
	public int select_TotalNoticeCount()throws DataAccessException;
	
	// 공지 삭제
	public void deleteNotice(String articleNO) throws DataAccessException;
	
	// 게시글등록
	public void insertNewArticle(Map<String, Object> noticeMap) throws DataAccessException;

	
	public int selectNewArticleNO() throws DataAccessException;
	
	//공지,문의 열람
	public NoticeVO viewNotice(int articleNO) throws DataAccessException;

	//공지 사진추가
	void addNoticeImage(Map<String, Object> imageMap) throws Exception;

	public NoticeVO selectNoticeByArticleNO(int articleNO) throws Exception;

	public List<String> selectImageFileNamesByArticleNO(int articleNO) throws Exception;
	
	// 사용자 내문의 내역
	public List<NoticeVO> selectMyQuestion(String u_id) throws DataAccessException;
	
	//관리자 유저, 사업자 문의내역

	public List<NoticeVO> selectUserQuestion() throws DataAccessException;
	public List<NoticeVO> selectBusinessQuestion() throws DataAccessException;
	
	//관리자 공지사항 조회
	public List<NoticeVO> selectNotice() throws DataAccessException;
	
}
