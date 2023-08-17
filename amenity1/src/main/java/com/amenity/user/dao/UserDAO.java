package com.amenity.user.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.amenity.user.vo.UserVO;

@Mapper
@Repository("userDAO")
public interface UserDAO {
	public UserVO selectUfindIdByPhone(@Param("name") String name, @Param("tel") String tel) throws DataAccessException;
	public UserVO selectUfindIdByEmail(@Param("name") String name, @Param("email") String email) throws DataAccessException;
	public int insertUser(Map<String, Object> userMap) throws DataAccessException;
	public UserVO u_signIn(UserVO userVO) throws DataAccessException;
	public UserVO viewMyInfo(String u_id) throws DataAccessException;
	public UserVO updateMyInfo(UserVO userVO) throws DataAccessException;
}
