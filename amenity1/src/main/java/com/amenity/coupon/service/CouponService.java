package com.amenity.coupon.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.amenity.coupon.vo.CouponVO;

public interface CouponService {
	public void createCoupon(Map articleMapO) throws Exception;
	public List<CouponVO> viewCoupon() throws Exception;
	public void receiveCoupon(Map articleMap) throws Exception;
	public List findMyCoupon(String u_id) throws DataAccessException;
	public int couponCount(String u_id) throws DataAccessException;
	public void useCoupon(Map<String, Object> resMap) throws DataAccessException;
}
