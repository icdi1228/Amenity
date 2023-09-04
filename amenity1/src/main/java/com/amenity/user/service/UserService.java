package com.amenity.user.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.web.servlet.ModelAndView;

import com.amenity.user.vo.UserVO;

public interface UserService {
	public UserVO selectUfindIdByPhone(@Param("name") String name, @Param("tel") String tel) throws DataAccessException;
	public UserVO selectUfindIdByEmail(@Param("name") String name, @Param("email") String email) throws DataAccessException;
	public int u_addsignUp(Map<String, Object> userMap) throws DataAccessException;
	public UserVO u_signIn(UserVO userVO) throws DataAccessException;
	public UserVO viewMyInfo(String u_id) throws DataAccessException;
	public UserVO updateMyInfo(UserVO userVO) throws DataAccessException;
	public UserVO selectUserHold(UserVO userVO) throws DataAccessException;
	public boolean checkUser(Map<String, Object> userMap) throws DataAccessException;
	public int changeU_pwd(Map<String, Object> userMap) throws DataAccessException;
	public int updateInfo(Map<String, Object> userMap) throws DataAccessException;
	public Map<String, Object> kakaoConnectionCheck(Map<String, Object> paramMap);
	public int setKakaoConnection(Map<String, Object> paramMap);
	public Map<String, Object> userKakaoLoginPro(Map<String, Object> paramMap);
	public Integer userKakaoRegisterPro(Map<String, Object> paramMap);
	public Integer userNaverRegisterPro(Map<String, Object> paramMap);
	public void insertPay(Map<String, Object> paramMap);
	public void updateMyMile(UserVO userVO) throws DataAccessException;
	public void couponOccur(Map<String, Object> paramMap) throws DataAccessException;
	public List<Integer> getBookmark(String id) throws DataAccessException;

}

