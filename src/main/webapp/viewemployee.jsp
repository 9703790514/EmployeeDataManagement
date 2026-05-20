<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.tap.Model.Employee" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Employees | Employee Management</title>
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
            padding: 2rem;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
        }

        header {
            text-align: center;
            margin-bottom: 2rem;
            padding: 2rem;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }

        h2 {
            font-size: 2.5rem;
            font-weight: 700;
            color: #fff;
            margin-bottom: 1rem;
            letter-spacing: 1px;
        }

        .subtitle {
            color: #a0aec0;
            font-size: 1.1rem;
        }

        .table-container {
            background: rgba(255, 255, 255, 0.03);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.15);
            backdrop-filter: blur(4px);
            border: 1px solid rgba(255, 255, 255, 0.08);
            overflow: auto;
            margin-bottom: 2rem;
        }

        .user-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            color: #e0e0e0;
        }

        .user-table th {
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
            font-weight: 600;
            font-size: 0.95rem;
            padding: 1.2rem 1rem;
            text-align: left;
            text-transform: uppercase;
            letter-spacing: 1px;
            border-bottom: 2px solid rgba(255, 255, 255, 0.1);
        }

        .user-table td {
            padding: 1rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
            font-size: 0.95rem;
        }

        .user-table tbody tr {
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .user-table tbody tr:hover {
            background: rgba(255, 255, 255, 0.05);
            transform: translateY(-2px);
        }

        .user-table tbody tr:last-child td {
            border-bottom: none;
        }

        .empty-message {
            text-align: center;
            padding: 2rem;
            color: #a0aec0;
            font-style: italic;
        }

        .btn-back {
            display: inline-block;
            padding: 1rem 2rem;
            background: linear-gradient(135deg, #00b4db, #0083b0);
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0, 180, 219, 0.2);
        }

        .btn-back:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(0, 180, 219, 0.3);
            background: linear-gradient(135deg, #00c6ed, #0095c8);
        }

        .btn-container {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h2>Employee Directory</h2>
            <p class="subtitle">Comprehensive view of all employee information</p>
        </header>

       <div class="table-container">
            <table class="user-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Father Name</th>
                        <th>Date of Birth</th>
                        <th>Salary</th>
                        <th>Address</th>
                        <th>Phone Number</th>
                        <th>Email</th>
                        <th>Highest Education</th>
                        <th>Designation</th>
                        <th>Aadhar Number</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Employee> list = (List<Employee>) request.getAttribute("list");
                        if (list != null && !list.isEmpty()) {
                            for (Employee e : list) {
                    %>
                    <tr>
                        <td><%= e.getEmployeeId() %></td>
                        <td><%= e.getName() %></td>
                        <td><%= e.getFathersName() %></td>
                        <td><%= e.getDateOfBirth() %></td>
                        <td><%= e.getSalary() %></td>
                        <td><%= e.getAddress() %></td>
                        <td><%= e.getPhoneNumber() %></td>
                        <td><%= e.getEmailId() %></td>
                        <td><%= e.getHighestEducation() %></td>
                        <td><%= e.getDesignation() %></td>
                        <td><%= e.getAadharNo() %></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="11" class="empty-message">No employees found in the database.</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <div class="btn-container">
            <a href="dashboard.jsp" class="btn-back">Return to Dashboard</a>
        </div>
    </div>        
</body>
</html>
