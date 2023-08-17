package com.amenity.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("mainDAO")
public interface MainDAO {
	public void userSignup(Map userMap) throws DataAccessException;
	public int idCheck(String u_id);
}
