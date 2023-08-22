package com.amenity.coupon.service;

import java.util.List;
import java.util.Map;

import com.amenity.coupon.vo.CouponVO;

public interface CouponService {
	public void createCoupon(Map articleMapO) throws Exception;
	public List<CouponVO> viewCoupon() throws Exception;
	public void receiveCoupon(Map articleMap) throws Exception;
}
