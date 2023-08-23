package com.amenity.bookmark.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.amenity.bookmark.dao.BookmarkDAO;
import com.amenity.bookmark.vo.BookmarkVO;

@Service("bookmarkService")
public class BookmarkServiceImpl implements BookmarkService{
	@Autowired(required=true)
	private BookmarkDAO bookmarkDAO;

	@Autowired
	BookmarkVO bookmarkVO;
	
	
	@Override
	public void insertBookmark(@Param("u_id") String u_id,@Param("c_no") int c_no) throws DataAccessException {
		bookmarkDAO.insertBookmark(u_id, c_no);
	}


	@Override
	public boolean chkBookmark(String u_id, int c_no) throws DataAccessException {
		boolean book = bookmarkDAO.chkBookmark(u_id, c_no);
		return book;
	}


	@Override
	public void delBookmark(String u_id, int c_no) throws DataAccessException {
		bookmarkDAO.delBookmark(u_id, c_no);
	}
}
