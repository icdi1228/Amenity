package com.amenity.mile.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.amenity.mile.vo.MileVO;

@Mapper
@Repository("mileDAO")
public interface MileDAO {
	
	public void accumulateMile(@Param("u_id") String u_id, @Param("varmile") int varmile) throws DataAccessException;
	public int findMyMile(String u_id) throws DataAccessException;
	public List<MileVO> varMyMile(@Param("u_id")String u_id,@Param("start") int start, @Param("limit") int limit) throws DataAccessException;
	public int getTotalMyMileCount(String u_id) throws DataAccessException;
}
