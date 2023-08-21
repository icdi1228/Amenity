package com.amenity.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.amenity.goods.dao.GoodsDAO;

@Service("goodsService")
@Transactional(propagation = Propagation.REQUIRED)
public class GoodsServiceImpl implements GoodsService{
	
	@Autowired(required=true)
	private GoodsDAO goodsDAO;
	
	@Override
	public List listGoods() throws DataAccessException {
		
		return goodsDAO.selectAllGoodsList();
	}

	@Override
	public List companyGoods(String company) throws DataAccessException {
		return goodsDAO.companyGoodsList(company);
	}
	
}
