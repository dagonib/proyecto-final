package com.david.avv.dao;

import java.util.List;

import com.david.avv.model.Instructor;

public interface IInstructorDAO {

	List<Instructor> getInstructors();
	
	Instructor getInstructor(int idinstructor);
	
	void save(Instructor instructor);
	
	void delete(Instructor instructor);
	
}
