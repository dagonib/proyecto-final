package com.david.avv.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.david.avv.model.Workshop;

@Repository
public class WorkshopDAO implements IWorkshopDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Workshop> getWorkshops() {
		Session miSesion = sessionFactory.getCurrentSession();
		List<Workshop> talleres = miSesion.createQuery("from Workshop", Workshop.class).list();
		return talleres;
	}
	
	@Override
	public List<Workshop> getWorkshops(int idinstructor) {
		Session miSesion = sessionFactory.getCurrentSession();
		List<Workshop> talleres = miSesion.createQuery("from Workshop where idinstructor=:idinstructor", Workshop.class).setParameter("idinstructor",idinstructor).list();	
		return talleres;
	}

	@Override
	public Workshop getWorkshop(int idworkshop) {
		Session miSesion = sessionFactory.getCurrentSession();
		return miSesion.get(Workshop.class, idworkshop);
	}

	@Override
	public void save(Workshop workshop) {	
			Session miSesion = sessionFactory.getCurrentSession();
			miSesion.saveOrUpdate(workshop);
	}

	@Override
	public void delete(Workshop workshop) {
		Session miSesion = sessionFactory.getCurrentSession();
		miSesion.delete(workshop);
	}

	@Override
	public List<Workshop> getWorkshopsEnroll(int idenroll) {
		Session miSesion = sessionFactory.getCurrentSession();
		List<Workshop> talleresEnroll = miSesion.createQuery("from Workshop where idenroll=:idenroll", Workshop.class).setParameter("idnroll",idenroll).list();	
		return talleresEnroll;
	}

}
