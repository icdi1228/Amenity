package com.amenity.cart.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.amenity.cart.vo.CartVO;

@Mapper
@Repository("cartDAO")
public interface CartDAO {
	
	public int insertCart(Map<String, Object> cartMap) throws DataAccessException;
	public List<CartVO> listUserCart(String u_id) throws DataAccessException;

}
