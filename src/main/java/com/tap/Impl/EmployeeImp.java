package com.tap.Impl;

import java.util.List;
import java.util.Scanner;

import com.tap.DaoImp.EmployeeDaoImp;
import com.tap.Model.Employee;

public class EmployeeImp 
{
	public static void main(String[] args)
	{
		Scanner scan = new Scanner(System.in);
		EmployeeDaoImp emp = new EmployeeDaoImp();
		List<Employee> list = emp.getAllEmployee();
		
		for(Employee ee : list)
		{
			System.out.println(ee.toString());
		}
		
		
		
		System.out.println("Enter Employee details");
		String s = scan.nextLine().trim();
		String a[] = s.split(",");   
		Employee e3 = new Employee(a[0],a[1],a[2],a[3],Double.parseDouble(a[4]),a[5],a[6],a[7],a[8],a[9],a[10]);
		System.out.println(emp.insertEmployee(e3));
		
		System.out.println("Enter Employee details");
		String s1 = scan.nextLine().trim();
		String a1[] = s.split(",");   
		Employee e4 = new Employee(a1[0],a1[1],a1[2],a1[3],Double.parseDouble(a1[4]),a1[5],a1[6],a1[7],a1[8],a1[9],a1[10]);
		System.out.println(emp.updateEmployee(e4));
		
		
		System.out.println("Enter id");
		String n = scan.nextLine();
		Employee e = emp.getEmployee(n);
		System.out.println(e.toString());
		
		List<Employee> listt = emp.getAllEmployee();
		
		for(Employee ee : listt)
		{
			System.out.println(ee.toString());
		}

		

		

	}

}
