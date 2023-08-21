package com.amenity.coupon.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amenity.coupon.dao.CouponDAO;
import com.amenity.coupon.vo.CouponVO;

@Service("couponService")
public class CouponServiceImpl implements CouponService {
	
	@Autowired
    private CouponDAO couponDAO;
	
	 @Override
	    public void createCoupon(CouponVO couponVO) throws Exception {
	        couponDAO.createCoupon(couponVO);
	    }
}
