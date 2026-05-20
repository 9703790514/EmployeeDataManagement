package com.tap.Impl;

import java.util.List;
import java.util.Scanner;

import com.tap.DaoImp.UserDaoImp;
import com.tap.Model.User;

public class UserImp {

	public static void main(String[] args)
	{
	  Scanner scan = new Scanner(System.in);
	  UserDaoImp userImp = new UserDaoImp();
	  List<User> list = userImp.getAllUser();
	  for(User user : list)
	  {
		  System.out.println(user.toString());
	  }
	  
	  System.out.println("Enter user details");
	  String s = scan.nextLine().trim();
	  String a[]  = s.split(",");
	  User u = new User(a[0],a[1],a[2],a[3]);
	  System.out.println(userImp.insertUser(u));

	}

}
