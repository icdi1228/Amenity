package com.amenity.cart.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.amenity.cart.vo.CartVO;

public interface CartService {

	public int insertCart(Map<String, Object> cartMap) throws DataAccessException;
	public List<CartVO> listUserCart(String u_id) throws DataAccessException;
	public int deleteCart(int c_id) throws DataAccessException;
}
