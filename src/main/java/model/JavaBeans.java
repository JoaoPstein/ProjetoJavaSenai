package model;

public class JavaBeans {
	
	private int id;
	private String name;
	private String address;
	private String registration;
	private String enrollmentModality;
	private String personType;
	
	public JavaBeans() {
		super();
	}
	
	public JavaBeans(int id, String name, String address, String registration, String enrollmentModality, String personType) {
		super();
		
		this.id = id;
		this.name = name;
		this.address = address;
		this.registration = registration;
		this.enrollmentModality = enrollmentModality;
		this.personType = personType;
	}
	
	public int getId(){
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName(){
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
	public String getRegistration() {
		return registration;
	}
	public void setRegistration(String registration) {
		this.registration = registration;
	}
	public String getEnrollmentModality() {
		return enrollmentModality;
	}
	public void setEnrollmentModality(String enrollmentModality) {
		this.enrollmentModality = enrollmentModality;
	}
	public String getPersonType() {
		return personType;
	}
	public void setPersonType(String personType) {
		this.personType = personType;
	}
}
