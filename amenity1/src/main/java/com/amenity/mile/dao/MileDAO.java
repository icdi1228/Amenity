package com.amenity.mile.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("mileDAO")
public interface MileDAO {
	
	public void accumulateMile(@Param("u_id") String u_id, @Param("varmile") int varmile) throws DataAccessException;
	public int findMyMile(String u_id) throws DataAccessException;
	
}
