package com.amenity.business.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amenity.business.dao.BusinessDAO;
import com.amenity.business.vo.BusinessVO;

@Service("businessService")
public class BusinessServiceImpl implements BusinessService{
	@Autowired(required=true)
	private BusinessDAO businessDAO;

	@Autowired
	BusinessVO businessVO;
	
}
