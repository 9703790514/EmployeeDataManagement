package com.tap.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.tap.DaoImp.UserDaoImp;
import com.tap.Model.User;
import com.tap.util.PasswordUtil;
import com.tap.util.ValidationUtil;

@WebServlet("/logincall")
public class LoginServlet extends HttpServlet
{
	private static final Logger logger = LogManager.getLogger(LoginServlet.class);
	
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		try {
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			// Validate inputs
			if (!ValidationUtil.isValidEmail(email)) {
				logger.warn("Invalid email format in login attempt: {}", email);
				req.setAttribute("error", "Invalid email format.");
				forwardToPage(req, resp, "login.jsp");
				return;
			}
			
			if (!ValidationUtil.isNotEmpty(password)) {
				logger.warn("Empty password in login attempt");
				req.setAttribute("error", "Password cannot be empty.");
				forwardToPage(req, resp, "login.jsp");
				return;
			}
			
			UserDaoImp userDaoImp = new UserDaoImp();
			List<User> list = userDaoImp.getAllUser();
			
			boolean loginSuccessful = false;
			String userName = null;
			
			for (User user : list) {
				if (user.getEmail().equals(email)) {
					// Verify password using BCrypt
					if (PasswordUtil.verifyPassword(password, user.getPassword())) {
						loginSuccessful = true;
						userName = user.getFullName();
						logger.info("User logged in successfully: {}", email);
						break;
					} else {
						logger.warn("Invalid password attempt for user: {}", email);
					}
				}
			}
			
			if (loginSuccessful) {
				// Create session and store user info
				HttpSession session = req.getSession();
				session.setAttribute("userName", userName);
				session.setAttribute("userEmail", email);
				session.setMaxInactiveInterval(1800); // 30 minutes
				
				forwardToPage(req, resp, "dashboard.jsp");
			} else {
				logger.warn("Failed login attempt for email: {}", email);
				req.setAttribute("error", "Invalid email or password.");
				forwardToPage(req, resp, "login.jsp");
			}
			
		} catch (Exception e) {
			logger.error("Error during login process", e);
			req.setAttribute("error", "An error occurred during login. Please try again.");
			forwardToPage(req, resp, "login.jsp");
		}
	}
	
	private void forwardToPage(HttpServletRequest req, HttpServletResponse resp, String page) 
			throws ServletException, IOException {
		RequestDispatcher rd = req.getRequestDispatcher(page);
		rd.forward(req, resp);
	}
}
