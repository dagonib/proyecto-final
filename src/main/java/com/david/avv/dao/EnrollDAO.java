package com.david.avv.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.david.avv.model.Enroll;

@Repository
public class EnrollDAO implements IEnrollDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Enroll> getEnrolls() {
		Session miSesion = sessionFactory.getCurrentSession();
		List<Enroll> enrolls = miSesion.createQuery("from Enroll", Enroll.class).list();
		return enrolls;
	}

	@Override
	public List<Enroll> getEnrolls(int idworkshop) {
		Session miSesion = sessionFactory.getCurrentSession();
		List<Enroll> enrolls = miSesion.createQuery("from Enroll where idworkshop=:idworkshop", Enroll.class).setParameter("idworkshop", idworkshop).list();
		return enrolls;
	}

	@Override
	public Enroll getEnroll(int idenroll) {
		Session miSesion = sessionFactory.getCurrentSession();
		return miSesion.get(Enroll.class, idenroll);
	}

	@Override
	public void save(Enroll enroll) {
		Session miSesion = sessionFactory.getCurrentSession();
		miSesion.saveOrUpdate(enroll);
	}

	@Override
	public void delete(Enroll enroll) {
		Session miSesion = sessionFactory.getCurrentSession();
		miSesion.delete(enroll);
	}

}
