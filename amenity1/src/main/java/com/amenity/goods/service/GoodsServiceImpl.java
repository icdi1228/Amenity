package com.amenity.goods.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.amenity.company.vo.CompanyVO;
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
	public void addNewGoods(Map<String, Object> goodsMap) throws DataAccessException{
		goodsDAO.insertGoods(goodsMap);
		return;
	}
	
	@Override
	public String goodsName(Map<String, Object> goodsMap) throws DataAccessException {
		return goodsDAO.selectGoodsName(goodsMap);
	}
	
	@Override    //2023.08.23 추가
    public List<String> myCompanyList(String b_no) throws DataAccessException {
		return goodsDAO.selectMyCompanyList(b_no);
	}
	
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
	public void insertMainImg(Map<String, Object> goodsMap) throws DataAccessException {
		goodsDAO.insertGoodsMainImage(goodsMap);
		
	}

	@Override
	public void insertSubImg(Map<String, Object> goodsMap) throws DataAccessException {
		goodsDAO.insertGoodsSubImage(goodsMap);
	}
}
