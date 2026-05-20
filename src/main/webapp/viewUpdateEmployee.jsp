<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tap.Model.Employee" %>
<%@ page import="com.tap.DaoImp.EmployeeDaoImp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Employee</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            color: #e0e0e0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }

        .container {
            background: rgba(255, 255, 255, 0.05);
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 100%;
            text-align: center;
        }

        h2 {
            font-size: 2rem;
            color: #fff;
            margin-bottom: 1rem;
        }

        .form-group {
            text-align: left;
            margin-bottom: 1rem;
        }

        label {
            font-size: 1rem;
            color: #a0aec0;
            display: block;
            margin-bottom: 0.3rem;
        }

        input {
            width: 100%;
            padding: 0.8rem;
            font-size: 1rem;
            border-radius: 8px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            background: rgba(255, 255, 255, 0.1);
            color: #e0e0e0;
            outline: none;
        }

        input:focus {
            border-color: #00b4db;
            box-shadow: 0 0 8px rgba(0, 180, 219, 0.4);
        }

        .btn-container {
            display: flex;
            justify-content: space-between;
            margin-top: 1.5rem;
        }

        .btn {
            display: inline-block;
            padding: 0.8rem 1.5rem;
            font-size: 1rem;
            font-weight: 600;
            text-decoration: none;
            border-radius: 50px;
            transition: all 0.3s ease;
            cursor: pointer;
            border: none;
        }

        .btn-update {
            background: linear-gradient(135deg, #00b894, #00cec9);
            color: white;
            box-shadow: 0 4px 15px rgba(0, 184, 148, 0.2);
        }

        .btn-update:hover {
            background: linear-gradient(135deg, #00cec9, #00b894);
            box-shadow: 0 6px 20px rgba(0, 184, 148, 0.3);
        }

        .btn-cancel {
            background: linear-gradient(135deg, #ff7675, #d63031);
            color: white;
            box-shadow: 0 4px 15px rgba(255, 118, 117, 0.2);
        }

        .btn-cancel:hover {
            background: linear-gradient(135deg, #d63031, #ff7675);
            box-shadow: 0 6px 20px rgba(255, 118, 117, 0.3);
        }
    </style>
</head>
<body>

<%
    try {
        String id = request.getParameter("employeeId");
        EmployeeDaoImp employeeDaoImp = new EmployeeDaoImp();
        Employee e = employeeDaoImp.getEmployee(id);
%>

    <div class="container">
        <h2>Update Employee Details</h2>

        <form action="updateeEmployeeCall" method="post">
            <input type="hidden" name="employeeId" value="<%= e.getEmployeeId() %>">

            <div class="form-group">
                <label>Name:</label>
                <input type="text" name="name" value="<%= e.getName() %>" required>
            </div>

            <div class="form-group">
                <label>Father's Name:</label>
                <input type="text" name="fathersName" value="<%= e.getFathersName() %>" required>
            </div>

            <div class="form-group">
                <label>Date of Birth:</label>
                <input type="date" name="dob" value="<%= e.getDateOfBirth() %>" required>
            </div>

            <div class="form-group">
                <label>Salary:</label>
                <input type="number" name="salary" value="<%= e.getSalary() %>" required>
            </div>

            <div class="form-group">
                <label>Address:</label>
                <input type="text" name="address" value="<%= e.getAddress() %>" required>
            </div>

            <div class="form-group">
                <label>Phone Number:</label>
                <input type="text" name="phone" value="<%= e.getPhoneNumber() %>" required>
            </div>

            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" value="<%= e.getEmailId() %>" required>
            </div>

            <div class="form-group">
                <label>Highest Education:</label>
                <input type="text" name="highestEducation" value="<%= e.getHighestEducation() %>" required>
            </div>

            <div class="form-group">
                <label>Designation:</label>
                <input type="text" name="designation" value="<%= e.getDesignation() %>" required>
            </div>

            <div class="form-group">
                <label>Aadhar Number:</label>
                <input type="text" name="aadharNo" value="<%= e.getAadharNo() %>" required>
            </div>

            <div class="btn-container">
                <button type="submit" class="btn btn-update">Update</button>
                <a href="dashboard.jsp" class="btn btn-cancel">Cancel</a>
            </div>
        </form>
    </div>

<%
    } catch (Exception ex) {
        out.println("<h2 style='color:red; text-align:center;'>Invalid Employee ID</h2>");
    }
%>

</body>
</html>
