package com.amenity.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.amenity.review.vo.ReviewVO;

public interface ReviewService {

	
	
	public List<ReviewVO> selecteCompanyReviewList(String company) throws DataAccessException;
	public void writeNewReview(Map<String,Object> reviewMap) throws DataAccessException;
}
