package com.david.avv.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.david.avv.model.Instructor;

@Repository
public class InstructorDAO implements IInstructorDAO {
	
	@Autowired
	private SessionFactory sessionFactoy;
	
	@Override
	public List<Instructor> getInstructors() {
		Session miSesion = sessionFactoy.getCurrentSession();
		List<Instructor> instructor = miSesion.createQuery("from Instructor", Instructor.class).list();
		return instructor;
	}

	@Override
	public Instructor getInstructor(int idinstructor) {
		Session miSesion = sessionFactoy.getCurrentSession();
		return miSesion.get(Instructor.class, idinstructor);
	}

	@Override
	public void save(Instructor instructor) {
		Session miSesion = sessionFactoy.getCurrentSession();
		miSesion.saveOrUpdate(instructor);
	}

	@Override
	public void delete(Instructor instructor) {
		Session miSesion = sessionFactoy.getCurrentSession();
		miSesion.delete(instructor);
	}

}
