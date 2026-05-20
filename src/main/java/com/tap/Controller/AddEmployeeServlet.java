package com.tap.Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.tap.DaoImp.EmployeeDaoImp;
import com.tap.Model.Employee;
import com.tap.util.ValidationUtil;

@WebServlet("/CallServlet")
public class AddEmployeeServlet extends HttpServlet
{
	private static final Logger logger = LogManager.getLogger(AddEmployeeServlet.class);
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		try {
			String name = req.getParameter("fullName");
			String fathersName = req.getParameter("fathersName");
			String dateOfBirth = req.getParameter("dob");
			String salary = req.getParameter("salary");
			String address = req.getParameter("address");
			String phoneNumber = req.getParameter("phone");
			String emailId = req.getParameter("email");
			String highestEducation = req.getParameter("highestEducation");
			String designation = req.getParameter("designation");
			String aadharNo = req.getParameter("aadharNo");
			
			// Validate all inputs
			if (!ValidationUtil.isValidName(name)) {
				logger.warn("Invalid employee name: {}", name);
				req.setAttribute("error", "Invalid name. Use only letters and spaces.");
				forwardToPage(req, resp, "addEmployee.jsp");
				return;
			}
			
			if (!ValidationUtil.isValidEmail(emailId)) {
				logger.warn("Invalid employee email: {}", emailId);
				req.setAttribute("error", "Invalid email format.");
				forwardToPage(req, resp, "addEmployee.jsp");
				return;
			}
			
			if (!ValidationUtil.isValidPhone(phoneNumber)) {
				logger.warn("Invalid phone number: {}", phoneNumber);
				req.setAttribute("error", "Invalid phone number. Must be 10 digits.");
				forwardToPage(req, resp, "addEmployee.jsp");
				return;
			}
			
			if (!ValidationUtil.isValidAadhar(aadharNo)) {
				logger.warn("Invalid Aadhar number: {}", aadharNo);
				req.setAttribute("error", "Invalid Aadhar number. Must be 12 digits.");
				forwardToPage(req, resp, "addEmployee.jsp");
				return;
			}
			
			if (!ValidationUtil.isValidSalary(salary)) {
				logger.warn("Invalid salary: {}", salary);
				req.setAttribute("error", "Invalid salary. Must be a positive number.");
				forwardToPage(req, resp, "addEmployee.jsp");
				return;
			}
			
			if (!ValidationUtil.isValidDate(dateOfBirth)) {
				logger.warn("Invalid date of birth: {}", dateOfBirth);
				req.setAttribute("error", "Invalid date format. Use YYYY-MM-DD.");
				forwardToPage(req, resp, "addEmployee.jsp");
				return;
			}
			
			// Generate employee ID
			String employeeId = "TAP" + dateOfBirth.substring(5, 7) + 
			                    dateOfBirth.substring(8, 10) + phoneNumber.substring(6);
			
			Employee e = new Employee(employeeId, name, fathersName, dateOfBirth, 
			                         Double.parseDouble(salary), address, phoneNumber, 
			                         emailId, highestEducation, designation, aadharNo);
			
			EmployeeDaoImp emp = new EmployeeDaoImp();
			int val = emp.insertEmployee(e);
			
			if (val != 0) {
				logger.info("Employee added successfully: {}", employeeId);
				req.setAttribute("employeeId", employeeId);
				forwardToPage(req, resp, "insertsucessful.jsp");
			} else {
				logger.error("Failed to add employee: {}", employeeId);
				req.setAttribute("error", "Failed to add employee. Email or Aadhar might already exist.");
				forwardToPage(req, resp, "addEmployee.jsp");
			}
			
		} catch (NumberFormatException e) {
			logger.error("Invalid number format", e);
			req.setAttribute("error", "Invalid number format in salary or date.");
			forwardToPage(req, resp, "addEmployee.jsp");
		} catch (Exception e) {
			logger.error("Error adding employee", e);
			req.setAttribute("error", "An error occurred while adding employee. Please try again.");
			forwardToPage(req, resp, "addEmployee.jsp");
		}
	}
	
	private void forwardToPage(HttpServletRequest req, HttpServletResponse resp, String page) 
			throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(page);
		rd.forward(req, resp);
	}
}
