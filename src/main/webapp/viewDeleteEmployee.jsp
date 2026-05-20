<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tap.Model.Employee" %>
<%@ page import="com.tap.DaoImp.EmployeeDaoImp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Details</title>
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

        .details {
            text-align: left;
            font-size: 1.1rem;
            color: #e0e0e0;
            line-height: 1.8;
            padding: 1rem;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(255, 255, 255, 0.1);
            margin-bottom: 2rem;
        }

        .details p {
            margin: 0.5rem 0;
        }

        .details span {
            font-weight: bold;
            color: #00b4db;
        }

        .btn-container {
            display: flex;
            justify-content: space-between;
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

        .btn-delete {
            background: linear-gradient(135deg, #ff416c, #ff4b2b);
            color: white;
            box-shadow: 0 4px 15px rgba(255, 65, 108, 0.2);
        }

        .btn-delete:hover {
            background: linear-gradient(135deg, #ff4b2b, #ff416c);
            box-shadow: 0 6px 20px rgba(255, 65, 108, 0.3);
        }

        .btn-back {
            background: linear-gradient(135deg, #00b4db, #0083b0);
            color: white;
            box-shadow: 0 4px 15px rgba(0, 180, 219, 0.2);
        }

        .btn-back:hover {
            background: linear-gradient(135deg, #00c6ed, #0095c8);
            box-shadow: 0 6px 20px rgba(0, 180, 219, 0.3);
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
        <h2>Employee Details</h2>

        <div class="details">
            <p><span>ID:</span> <%= e.getEmployeeId() %></p>
            <p><span>Name:</span> <%= e.getName() %></p>
            <p><span>Father's Name:</span> <%= e.getFathersName() %></p>
            <p><span>Date of Birth:</span> <%= e.getDateOfBirth() %></p>
            <p><span>Salary:</span> <%= e.getSalary() %></p>
            <p><span>Address:</span> <%= e.getAddress() %></p>
            <p><span>Phone Number:</span> <%= e.getPhoneNumber() %></p>
            <p><span>Email:</span> <%= e.getEmailId() %></p>
            <p><span>Highest Education:</span> <%= e.getHighestEducation() %></p>
            <p><span>Designation:</span> <%= e.getDesignation() %></p>
            <p><span>Aadhar Number:</span> <%= e.getAadharNo() %></p>
        </div>

        <div class="btn-container">
            <form action="deleteEmployeeCall" method="post">
                <input type="hidden" name="employeeId" value="<%= e.getEmployeeId() %>">
                <button type="submit" class="btn btn-delete">Delete</button>
            </form>
            <a href="dashboard.jsp" class="btn btn-back">Back</a>
        </div>
    </div>

<%
    } catch (Exception ex) {
        out.println("<h2 style='color:red; text-align:center;'>Invalid Employee ID</h2>");
    }
%>

</body>
</html>
