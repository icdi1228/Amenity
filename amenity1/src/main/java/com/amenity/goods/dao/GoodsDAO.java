package com.amenity.goods.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.amenity.goods.vo.GoodsVO;

@Mapper
@Repository("goodsDAO")
public interface GoodsDAO {
	
	public void insertGoods(Map<String, Object> goodsMap) throws DataAccessException;
	public String selectGoodsName(Map<String, Object> goodsMap) throws DataAccessException;
	public List selectAllGoodsList() throws DataAccessException;
	public List selectGoodsByCompany(String room) throws DataAccessException;
	public List companyGoodsList(String company) throws DataAccessException;
	public void insertGoodsMainImage(Map<String, Object> goodsMap) throws DataAccessException;
	public void insertGoodsSubImage(Map<String, Object> goodsMap) throws DataAccessException;
	public GoodsVO selectGoodsByNo(int g_no) throws DataAccessException;
	public List<String> viewGoodsMainImage(String goods) throws Exception;
	public List<String> viewGoodsSubImage(String goods) throws Exception;
	public List<String> selectRoomName(String company) throws Exception;
	public int minGoods(String room) throws Exception;
	
	//사업자의 상품목록 불러오기
	public List<String> selectGoodsByBno(String b_no) throws DataAccessException;
	
	//사업자의 상품정보 업데이트
	public void updateGoodsInfo(Map<String, Object> goodsMap) throws DataAccessException;
	public void updateGoodsMainImg(Map<String, Object> goodsMap) throws DataAccessException;
	public void updateGoodsSubImg(Map<String, Object> goodsMap) throws DataAccessException;
	
	//사업자의 상품 삭제
	public int deleteGoodsInList(int g_no) throws DataAccessException;
}
