package com.amenity.bookmark.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;

public interface BookmarkService {
	public void insertBookmark(@Param("u_id") String u_id, @Param("c_no") int c_no)  throws DataAccessException;
	public boolean chkBookmark(@Param("u_id") String u_id, @Param("c_no") int c_no) throws DataAccessException;
	public void delBookmark(@Param("u_id") String u_id, @Param("c_no") int c_no) throws DataAccessException;
}
