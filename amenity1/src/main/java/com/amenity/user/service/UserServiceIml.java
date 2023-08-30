package com.amenity.user.service;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.amenity.user.dao.UserDAO;
import com.amenity.user.vo.UserVO;

@Service("userService")
@Transactional(propagation = Propagation.REQUIRED)
public class UserServiceIml implements UserService{
	@Autowired(required=true)
	private UserDAO userDAO;

	@Autowired
	UserVO userVO;
	
	@Override
	public UserVO selectUfindIdByPhone(@Param("name") String name, @Param("tel") String tel) throws DataAccessException {
		return userDAO.selectUfindIdByPhone(name, tel);
	}

	@Override
	public UserVO selectUfindIdByEmail(@Param("name") String name, @Param("tel") String tel) throws DataAccessException {
		return userDAO.selectUfindIdByEmail(name, tel);
	}
	

	@Override
	public int u_addsignUp(Map<String, Object> userMap) throws DataAccessException{
		return userDAO.u_addsignUp(userMap);
		
	}

	@Override
	public UserVO u_signIn(UserVO userVO) throws DataAccessException {
		return userDAO.u_signIn(userVO);
	}

	@Override
	public UserVO viewMyInfo(String u_id) throws DataAccessException {
		return userDAO.viewMyInfo(u_id);
	}

	@Override
	public UserVO updateMyInfo(UserVO userVO) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UserVO selectUserHold(UserVO userVO) throws DataAccessException {
		return userDAO.selectUserHold(userVO);
	}

  @Override
	public boolean checkUser(Map<String, Object> userMap) throws DataAccessException {
		return userDAO.checkUser(userMap);
	}

	@Override
	public int changeU_pwd(Map<String, Object> userMap) throws DataAccessException {
		return userDAO.changeU_pwd(userMap);
	}

	@Override
	public int updateInfo(Map<String, Object> userMap) throws DataAccessException {
		
		return userDAO.updateInfo(userMap);
	}
	
	@Override
	public void insertPay(Map<String, Object> paramMap) {
		userDAO.insertPay(paramMap);
	}

	//////////////////// 카카오 /////////////////////////
	@Override
	public Map <String, Object> kakaoConnectionCheck(Map<String, Object> paramMap) {
		return userDAO.kakaoConnectionCheck(paramMap);
	}

	@Override
	public int setKakaoConnection(Map<String, Object> paramMap) {
		return userDAO.setKakaoConnection(paramMap);
	}

	@Override
	public Map<String, Object> userKakaoLoginPro(Map<String, Object> paramMap) {
		return userDAO.kakaoLogin(paramMap);
	}

	@Override
	public Integer userKakaoRegisterPro(Map<String, Object> paramMap) {
		return userDAO.insert_kakao(paramMap);
	}
	
	
	
	
	
}
