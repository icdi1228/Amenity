package com.amenity.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.amenity.dao.MainDAO;

@Service("mainService")
@Transactional(propagation = Propagation.REQUIRED)
public class MainServiceImpl implements MainService{
	@Autowired(required=true)
	private MainDAO mainDAO;

	@Override
	public void userSignup(Map userMap) throws DataAccessException {
		mainDAO.userSignup(userMap);	
	}
	
	//아이디 중복체크 mapper 접근
	@Override
	public int idCheck(String u_id) {
	    int cnt = mainDAO.idCheck(u_id);
	    return cnt;
	}
		
}
