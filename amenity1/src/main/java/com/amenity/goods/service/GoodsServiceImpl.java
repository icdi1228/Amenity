package com.amenity.goods.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.amenity.goods.dao.GoodsDAO;
import com.amenity.goods.vo.GoodsVO;

@Service("goodsService")
@Transactional(propagation = Propagation.REQUIRED)
public class GoodsServiceImpl implements GoodsService{
	@Autowired(required=true)
	private GoodsVO goodsVO;
	
	@Autowired(required=true)
	private GoodsDAO goodsDAO;
	
	@Override
	public List listGoods() throws DataAccessException {
		
		return goodsDAO.selectAllGoodsList();
	}

	@Override
	public List<GoodsVO> selectGoodsByCompany(String company) throws DataAccessException {
	    return goodsDAO.selectGoodsByCompany(company);
	}

  @Override
	public List companyGoods(String company) throws DataAccessException {
		return goodsDAO.companyGoodsList(company);
	}

@Override
public GoodsVO selectGoodsByNo(int g_no) throws DataAccessException {
	return goodsDAO.selectGoodsByNo(g_no);
}
  
  
}
