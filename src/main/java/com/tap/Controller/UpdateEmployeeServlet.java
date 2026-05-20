package com.tap.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tap.DaoImp.EmployeeDaoImp;
import com.tap.Model.Employee;

@WebServlet("/updateeEmployeeCall")
public class UpdateEmployeeServlet extends HttpServlet
{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		     String employeeId = req.getParameter("employeeId");
		     String name = req.getParameter("name");
		     String fathersName = req.getParameter("fathersName");
		     String dateOfBirth = req.getParameter("dob");
		     String salary = req.getParameter("salary");
		     String address = req.getParameter("address");
		     String phoneNumber = req.getParameter("phone");
		     String emailId = req.getParameter("email");
		     String highestEducation = req.getParameter("highestEducation");
		     String designation = req.getParameter("designation");
		     String aadharNo = req.getParameter("aadharNo");
		     
		     Employee e = new Employee(employeeId,name,fathersName,dateOfBirth,Double.parseDouble(salary),address,phoneNumber,emailId,highestEducation,designation,aadharNo);
		     
		     EmployeeDaoImp employeeDaoImp = new EmployeeDaoImp();
		     
		     int val = employeeDaoImp.updateEmployee(e);
		     
		     if(val!=0)
		    	{
		    		RequestDispatcher rd = req.getRequestDispatcher("updatesuccessful.jsp");
		    		rd.forward(req, resp);
		    	}
		    	else
		    	{
		    		RequestDispatcher rd = req.getRequestDispatcher("viewUpdateEmployee.jsp");
		    		rd.forward(req, resp);
		    	}
	}
	

}
