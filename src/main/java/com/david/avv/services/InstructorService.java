package com.david.avv.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.david.avv.dao.IInstructorDAO;
import com.david.avv.model.Instructor;

@Service("instructorService")
public class InstructorService implements IInstructorService {
	
	@Autowired
	private IInstructorDAO instructorDAO;
	
	@Override
	@Transactional
	public List<Instructor> getInstructors() {
		return instructorDAO.getInstructors();
	}

	@Override
	@Transactional
	public Instructor getInstructor(int idinstructor) {
		return instructorDAO.getInstructor(idinstructor);
	}

	@Override
	@Transactional
	public void save(Instructor instructor) {
		instructorDAO.save(instructor);		
	}

	@Override
	@Transactional
	public void delete(Instructor instructor) {
		instructorDAO.delete(instructor);		
	}

}
