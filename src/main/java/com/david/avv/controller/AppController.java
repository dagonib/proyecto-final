package com.david.avv.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.david.avv.model.Enroll;
import com.david.avv.model.Instructor;
import com.david.avv.model.Workshop;
import com.david.avv.services.IEnrollService;
import com.david.avv.services.IInstructorService;
import com.david.avv.services.IWorkshopService;

@Controller
public class AppController {
	
	@Autowired
	private IInstructorService instructorService;
	
	@Autowired
	private IWorkshopService workshopService;

	@Autowired
	private IEnrollService enrollService;
	
	@GetMapping("/")
	public String inicio(Model modelo) {
//		Todos los talleres
		List<Workshop> workshops = workshopService.getWorkshops();
		modelo.addAttribute("workshops", workshops);
		
		return "index";
	}
	
	@GetMapping("/talleres")
	public String talleres(Model modelo) {
//		Todos los talleres
		List<Workshop> workshops = workshopService.getWorkshops();
		modelo.addAttribute("workshops", workshops);
		
//		Datos del tallerista
//		List<Instructor> instructors = instructorService.getInstructors();
//		modelo.addAttribute("instructors", instructors);
		
//		Lista de inscritos por taller
//		List<Enroll> enrolls = enrollService.getEnrolls();
//		modelo.addAttribute("enrolls", enrolls);
		
		return "talleres";
	}
	
	@GetMapping("/instructores") 
	public String instructores(Model modelo) {
		List<Instructor> instructors = instructorService.getInstructors();
		modelo.addAttribute("instructors", instructors);
		return "instructores";
	}
	
	@GetMapping("/instructor") 
	public String instructor(Model modelo, @RequestParam("idinstructor") int idinstructor) {
		Instructor instructor = instructorService.getInstructor(idinstructor);
		modelo.addAttribute("instructor", instructor);
		List<Workshop> workshops = workshopService.getWorkshops(idinstructor);
		modelo.addAttribute("workshops", workshops);
		return "instructor";
	}
	
	@GetMapping("/inscritos")
	public String enroll(Model modelo) {
		List<Enroll> enrolls = enrollService.getEnrolls();
		modelo.addAttribute("enrolls", enrolls);		
		return "inscritos";
	}
	
	@GetMapping("/addenroll")
	public String updateEnroll(Model modelo, @RequestParam("idworkshop") int idworkshop) {		
			Enroll enroll = new Enroll();
			modelo.addAttribute(enroll);
			Workshop workshop = workshopService.getWorkshop(idworkshop);
			modelo.addAttribute(workshop);
			return "form-enroll";	
	}
	
	@PostMapping("/saveenroll")
	public String saveEnroll(@Valid @ModelAttribute("enroll") Enroll enroll, BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			return "form-enroll";
		}else {	
			enrollService.save(enroll);
			return "redirect:/";
		}
	}
}
