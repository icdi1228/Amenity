package com.amenity.goods.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@Mapper
@Repository("goodsDAO")
public interface GoodsDAO {
	public List selectAllGoodsList() throws DataAccessException;
}
