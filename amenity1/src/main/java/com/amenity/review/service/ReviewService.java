package com.amenity.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.amenity.review.vo.ReviewVO;

public interface ReviewService {

	
	
	public List<ReviewVO> selecteCompanyReviewList(String company) throws DataAccessException;
	public void writeNewReview(Map<String,Object> reviewMap) throws DataAccessException;
	public boolean checkMyReview(int resNO) throws DataAccessException;
	public List<ReviewVO> businessReview(String b_no) throws DataAccessException;
	public void addReply(Map<String,Object> reviewMap) throws DataAccessException;
	public int countReview(String company) throws DataAccessException;
}
