package com.david.avv.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="workshop")
public class Workshop {
	
	@Id
	@Column(name="idworkshop")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idworkshop;
	
	@Column(name="title")
	private String title;
	
	@Column(name="description")
	private String description;
	
	@Column(name="price")
	private BigDecimal price;
	
	@Column(name="day")
	private String day;
	
	@ManyToOne(fetch = FetchType.EAGER,
			   cascade = {CascadeType.PERSIST, CascadeType.MERGE,
					      CascadeType.DETACH, CascadeType.REFRESH})
	@JoinColumn(name="idinstructor")
	private Instructor instructor;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy="workshop",
			   cascade = {CascadeType.PERSIST, CascadeType.MERGE, 
			   			 CascadeType.DETACH, CascadeType.REFRESH})
	private List<Enroll> enrolls;
	
	public Workshop() {}
	
	public Workshop(int idworkshop, String title) {
		super();
		this.idworkshop = idworkshop;
		this.title = title;
	}

	public int getIdworkshop() {
		return idworkshop;
	}

	public void setIdworkshop(int idworkshop) {
		this.idworkshop = idworkshop;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public Instructor getInstructor() {
		return instructor;
	}

	public void setInstructor(Instructor instructor) {
		this.instructor = instructor;
	}
	
	public List<Enroll> getEnrolls() {
		return enrolls;
	}

	public void setEnrolls(List<Enroll> enrolls) {
		this.enrolls = enrolls;
	}

	public void addEnroll(Enroll enroll) {
		if(enrolls==null) {
			enrolls = new ArrayList<Enroll>();
		}
		enrolls.add(enroll);
		((Enroll) enrolls).setWorkshop(this);
	}

	@Override
	public String toString() {
		return "Taller: [idworkshop = " + idworkshop + ", título = " + title + ", descripción = " + description + ", precio = " + price + "]";
	}
	
}
