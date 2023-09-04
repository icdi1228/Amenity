package com.amenity.mile.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

import com.amenity.mile.vo.MileVO;

public interface MileService {
	
	public void accumulateMile(@Param("u_id") String u_id, @Param("varmile") int varmile) throws DataAccessException;
	public int findMyMile(String u_id) throws DataAccessException;

	public List<MileVO> varMyMile(@Param("u_id")String u_id,@Param("start") int start, @Param("limit") int limit) throws DataAccessException;
	public int getTotalMyMileCount(String u_id) throws DataAccessException;
}
