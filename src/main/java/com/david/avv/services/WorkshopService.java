package com.david.avv.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.david.avv.dao.IWorkshopDAO;
import com.david.avv.model.Workshop;

@Service("workshopService")
public class WorkshopService implements IWorkshopService {

	@Autowired
	private IWorkshopDAO workshopDAO;
	
	@Override
	@Transactional
	public List<Workshop> getWorkshops() {
		return workshopDAO.getWorkshops();
	}
	
	@Override
	@Transactional
	public List<Workshop> getWorkshops(int idinstructor) {
		return workshopDAO.getWorkshops(idinstructor);
	}

	@Override
	@Transactional
	public Workshop getWorkshop(int idworkshop) {
		return workshopDAO.getWorkshop(idworkshop);
	}

	@Override
	@Transactional
	public List<Workshop> getWorkshopsEnroll(int idenroll) {
		return workshopDAO.getWorkshopsEnroll(idenroll);
	}

	@Override
	@Transactional
	public void save(Workshop workshop) {
		workshopDAO.save(workshop);
	}

	@Override
	@Transactional
	public void delete(Workshop whorshop) {
		workshopDAO.delete(whorshop);
	}

}
