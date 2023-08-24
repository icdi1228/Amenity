package com.amenity.coupon.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.amenity.coupon.dao.CouponDAO;
import com.amenity.coupon.vo.CouponVO;

@Service("couponService")
public class CouponServiceImpl implements CouponService {
	
	@Autowired
    private CouponDAO couponDAO;
	
	 @Override
	    public void createCoupon(Map articleMap) throws Exception {
	        couponDAO.createCoupon(articleMap);
	    }

	@Override
	public List<CouponVO> viewCoupon() throws Exception {
		return couponDAO.viewCoupon();
	}

	@Override
	public void receiveCoupon(Map articleMap) throws Exception {
		couponDAO.receiveCoupon(articleMap);
		
	}

	@Override
	public List findMyCoupon(String u_id) throws DataAccessException {
		return couponDAO.findMyCoupon(u_id);
	}
	 
	
	
}
