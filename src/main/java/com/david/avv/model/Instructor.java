package com.david.avv.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import com.david.avv.validation.ValidarDni;
import com.david.avv.validation.ValidarEmail;

@Entity
@Table(name="instructor")
public class Instructor {

	@Id
	@Column(name="idinstructor")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idinstructor;
	
	@Column(name="name")
	private String name;
	
	
	@Column(name="email")
	@ValidarEmail
	private String email;
	
	@Pattern(regexp = "(\\d){3,3} \\d{2,2} \\d{2,2} \\d{2,2}",
             message = "El número de teléfono debe tener el siguiente formato: 111 11 11 11")
	@Column(name="telephone")
	private String telephone;
	
	@Column(name="dni")
	@ValidarDni
	private String dni;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy="instructor",
			   cascade = {CascadeType.PERSIST, CascadeType.MERGE, 
			   			 CascadeType.DETACH, CascadeType.REFRESH})
	private List<Workshop> workshops;
		
	public Instructor() { }
	
	public Instructor(String name, String email, String telephone, String dni) {
		super();
		this.name = name;
		this.email = email;
		this.telephone = telephone;
		this.dni = dni;
	}

	public int getIdinstructor() {
		return idinstructor;
	}

	public void setIdinstructor(int idinstructor) {
		this.idinstructor = idinstructor;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public List<Workshop> getWorkshops() {
		return workshops;
	}

	public void setWorkshops(List<Workshop> workshops) {
		this.workshops = workshops;
	}
	
	public void addWorkshop(Workshop workshop) {
		if(workshops == null) {
			workshops = new ArrayList<Workshop>();
		}
		workshops.add(workshop);
		workshop.setInstructor(this);
	}

	@Override
	public String toString() {
		return "Instructor [idinstructor = " + idinstructor + 
			   ", nombre = " + name +
			   ", email = " + email +
			   ", telehone = " + telephone +
			   ", dni = " + dni + "]";
	}
	
	
	
	
}
