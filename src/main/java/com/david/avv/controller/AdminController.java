package com.david.avv.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.david.avv.model.Enroll;
import com.david.avv.model.Instructor;
import com.david.avv.model.Workshop;
import com.david.avv.services.IEnrollService;
import com.david.avv.services.IInstructorService;
import com.david.avv.services.IWorkshopService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private IInstructorService instructorService;

	@Autowired
	private IWorkshopService workshopService;

	@Autowired
	private IEnrollService enrollService;
	
	@GetMapping("/deleteinstructor")
	public String deleteInstructor(Model modelo, @RequestParam("idinstructor") int idinstructor) {
		Instructor instructor = instructorService.getInstructor(idinstructor);
		instructorService.delete(instructor);
		return "redirect:/instructores";
	}
	
	@GetMapping("/deleteworkshop")
	public String deleteWorkshop(Model modelo, @RequestParam("idworkshop") int idworkshop) {
		Workshop workshop = workshopService.getWorkshop(idworkshop);
		workshopService.delete(workshop);
		return "redirect:/talleres";
	}
	
	@GetMapping("/deleteenroll")
	public String deleteEnroll(Model modelo, @RequestParam("idenroll") int idenroll) {
		Enroll enroll = enrollService.getEnroll(idenroll);
		enrollService.delete(enroll);
		return "redirect:/inscritos";
	}
}
