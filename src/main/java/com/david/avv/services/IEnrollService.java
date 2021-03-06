package com.david.avv.services;

import java.util.List;

import com.david.avv.model.Enroll;

public interface IEnrollService {
	
	List<Enroll> getEnrolls();
	
	List<Enroll> getEnrolls(int idworkshop);
	
	Enroll getEnroll(int idenroll);
	
	void save(Enroll enroll);
	
	void delete(Enroll enroll);
	
}
