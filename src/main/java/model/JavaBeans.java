package model;

public class JavaBeans {
	
	private String id;
	private String name;
	private String registration;
	private String address;
	private String enrollmentModality;
	private String personType;
	
	public JavaBeans() {
		super();
	}
	
	public JavaBeans(String name, String registration, String address, String enrollmentModality, String personType) {
		super();
		
		this.name = name;
		this.registration = registration;
		this.address = address;
		this.enrollmentModality = enrollmentModality;
		this.personType = personType;
	}
	
	public String getId(){
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName(){
		return name;
	}
	public void setName(String nome) {
		this.name = nome;
	}
	public String getRegistration() {
		return registration;
	}
	public void setRegistration(String matricula) {
		this.registration = matricula;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String endereco) {
		this.address = endereco;
	}
	public String getEnrollmentModality() {
		return enrollmentModality;
	}
	public void setEnrollmentModality(String modalidadeMatricula) {
		this.enrollmentModality = modalidadeMatricula;
	}
	public String getPersonType() {
		return personType;
	}
	public void setPersonType(String tipoPessoa) {
		this.personType = tipoPessoa;
	}
}
