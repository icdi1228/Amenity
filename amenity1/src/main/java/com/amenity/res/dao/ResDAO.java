package com.amenity.res.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.amenity.res.vo.ResVO;

@Mapper
@Repository("resDAO")
public interface ResDAO {
	public List<ResVO> paycomres(int resNO) throws DataAccessException;
	
}
