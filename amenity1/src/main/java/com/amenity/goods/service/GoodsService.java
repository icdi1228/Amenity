package com.amenity.goods.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.amenity.goods.vo.GoodsVO;

public interface GoodsService {
	public List listGoods() throws DataAccessException;
	public List<GoodsVO> selectGoodsByCompany(String company) throws DataAccessException;
	public List companyGoods(String company) throws DataAccessException;

}
