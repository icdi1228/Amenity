package com.amenity.res.dao;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.amenity.goods.vo.GoodsVO;
import com.amenity.res.vo.ResVO;

@Mapper
@Repository("resDAO")
public interface ResDAO {
	public List<ResVO> paycomres(int resNO) throws DataAccessException;
	public int insertRes(Map<String,Object> resMap) throws DataAccessException;
	public ResVO compleRes(int resNO) throws DataAccessException;
	public List<ResVO> myRes(String u_id) throws DataAccessException;
	public List<ResVO> selectAllRes(@Param("start") int start, @Param("limit") int limit) throws DataAccessException;
	public List<Integer> compareRes(@Param("checkin") String checkin,@Param("checkout") String checkout) throws DataAccessException;
	public List<String> selectCompanyResByBno(String b_no) throws DataAccessException;
	public int getTotalResCount() throws DataAccessException;

}
