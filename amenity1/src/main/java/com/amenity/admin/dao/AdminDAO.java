package com.amenity.admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.amenity.admin.vo.AdminVO;

@Mapper
@Repository("adminDAO")
public interface AdminDAO {
	public AdminVO a_signIn(AdminVO adminVO) throws DataAccessException;
	public void insertNewArticle(Map articleMap) throws DataAccessException;
	public int selectNewArticleNO() throws DataAccessException;
	
	public List selectAllUserList() throws DataAccessException;
}
