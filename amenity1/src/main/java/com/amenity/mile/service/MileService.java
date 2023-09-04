package com.amenity.mile.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

public interface MileService {
	
	public void accumulateMile(@Param("u_id") String u_id, @Param("varmile") int varmile) throws DataAccessException;
	public int findMyMile(String u_id) throws DataAccessException;
}
