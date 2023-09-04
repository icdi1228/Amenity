package com.amenity.res.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.amenity.res.vo.ResVO;

@Mapper
@Repository("resDAO")
public interface ResDAO {
	public List<ResVO> paycomres(int resNO) throws DataAccessException;
	public int insertRes(Map<String,Object> resMap) throws DataAccessException;
	public ResVO compleRes(int resNO) throws DataAccessException;
	public List<ResVO> myRes(String u_id) throws DataAccessException;
	
	public List<ResVO> selectAllRes() throws DataAccessException;
}
