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
    
    
    
	public List listGoods() throws DataAccessException;
	public List selectGoodsByCompany(String room) throws DataAccessException;
	public List companyGoods(String company) throws DataAccessException;
	public GoodsVO selectGoodsByNo(int g_no) throws DataAccessException;
	public List<String> viewMainImg(String goods) throws Exception;
	public List<String> viewSubImg(String goods) throws Exception;
	public List<String> selectRoom(String company) throws Exception;
	public int goodsList(String room) throws Exception;
	
	//사업자의 상품목록 불러오기
    public List<String> myGoodsList(String b_no) throws DataAccessException;
    
    //사업자의 상품수정 업데이트
    public void modGoodsInList(Map<String, Object> goodsMap) throws DataAccessException;
    public void modGoodsMainImg(Map<String, Object> goodsMap) throws DataAccessException;
    public void modGoodsSusbImg(Map<String, Object> goodsMap) throws DataAccessException;
    
    //사업자의 상품 삭제
    public int deleteGoodsInList(int g_no) throws DataAccessException;

}
