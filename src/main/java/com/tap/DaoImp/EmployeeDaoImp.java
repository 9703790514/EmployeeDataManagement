package com.tap.DaoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.tap.Dao.EmployeeDao;
import com.tap.Model.Employee;

public class EmployeeDaoImp implements EmployeeDao
{
	private static final Logger logger = LogManager.getLogger(EmployeeDaoImp.class);

	public List<Employee> getAllEmployee() 
	{
		String query = "select * from employee;";
		List<Employee> al = new ArrayList<>();
		
		try (Connection con = Connector.requestConnection();
		     Statement stat = con.createStatement();
		     ResultSet res = stat.executeQuery(query)) {
			
			while (res.next()) {
				String employeeId = res.getString(1);
				String name = res.getString(2);
				String fathersName = res.getString(3);
				String dateOfBirth = res.getString(4);
				double salary = res.getDouble(5);
				String address = res.getString(6);
				String phoneNumber = res.getString(7);
				String emailId = res.getString(8);
				String highestEducation = res.getString(9);
				String designation = res.getString(10);
				String aadharNo = res.getString(11);
				
				Employee e = new Employee(employeeId, name, fathersName, dateOfBirth, 
				                         salary, address, phoneNumber, emailId, 
				                         highestEducation, designation, aadharNo);
				al.add(e);
			}
			
			logger.debug("Retrieved {} employees", al.size());
			return al;
			
		} catch (Exception e) {
			logger.error("Error fetching all employees", e);
		}
		
		return al;
	}

	public Employee getEmployee(String employeeId)
	{
		String query = "select * from employee where employeeId = ?;";
		
		try (Connection con = Connector.requestConnection();
		     PreparedStatement pstmt = con.prepareStatement(query)) {
			
			pstmt.setString(1, employeeId);
			
			try (ResultSet res = pstmt.executeQuery()) {
				if (res.next()) {
					String employeeIdd = res.getString(1);
					String name = res.getString(2);
					String fathersName = res.getString(3);
					String dateOfBirth = res.getString(4);
					Double salary = res.getDouble(5);
					String address = res.getString(6);
					String phoneNumber = res.getString(7);
					String emailId = res.getString(8);
					String highestEducation = res.getString(9);
					String designation = res.getString(10);
					String aadharNo = res.getString(11);
					
					Employee e = new Employee(employeeIdd, name, fathersName, dateOfBirth, 
					                         salary, address, phoneNumber, emailId, 
					                         highestEducation, designation, aadharNo);
					
					logger.debug("Retrieved employee: {}", employeeId);
					return e;
				}
			}
			
		} catch (Exception e) {
			logger.error("Error fetching employee: {}", employeeId, e);
		}
		
		return new Employee();
	}

	public int insertEmployee(Employee employee) 
	{
		String query = "INSERT INTO employee (employeeId, Name, FathersName, DateOfBirth, " +
		              "Salary, Address, PhoneNumber, EmailID, HighestEducation, Designation, AadharNo) " +
		              "VALUES(?,?,?,?,?,?,?,?,?,?,?);";
		
		try (Connection con = Connector.requestConnection();
		     PreparedStatement pstmt = con.prepareStatement(query)) {
			
			pstmt.setString(1, employee.getEmployeeId());
			pstmt.setString(2, employee.getName());
			pstmt.setString(3, employee.getFathersName());
			pstmt.setString(4, employee.getDateOfBirth());
			pstmt.setDouble(5, employee.getSalary());
			pstmt.setString(6, employee.getAddress());
			pstmt.setString(7, employee.getPhoneNumber());
			pstmt.setString(8, employee.getEmailId());
			pstmt.setString(9, employee.getHighestEducation());
			pstmt.setString(10, employee.getDesignation());
			pstmt.setString(11, employee.getAadharNo());
			
			int result = pstmt.executeUpdate();
			logger.info("Employee inserted: {}", employee.getEmployeeId());
			return result;
			
		} catch (Exception e) {
			logger.error("Error inserting employee: {}", employee.getEmployeeId(), e);
		}
		
		return 0;
	}

	public int updateEmployee(Employee employee)
	{
		String query = "UPDATE employee SET Name = ?, FathersName = ?, DateOfBirth = ?, " +
		              "Salary = ?, Address = ?, PhoneNumber = ?, EmailID = ?, " +
		              "HighestEducation = ?, Designation = ?, AadharNo = ? WHERE EmployeeID = ?";

		try (Connection con = Connector.requestConnection();
		     PreparedStatement pstmt = con.prepareStatement(query)) {
			
			pstmt.setString(1, employee.getName());
			pstmt.setString(2, employee.getFathersName());
			pstmt.setString(3, employee.getDateOfBirth());
			pstmt.setDouble(4, employee.getSalary());
			pstmt.setString(5, employee.getAddress());
			pstmt.setString(6, employee.getPhoneNumber());
			pstmt.setString(7, employee.getEmailId());
			pstmt.setString(8, employee.getHighestEducation());
			pstmt.setString(9, employee.getDesignation());
			pstmt.setString(10, employee.getAadharNo());
			pstmt.setString(11, employee.getEmployeeId());
			
			int result = pstmt.executeUpdate();
			logger.info("Employee updated: {}", employee.getEmployeeId());
			return result;
			
		} catch (Exception e) {
			logger.error("Error updating employee: {}", employee.getEmployeeId(), e);
		}
		
		return 0;
	}

	public int deleteEmployee(String employeeId)
	{
		String query = "delete from employee where employeeId = ?";
		
		try (Connection con = Connector.requestConnection();
		     PreparedStatement pstmt = con.prepareStatement(query)) {
			
			pstmt.setString(1, employeeId);
			int result = pstmt.executeUpdate();
			logger.info("Employee deleted: {}", employeeId);
			return result;
			
		} catch (Exception e) {
			logger.error("Error deleting employee: {}", employeeId, e);
		}
		
		return 0;
	}
}
