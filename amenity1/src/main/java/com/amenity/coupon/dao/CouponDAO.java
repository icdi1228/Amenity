package com.amenity.coupon.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.amenity.coupon.vo.CouponVO;

@Mapper
@Repository("couponDAO")
public interface CouponDAO {
	void createCoupon(CouponVO couponVO);
}
