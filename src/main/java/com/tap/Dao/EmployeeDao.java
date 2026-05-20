package com.tap.Dao;

import java.util.List;

import com.tap.Model.Employee;

public interface EmployeeDao
{
	List<Employee> getAllEmployee();
	Employee getEmployee(String employeeId);
	int insertEmployee(Employee employee);
	int updateEmployee(Employee employee);
	int deleteEmployee(String employeeId);	
}
