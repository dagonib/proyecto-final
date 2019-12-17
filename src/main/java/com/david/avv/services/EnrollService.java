package com.david.avv.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.david.avv.dao.IEnrollDAO;
import com.david.avv.model.Enroll;

@Service("enrollService")
public class EnrollService implements IEnrollService {
	
	@Autowired
	private IEnrollDAO enrollDAO;
	
	@Override
	@Transactional
	public List<Enroll> getEnrolls() {
		return enrollDAO.getEnrolls();
	}

	@Override
	@Transactional
	public List<Enroll> getEnrolls(int idworkshop) {
		return enrollDAO.getEnrolls(idworkshop);
	}

	@Override
	@Transactional
	public Enroll getEnroll(int idenroll) {
		return enrollDAO.getEnroll(idenroll);
	}

	@Override
	@Transactional
	public void save(Enroll enroll) {
		enrollDAO.save(enroll);		
	}

	@Override
	@Transactional
	public void delete(Enroll enroll) {
		enrollDAO.delete(enroll);		
	}

}
