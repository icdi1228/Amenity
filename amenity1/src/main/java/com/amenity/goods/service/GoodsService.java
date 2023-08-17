package com.amenity.goods.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

public interface GoodsService {
	public List listGoods() throws DataAccessException;
}
