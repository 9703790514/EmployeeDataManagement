package com.tap.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tap.DaoImp.EmployeeDaoImp;
import com.tap.Model.Employee;

@WebServlet("/Call1")
public class Veiw1EmployeeServlet extends HttpServlet
{
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		 EmployeeDaoImp employeeDaoImp = new EmployeeDaoImp();
		 List<Employee> list = employeeDaoImp.getAllEmployee();
		 req.setAttribute("list", list);
		 RequestDispatcher rd = req.getRequestDispatcher("deleteEmployee.jsp");
		 rd.forward(req, resp);
	}

}
