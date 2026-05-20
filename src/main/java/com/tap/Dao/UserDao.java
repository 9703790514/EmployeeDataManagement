package com.tap.Dao;

import java.util.List;

import com.tap.Model.User;

public interface UserDao 
{
	List<User> getAllUser();
	User getUser(int userId);
	int insertUser(User user);
	int updateUser(User user);
	int deleteUser(int user);
}
