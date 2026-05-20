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

import com.tap.DaoImp.UserDaoImp;
import com.tap.Model.User;
import com.tap.util.PasswordUtil;
import com.tap.util.ValidationUtil;

@WebServlet("/signupcall")
public class SignupServlet extends HttpServlet
{
	private static final Logger logger = LogManager.getLogger(SignupServlet.class);
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		try {
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phone = req.getParameter("phone");
			String password = req.getParameter("password");
			
			// Validate inputs
			if (!ValidationUtil.isNotEmpty(name) || !ValidationUtil.isValidName(name)) {
				logger.warn("Invalid name provided: {}", name);
				req.setAttribute("error", "Invalid name. Please use only letters and spaces.");
				forwardToPage(req, resp, "registration.jsp");
				return;
			}
			
			if (!ValidationUtil.isValidEmail(email)) {
				logger.warn("Invalid email provided: {}", email);
				req.setAttribute("error", "Invalid email format.");
				forwardToPage(req, resp, "registration.jsp");
				return;
			}
			
			if (!ValidationUtil.isValidPhone(phone)) {
				logger.warn("Invalid phone provided: {}", phone);
				req.setAttribute("error", "Invalid phone number. Must be 10 digits.");
				forwardToPage(req, resp, "registration.jsp");
				return;
			}
			
			if (!PasswordUtil.isPasswordStrong(password)) {
				logger.warn("Weak password provided");
				req.setAttribute("error", "Password must be at least 6 characters long.");
				forwardToPage(req, resp, "registration.jsp");
				return;
			}
			
			// Hash the password before storing
			String hashedPassword = PasswordUtil.hashPassword(password);
			logger.debug("Password hashed successfully for user: {}", email);
			
			// Create user with hashed password
			UserDaoImp userDaoImp = new UserDaoImp();
			User user = new User(name, email, phone, hashedPassword);
			int n = userDaoImp.insertUser(user);
			
			if (n != 0) {
				logger.info("User registered successfully: {}", email);
				forwardToPage(req, resp, "registrationsuccessful.jsp");
			} else {
				logger.error("Failed to register user: {}", email);
				req.setAttribute("error", "Registration failed. Email might already exist.");
				forwardToPage(req, resp, "registration.jsp");
			}
			
		} catch (Exception e) {
			logger.error("Error during user registration", e);
			req.setAttribute("error", "An error occurred during registration. Please try again.");
			forwardToPage(req, resp, "registration.jsp");
		}
	}
	
	private void forwardToPage(HttpServletRequest req, HttpServletResponse resp, String page) 
			throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(page);
		rd.forward(req, resp);
	}
}
