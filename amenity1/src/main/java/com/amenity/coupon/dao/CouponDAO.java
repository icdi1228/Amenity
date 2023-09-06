package com.amenity.coupon.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.amenity.coupon.vo.CouponVO;

@Mapper
@Repository("couponDAO")
public interface CouponDAO {
	void createCoupon(Map articleMap);
	public List<CouponVO> viewCoupon() throws DataAccessException;
	void receiveCoupon(Map articleMap);
	public List findMyCoupon(String u_id) throws DataAccessException;
	public int couponCount(String u_id) throws DataAccessException;
	public void useCoupon(Map<String, Object> resMap)throws DataAccessException;
}
