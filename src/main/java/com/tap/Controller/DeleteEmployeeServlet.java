package com.tap.Controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.tap.DaoImp.EmployeeDaoImp;

@WebServlet("/deleteEmployeeCall")
public class DeleteEmployeeServlet extends HttpServlet
{
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
    {
    	String id = req.getParameter("employeeId");
    	EmployeeDaoImp employeeDaoImp = new EmployeeDaoImp();
    	int val = employeeDaoImp.deleteEmployee(id);
    	
    	if(val!=0)
    	{
    		RequestDispatcher rd = req.getRequestDispatcher("deletesuccessful.jsp");
    		rd.forward(req, resp);
    	}
    	else
    	{
    		RequestDispatcher rd = req.getRequestDispatcher("viewDeleteEmployees.jsp");
    		rd.forward(req, resp);
    	}
    	
  	
    }
}
