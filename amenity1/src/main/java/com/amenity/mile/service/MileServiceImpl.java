package com.amenity.mile.service;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.amenity.mile.dao.MileDAO;
import com.amenity.mile.vo.MileVO;

@Service("mileService")
public class MileServiceImpl implements MileService{
	
	@Autowired(required=true)
	private MileDAO mileDAO;

	@Autowired
	MileVO mileVO;
	
	
	@Override
	public void accumulateMile(@Param("u_id") String u_id, @Param("mile") int mile) throws DataAccessException {
		mileDAO.accumulateMile(u_id, mile);
		
	}


	@Override
	public int findMyMile(String u_id) throws DataAccessException {
		
		return mileDAO.findMyMile(u_id);
	}

	
	
	
}
