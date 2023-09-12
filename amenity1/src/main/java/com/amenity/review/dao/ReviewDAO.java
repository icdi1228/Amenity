package com.amenity.review.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.amenity.review.vo.ReviewVO;


@Mapper
@Repository("reviewDAO")
public interface ReviewDAO {
	
	public List<ReviewVO> selecteCompanyReviewList(String company) throws DataAccessException;
	public void writeNewReview(Map<String,Object> reviewMap) throws DataAccessException;
	public boolean checkMyReview(int resNO) throws DataAccessException;
	public List<ReviewVO> businessReview(String b_no) throws DataAccessException;
	public void addReply(Map<String,Object> reviewMap) throws DataAccessException;
	
	// 해당 사업체 전체 리뷰 수 가져오기
	public int countReview(String company) throws DataAccessException;
}
