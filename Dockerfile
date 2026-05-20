# Use official Tomcat 10 image
FROM tomcat:9.0-jdk21

# Copy the WAR file from the target directory
COPY target/EmployeeDataManagement.war /usr/local/tomcat/webapps/

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]