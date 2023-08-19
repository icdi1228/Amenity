package com.amenity.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.amenity.admin.vo.AdminVO;

public interface AdminService {
	public void addNewArticle(Map articleMap) throws Exception;
	public AdminVO a_signIn(AdminVO adminVO) throws DataAccessException;
	public int selectNewArticleNO() throws DataAccessException;
	
	public List userList() throws DataAccessException;
}
