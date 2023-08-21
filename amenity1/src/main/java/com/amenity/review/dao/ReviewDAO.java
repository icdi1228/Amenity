package com.amenity.review.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.amenity.review.vo.ReviewVO;


@Mapper
@Repository("reviewDAO")
public interface ReviewDAO {
	
	public List<ReviewVO> selecteCompanyReviewList(String company) throws DataAccessException;
	
}
