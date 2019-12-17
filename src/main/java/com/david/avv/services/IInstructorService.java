package com.david.avv.services;

import java.util.List;

import com.david.avv.model.Instructor;

public interface IInstructorService {
	
	List<Instructor> getInstructors();
	
	Instructor getInstructor(int idinstructor);
	
	void save(Instructor instructor);
	
	void delete(Instructor instructor);
}
