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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.david.avv.model.Enroll;
import com.david.avv.model.Instructor;
import com.david.avv.model.Workshop;
import com.david.avv.services.IEnrollService;
import com.david.avv.services.IInstructorService;
import com.david.avv.services.IWorkshopService;

@Controller
@RequestMapping("/secretario")
public class SecretarioController {
	
	@Autowired
	private IInstructorService instructorService;
	
	@Autowired
	private IWorkshopService workshopService;
	
	@Autowired
	private IEnrollService enrollService;
	
	@GetMapping("/addinstructor")
	public String addInstructor(Model modelo) {
		Instructor instructor = new Instructor();
		modelo.addAttribute(instructor);
		return "form-instructor";
	}
	
	@GetMapping("/updateinstructor")
	public String updateInstructor(Model modelo, @RequestParam("idinstructor") int idinstructor) {
		Instructor instructor = instructorService.getInstructor(idinstructor);
		modelo.addAttribute(instructor);
		return "form-instructor";
	}
	
	@PostMapping("/saveinstructor")
	public String saveInstructor(@Valid @ModelAttribute("instructor") Instructor instructor, BindingResult bindingResult){
		if(bindingResult.hasErrors()) {
			return "form-instructor";
		}else {
			instructorService.save(instructor);
			return "redirect:/instructores";
		}
	}
	
	@GetMapping("/addworkshop")
	public String addWorkshop(Model modelo) {
		Workshop workshop = new Workshop();
		modelo.addAttribute(workshop);
		List<Instructor> instructors = instructorService.getInstructors();
		modelo.addAttribute("instructors", instructors);
		return "form-workshop";
	}
	
	@GetMapping("/updateworkshop")
	public String updateWorkshop(Model modelo, @RequestParam("idworkshop") int idworkshop) {
		Workshop workshop = workshopService.getWorkshop(idworkshop);
		modelo.addAttribute(workshop);
		List<Instructor> instructors = instructorService.getInstructors();
		modelo.addAttribute("instructors", instructors);
		return "form-workshop";
	}
	
	@PostMapping("/saveworkshop")
	public String saveWorkshop(@ModelAttribute("workshop") Workshop workshop) {
		workshopService.save(workshop);
		return "redirect:/talleres";
	}
	
	
	@GetMapping("/updateenroll")
	public String updateEnroll(Model modelo, @RequestParam("idenroll") int idenroll) {
		Enroll enroll = enrollService.getEnroll(idenroll);
		modelo.addAttribute(enroll);
		return "form-enroll-update";
	}
	
	@PostMapping("/saveenrollupdate")
	public String saveEnroll(@Valid @ModelAttribute("enroll") Enroll enroll, BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			return "form-enroll-update";
		}else {	
			enrollService.save(enroll);
			return "redirect:/inscritos";
		}
	}
	
}
