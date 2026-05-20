<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deletion Successful</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #ff416c, #ff4b2b);
            color: #fff;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }

        .container {
            background: rgba(255, 255, 255, 0.1);
            padding: 2rem;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            max-width: 500px;
            width: 100%;
        }

        .success-icon {
            font-size: 4rem;
            color: #fff;
            margin-bottom: 1rem;
            animation: pop 0.5s ease-in-out;
        }

        @keyframes pop {
            0% { transform: scale(0); }
            80% { transform: scale(1.2); }
            100% { transform: scale(1); }
        }

        h2 {
            font-size: 2rem;
            margin-bottom: 0.5rem;
        }

        p {
            font-size: 1.2rem;
            opacity: 0.9;
            margin-bottom: 1.5rem;
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
            background: #fff;
            color: #ff4b2b;
            box-shadow: 0 4px 15px rgba(255, 255, 255, 0.2);
        }

        .btn:hover {
            background: #ffd5cc;
            box-shadow: 0 6px 20px rgba(255, 255, 255, 0.3);
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="success-icon">✔</div>
        <h2>Employee Deleted Successfully!</h2>
        <p>The employee record has been removed from the database.</p>
        <a href="dashboard.jsp" class="btn">Back to Dashboard</a>
    </div>

</body>
</html>
