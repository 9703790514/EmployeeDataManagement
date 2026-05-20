<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f3f4f6;
        }
        .container {
            text-align: center;
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #10b981;
        }
        .btn {
            display: inline-block;
            margin-top: 1rem;
            padding: 10px 20px;
            background-color: #3b82f6;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            transition: 0.3s;
        }
        .btn:hover {
            background-color: #2563eb;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Registration Successful!</h2>
        <p>Your account has been created successfully.</p>
        <a href="login.jsp" class="btn">Go to Login</a>
    </div>

</body>
</html>
