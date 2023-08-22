package com.amenity.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.amenity.review.dao.ReviewDAO;
import com.amenity.review.vo.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired(required=true)
	private ReviewDAO reviewDAO;

	@Autowired
	ReviewVO reviewVO;
	
	
	@Override
	public List<ReviewVO> selecteCompanyReviewList(String company) throws DataAccessException {
		
		return reviewDAO.selecteCompanyReviewList(company);
	}

	
	
}
