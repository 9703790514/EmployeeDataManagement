package com.tap.Model;

public class Employee 
{
	    private String employeeId;
	    private String name;
	    private String fathersName;
	    private String dateOfBirth;
	    private double salary;
	    private String address;
	    private String phoneNumber;
	    private String emailId;
	    private String highestEducation;
	    private String designation;
	    private String aadharNo;

	    public Employee() {}

	    public Employee(String employeeId, String name, String fathersName, String dateOfBirth, double salary, 
	                    String address, String phoneNumber, String emailId, String highestEducation, 
	                    String designation, String aadharNo) {
	        this.employeeId = employeeId;
	        this.name = name;
	        this.fathersName = fathersName;
	        this.dateOfBirth = dateOfBirth;
	        this.salary = salary;
	        this.address = address;
	        this.phoneNumber = phoneNumber;
	        this.emailId = emailId;
	        this.highestEducation = highestEducation;
	        this.designation = designation;
	        this.aadharNo = aadharNo;
	    }

	    public String getEmployeeId() {
	        return employeeId;
	    }

	    public void setEmployeeId(String employeeId) {
	        this.employeeId = employeeId;
	    }

	    public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name;
	    }

	    public String getFathersName() {
	        return fathersName;
	    }

	    public void setFathersName(String fathersName) {
	        this.fathersName = fathersName;
	    }

	    public String getDateOfBirth() {
	        return dateOfBirth;
	    }

	    public void setDateOfBirth(String dateOfBirth) {
	        this.dateOfBirth = dateOfBirth;
	    }

	    public double getSalary() {
	        return salary;
	    }

	    public void setSalary(double salary) {
	        this.salary = salary;
	    }

	    public String getAddress() {
	        return address;
	    }

	    public void setAddress(String address) {
	        this.address = address;
	    }

	    public String getPhoneNumber() {
	        return phoneNumber;
	    }

	    public void setPhoneNumber(String phoneNumber) {
	        this.phoneNumber = phoneNumber;
	    }

	    public String getEmailId() {
	        return emailId;
	    }

	    public void setEmailId(String emailId) {
	        this.emailId = emailId;
	    }

	    public String getHighestEducation() {
	        return highestEducation;
	    }

	    public void setHighestEducation(String highestEducation) {
	        this.highestEducation = highestEducation;
	    }

	    public String getDesignation() {
	        return designation;
	    }

	    public void setDesignation(String designation) {
	        this.designation = designation;
	    }

	    public String getAadharNo() {
	        return aadharNo;
	    }

	    public void setAadharNo(String aadharNo) {
	        this.aadharNo = aadharNo;
	    }

	    @Override
	    public String toString() {
	        return  employeeId +
	                ","+ name +
	                "," + fathersName +
	                "," + dateOfBirth  +
	                "," + salary +
	                "," + address +
	                "," + phoneNumber  +
	                "," + emailId  +
	                "," + highestEducation  +
	                "," + designation +
	                "," + aadharNo ;
	    }
	

}
