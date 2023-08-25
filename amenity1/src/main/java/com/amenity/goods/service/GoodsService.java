package com.amenity.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.amenity.goods.vo.GoodsVO;

public interface GoodsService {
	public void addNewGoods(Map<String, Object> goodsMap) throws DataAccessException;
	public String goodsName(Map<String, Object> goodsMap) throws DataAccessException;
    public void insertMainImg(Map<String, Object> goodsMap) throws DataAccessException;
    public void insertSubImg(Map<String, Object> goodsMap) throws DataAccessException;
    
    //2023.08.23 추가
    public List<String> myCompanyList(String b_no) throws DataAccessException;
	public List listGoods() throws DataAccessException;
	public List selectGoodsByCompany(String room) throws DataAccessException;
	public List companyGoods(String company) throws DataAccessException;
	public GoodsVO selectGoodsByNo(int g_no) throws DataAccessException;
	public List<String> viewMainImg(String goods) throws Exception;
	public List<String> viewSubImg(String goods) throws Exception;
	public List<String> selectRoom(String company) throws Exception;
}
