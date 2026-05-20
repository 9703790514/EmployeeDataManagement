package com.tap.DaoImp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.tap.Dao.UserDao;
import com.tap.Model.User;

public class UserDaoImp implements UserDao
{
	private static final Logger logger = LogManager.getLogger(UserDaoImp.class);

	public List<User> getAllUser() {
		String query = "select * from users;";
		List<User> al = new ArrayList<>();
		
		try (Connection con = Connector.requestConnection();
		     Statement stat = con.createStatement();
		     ResultSet res = stat.executeQuery(query)) {
			
			while (res.next()) {
				int userId = res.getInt(1);
				String fullName = res.getString(2);
				String emailId = res.getString(3);
				String phone = res.getString(4);
				String password = res.getString(5);
				
				User u = new User(userId, fullName, emailId, phone, password);
				al.add(u);
			}
			
			logger.debug("Retrieved {} users", al.size());
			
		} catch (Exception e) {
			logger.error("Error fetching all users", e);
		}
		
		return al;
	}

	public User getUser(int userId) {
		String query = "select * from users where user_id = ?;";
		
		try (Connection con = Connector.requestConnection();
		     PreparedStatement pstmt = con.prepareStatement(query)) {
			
			pstmt.setInt(1, userId);
			
			try (ResultSet res = pstmt.executeQuery()) {
				if (res.next()) {
					int id = res.getInt(1);
					String fullName = res.getString(2);
					String emailId = res.getString(3);
					String phone = res.getString(4);
					String password = res.getString(5);
					
					User u = new User(id, fullName, emailId, phone, password);
					logger.debug("Retrieved user: {}", userId);
					return u;
				}
			}
			
		} catch (Exception e) {
			logger.error("Error fetching user: {}", userId, e);
		}
		
		return null;
	}

	public int insertUser(User user)
	{
		String query = "INSERT INTO users (full_name, email, phone, password) VALUES (?, ?, ?, ?)";
		
		try (Connection con = Connector.requestConnection();
		     PreparedStatement pstmt = con.prepareStatement(query)) {
			
			pstmt.setString(1, user.getFullName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPhone());
			pstmt.setString(4, user.getPassword());
			
			int result = pstmt.executeUpdate();
			logger.info("User inserted: {}", user.getEmail());
			return result;
			
		} catch (Exception e) {
			logger.error("Error inserting user: {}", user.getEmail(), e);
		}
		
		return 0;
	}

	@Override
	public int updateUser(User user) {
		String query = "UPDATE users SET full_name = ?, email = ?, phone = ?, password = ? WHERE user_id = ?";
		
		try (Connection con = Connector.requestConnection();
		     PreparedStatement pstmt = con.prepareStatement(query)) {
			
			pstmt.setString(1, user.getFullName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPhone());
			pstmt.setString(4, user.getPassword());
			pstmt.setInt(5, user.getUserId());
			
			int result = pstmt.executeUpdate();
			logger.info("User updated: {}", user.getUserId());
			return result;
			
		} catch (Exception e) {
			logger.error("Error updating user: {}", user.getUserId(), e);
		}
		
		return 0;
	}

	@Override
	public int deleteUser(int userId) {
		String query = "DELETE FROM users WHERE user_id = ?";
		
		try (Connection con = Connector.requestConnection();
		     PreparedStatement pstmt = con.prepareStatement(query)) {
			
			pstmt.setInt(1, userId);
			int result = pstmt.executeUpdate();
			logger.info("User deleted: {}", userId);
			return result;
			
		} catch (Exception e) {
			logger.error("Error deleting user: {}", userId, e);
		}
		
		return 0;
	}
}
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUser(int user) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
   
}
