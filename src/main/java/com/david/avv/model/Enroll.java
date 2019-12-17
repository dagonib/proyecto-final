package com.david.avv.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;

import com.david.avv.validation.ValidarDni;
import com.david.avv.validation.ValidarEmail;

@Entity
@Table(name="enroll")
public class Enroll {

	@Id
	@Column(name="idenroll")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idenroll;
	
	@Column(name="name")
	private String name;
	
	@Column(name="address")
	private String address;
	
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
	
	@ManyToOne(fetch = FetchType.EAGER,
			   cascade = {CascadeType.PERSIST, CascadeType.MERGE,
					      CascadeType.DETACH, CascadeType.REFRESH})
	@JoinColumn(name="idworkshop")
	private Workshop workshop;
	
	public Enroll() {}

	public Enroll(String name, String address, String email, String telephone, String dni) {
		super();
		this.name = name;
		this.address = address;
		this.email = email;
		this.telephone = telephone;
		this.dni = dni;
	}

	public int getIdenroll() {
		return idenroll;
	}

	public void setIdenroll(int idenroll) {
		this.idenroll = idenroll;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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
	
	public Workshop getWorkshop() {
		return workshop;
	}

	public void setWorkshop(Workshop workshop) {
		this.workshop = workshop;
	}

	@Override
	public String toString() {
		return "Enroll [idenroll=" + idenroll + ", name=" + name + ", address=" + address + ", email="
				+ email + ", telephone=" + telephone + ", dni=" + dni + "]";
	}
	
}
