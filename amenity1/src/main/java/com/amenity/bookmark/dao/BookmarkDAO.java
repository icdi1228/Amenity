package com.amenity.bookmark.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("bookmarkDAO")
public interface BookmarkDAO {
	public void insertBookmark(@Param("u_id") String u_id, @Param("c_no") int c_no) throws DataAccessException;
	public boolean chkBookmark(@Param("u_id") String u_id, @Param("c_no") int c_no) throws DataAccessException;
	public void delBookmark(@Param("u_id") String u_id, @Param("c_no") int c_no) throws DataAccessException;
}
