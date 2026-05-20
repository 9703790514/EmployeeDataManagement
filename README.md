"# Employee Data Management System

A web-based Employee Management System with user authentication and complete CRUD operations for employee records.

## 🛠 Technology Stack & Versions

| Technology | Version | Purpose |
|------------|---------|---------|
| Java | 21 | Backend programming language |
| Maven | 3.8+ | Build tool & dependency management |
| Apache Tomcat | 9.0 | Web server & servlet container |
| MySQL | 8.0+ | Database |
| MySQL Connector/J | 9.1.0 | JDBC driver |
| Servlet API | 4.0.1 | Web application framework |
| JSP API | 2.3.3 | View layer |
| JSTL | 1.2 | JSP Standard Tag Library |
| BCrypt | 0.4 | Password hashing |
| Log4j2 | 2.20.0 | Logging framework |

## ✨ Features

- **User Authentication**: Secure login/registration with BCrypt password hashing
- **Employee CRUD**: Add, view, update, delete employee records
- **Input Validation**: Comprehensive validation for all user inputs
- **Logging**: Structured logging with Log4j2
- **Session Management**: Secure session handling (30-min timeout)

## 📋 Prerequisites

Install these before starting:

1. **Java JDK 21** - [Download](https://adoptium.net/)
2. **Apache Maven 3.8+** - [Download](https://maven.apache.org/download.cgi)
3. **Apache Tomcat 9.0** - [Download](https://tomcat.apache.org/download-90.cgi)
4. **MySQL Server 8.0+** - [Download](https://dev.mysql.com/downloads/mysql/)

Verify installations:
```bash
java -version    # Should show Java 21
mvn -version     # Should show Maven 3.8+
mysql --version  # Should show MySQL 8.0+
```

## 🚀 Quick Setup (5 Minutes)

### Step 1: Clone Repository
```bash
git clone https://github.com/9703790514/EmployeeDataManagement.git
cd EmployeeDataManagement
```

### Step 2: Setup Database
```bash
# Start MySQL
mysql -u root -p

# Import schema (use the one with hashed passwords)
source database/schema-with-hashed-passwords.sql

# Exit MySQL
exit
```

### Step 3: Configure Database Connection
Edit `src/main/resources/database.properties`:
```properties
db.url=jdbc:mysql://localhost:3306/employee_management
db.username=root
db.password=YOUR_MYSQL_PASSWORD
```

### Step 4: Build Project
```bash
mvn clean install
mvn clean package
```

### Step 5: Deploy to Tomcat
```bash
# Copy WAR to Tomcat
copy target\EmployeeDataManagement.war C:\apache-tomcat-9.0.XX\webapps\

# Start Tomcat
C:\apache-tomcat-9.0.XX\bin\startup.bat
```

### Step 6: Access Application
Open browser: `http://localhost:8080/EmployeeDataManagement/login.jsp`

**Test Login:**
- Email: `admin@example.com`
- Password: `admin123`

## 🔧 Alternative: Quick Run with Maven
```bash
mvn clean package tomcat7:run
# Access at: http://localhost:8080/EmployeeDataManagement/
```

## 📁 Project Structure

```
EmployeeDataManagement/
├── src/main/
│   ├── java/com/tap/
│   │   ├── Controller/          # Servlets (Login, Signup, Employee CRUD)
│   │   ├── Dao/                 # Data Access Object interfaces
│   │   ├── DaoImp/              # DAO implementations
│   │   ├── Model/               # User & Employee models
│   │   └── util/                # Utilities (Validation, Password hashing)
│   ├── webapp/                  # JSP files & web resources
│   └── resources/
│       ├── database.properties  # DB configuration
│       └── log4j2.xml          # Logging configuration
├── database/
│   ├── schema.sql              # Original schema
│   └── schema-with-hashed-passwords.sql  # Secure schema
├── pom.xml                      # Maven configuration
└── README.md                    # This file
```

## 🗄 Database Schema

**Users Table:**
```sql
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    password VARCHAR(255) NOT NULL,  -- BCrypt hashed
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

**Employee Table:**
```sql
CREATE TABLE employee (
    employeeId VARCHAR(20) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    fathersName VARCHAR(100),
    dateOfBirth DATE,
    salary DECIMAL(10, 2) NOT NULL,
    address TEXT,
    phoneNumber VARCHAR(15) NOT NULL,
    emailId VARCHAR(100) NOT NULL UNIQUE,
    highestEducation VARCHAR(100),
    designation VARCHAR(100) NOT NULL,
    aadharNo VARCHAR(12) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## 🔒 Security Features

✅ **BCrypt Password Hashing** - Passwords stored as irreversible hashes  
✅ **Input Validation** - Email, phone, Aadhar, name, salary validation  
✅ **Externalized Config** - Database credentials in properties file  
✅ **SQL Injection Protection** - PreparedStatements throughout  
✅ **Structured Logging** - Log4j2 for production-ready logging  
✅ **Resource Management** - Auto-cleanup with try-with-resources  

## 🐛 Troubleshooting

**Database Connection Failed:**
```bash
# Check MySQL is running
mysql -u root -p

# Verify database exists
SHOW DATABASES;

# Check credentials in database.properties
```

**Port 8080 Busy:**
```bash
# Windows - Kill process
netstat -ano | findstr :8080
taskkill /PID <PID> /F
```

**Login Fails:**
- Use the new schema: `schema-with-hashed-passwords.sql`
- Test credentials: `admin@example.com / admin123`

**Logs Location:**
- Main log: `logs/employee-app.log`
- Error log: `logs/employee-app-error.log`

## 📝 API Endpoints

| URL | Method | Description |
|-----|--------|-------------|
| `/logincall` | POST | User login |
| `/signupcall` | POST | User registration |
| `/CallServlet` | POST | Add employee |
| `/viewemployee` | GET | View all employees |
| `/updateemployee` | POST | Update employee |
| `/deleteemployee` | POST | Delete employee |

## 👥 Contributors

Original Repository: [EmployeeDataManagement](https://github.com/9703790514/EmployeeDataManagement.git)

---

**Quick Start Complete! 🚀**" 
