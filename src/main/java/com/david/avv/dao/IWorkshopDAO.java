package com.david.avv.dao;

import java.util.List;

import com.david.avv.model.Workshop;

public interface IWorkshopDAO {
	
	List<Workshop> getWorkshops();
	
	List<Workshop> getWorkshops(int idinstructor);
	
	List<Workshop> getWorkshopsEnroll(int idenroll);
	
	Workshop getWorkshop(int idworkshop);
	
	void save(Workshop workshop);
	
	void delete(Workshop whorshop);	
	
}
