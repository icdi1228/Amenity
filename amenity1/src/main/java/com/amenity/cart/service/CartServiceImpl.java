package com.amenity.cart.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.amenity.cart.dao.CartDAO;
import com.amenity.cart.vo.CartVO;

@Service("cartService")
@Transactional(propagation = Propagation.REQUIRED)
public class CartServiceImpl implements CartService{
	
	@Autowired(required=true)
	private CartVO cartVO;
	
	@Autowired(required=true)
	private CartDAO cartDAO;
	
	
	@Override
	public int insertCart(Map<String, Object> cartMap) throws DataAccessException {
		return cartDAO.insertCart(cartMap);
	}


	@Override
	public List<CartVO> listUserCart(String u_id) throws DataAccessException {
		
		return cartDAO.listUserCart(u_id);
	}


	@Override
	public int deleteCart(int c_id) throws DataAccessException {
		
		return cartDAO.deleteCart(c_id);
	}	
	
	
	
}
