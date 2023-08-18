package com.amenity.admin.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.amenity.admin.dao.AdminDAO;
import com.amenity.admin.vo.AdminVO;

@Service("adminService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminServiceImpl implements AdminService{
	@Autowired(required=true)
	private AdminDAO adminDAO;

	@Override
	public void addNewArticle(Map articleMap) throws Exception {
		adminDAO.insertNewArticle(articleMap);
		
	}
	@Override
	public AdminVO a_signIn(AdminVO adminVO) throws DataAccessException {
		return adminDAO.a_signIn(adminVO);
	}
	
	@Override
	public int selectNewArticleNO() throws DataAccessException {
		int num = adminDAO.selectNewArticleNO();
		return num;
	}
	
	
	
}
