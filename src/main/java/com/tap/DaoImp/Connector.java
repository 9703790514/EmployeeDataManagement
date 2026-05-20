package com.tap.DaoImp;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Connector 
{
	private static final Logger logger = LogManager.getLogger(Connector.class);
	private static Properties properties = new Properties();
	private static String url;
	private static String username;
	private static String password;
	
	// Static block to load database properties
	static {
		loadDatabaseProperties();
	}
	
	/**
	 * Load database configuration from properties file
	 */
	private static void loadDatabaseProperties() {
		try (InputStream input = Connector.class.getClassLoader()
				.getResourceAsStream("database.properties")) {
			
			if (input == null) {
				logger.warn("database.properties not found, using default values");
				// Fallback to default local database
				url = "jdbc:mysql://localhost:3306/employee_management";
				username = "root";
				password = "root";
				return;
			}
			
			properties.load(input);
			url = properties.getProperty("db.url");
			username = properties.getProperty("db.username");
			password = properties.getProperty("db.password");
			
			logger.info("Database configuration loaded successfully");
			
		} catch (IOException e) {
			logger.error("Error loading database properties", e);
			// Use defaults as fallback
			url = "jdbc:mysql://localhost:3306/employee_management";
			username = "root";
			password = "root";
		}
	}
 	
	/**
	 * Get database connection
	 * @return Connection object
	 * @throws Exception if connection fails
	 */
	public static Connection requestConnection() throws Exception {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			logger.debug("Database connection established");
			return con;
		} catch (Exception e) {
			logger.error("Failed to establish database connection", e);
			throw e;
		}
	}
}
