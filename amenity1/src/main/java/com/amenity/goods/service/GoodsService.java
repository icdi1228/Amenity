package com.amenity.goods.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface GoodsService {
	public List listGoods() throws DataAccessException;
	public List companyGoods(String company) throws DataAccessException;
}
