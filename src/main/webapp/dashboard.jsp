<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | Employee Management</title>
    <style>
        :root {
            --primary: #3b82f6;
            --primary-dark: #2563eb;
            --success: #10b981;
            --success-dark: #059669;
            --danger: #ef4444;
            --danger-dark: #dc2626;
            --warning: #f59e0b;
            --warning-dark: #d97706;
            --gray: #4b5563;
            --gray-dark: #374151;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        }

        body {
            background: 
                radial-gradient(circle at top left, rgba(59, 130, 246, 0.1), transparent 40%),
                radial-gradient(circle at bottom right, rgba(16, 185, 129, 0.1), transparent 40%),
                linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            min-height: 100vh;
            display: grid;
            place-items: center;
            padding: 2rem;
        }

        .container {
            background: rgba(255, 255, 255, 0.98);
            backdrop-filter: blur(20px);
            padding: 3rem;
            border-radius: 2rem;
            box-shadow: 
                0 20px 25px -5px rgba(0, 0, 0, 0.1),
                0 10px 10px -5px rgba(0, 0, 0, 0.04),
                0 0 0 1px rgba(255, 255, 255, 0.5) inset;
            width: 100%;
            max-width: 520px;
            position: relative;
            overflow: hidden;
        }

        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 3px;
            background: linear-gradient(
                to right,
                var(--primary),
                var(--success),
                var(--warning),
                var(--danger)
            );
        }

        .header {
            text-align: center;
            margin-bottom: 3rem;
            position: relative;
        }

        .header::after {
            content: '';
            position: absolute;
            bottom: -1.5rem;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 3px;
            background: var(--primary);
            border-radius: 3px;
        }

        h2 {
            color: #1e293b;
            font-size: 2.25rem;
            font-weight: 700;
            margin-bottom: 1rem;
            background: linear-gradient(135deg, #1e293b, #334155);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .subtitle {
            color: #64748b;
            font-size: 1.1rem;
            line-height: 1.6;
        }

        .btn-container {
            display: grid;
            gap: 1.25rem;
            margin-bottom: 2rem;
        }

        .btn {
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 1.25rem;
            border-radius: 1rem;
            color: white;
            font-weight: 600;
            font-size: 1.1rem;
            text-decoration: none;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            border: 1px solid rgba(255, 255, 255, 0.1);
            overflow: hidden;
            letter-spacing: 0.025em;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(
                45deg,
                rgba(255, 255, 255, 0),
                rgba(255, 255, 255, 0.2),
                rgba(255, 255, 255, 0)
            );
            transform: translateX(-100%) skewX(-15deg);
            transition: transform 0.7s ease;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .btn:hover::before {
            transform: translateX(100%) skewX(-15deg);
        }

        .btn span {
            position: relative;
            z-index: 1;
        }

        .add { 
            background: linear-gradient(135deg, var(--success), var(--success-dark));
        }
        .delete { 
            background: linear-gradient(135deg, var(--danger), var(--danger-dark));
        }
        .update { 
            background: linear-gradient(135deg, var(--warning), var(--warning-dark));
        }
        .view { 
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
        }

        .logout {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            padding: 1rem;
            background: linear-gradient(135deg, var(--gray), var(--gray-dark));
            color: white;
            text-decoration: none;
            border-radius: 1rem;
            font-weight: 500;
            font-size: 1.05rem;
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .logout:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        @media (max-width: 520px) {
            body {
                padding: 1rem;
            }

            .container {
                padding: 2rem;
            }

            h2 {
                font-size: 1.75rem;
            }

            .btn {
                padding: 1rem;
                font-size: 1rem;
            }
        }

        /* Enhanced animations */
        @keyframes fadeInUp {
            from { 
                opacity: 0; 
                transform: translateY(20px);
            }
            to { 
                opacity: 1; 
                transform: translateY(0);
            }
        }

        .container {
            animation: fadeInUp 0.8s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .btn {
            animation: fadeInUp 0.8s cubic-bezier(0.4, 0, 0.2, 1);
            animation-fill-mode: both;
        }

        .btn:nth-child(1) { animation-delay: 0.1s; }
        .btn:nth-child(2) { animation-delay: 0.2s; }
        .btn:nth-child(3) { animation-delay: 0.3s; }
        .btn:nth-child(4) { animation-delay: 0.4s; }

        .logout {
            animation: fadeInUp 0.8s cubic-bezier(0.4, 0, 0.2, 1);
            animation-delay: 0.5s;
            animation-fill-mode: both;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
        
        <% HttpSession sessio = request.getSession();
        String userName = (String)sessio.getAttribute("userName");
        %>
           <h2>Welcome, <%= userName %></h2>
            <p class="subtitle">Streamline your employee management with our intuitive dashboard</p>
        </div>

        <div class="btn-container">
            <a href="addEmployee.jsp" class="btn add">
                <span>Add Employee</span>
            </a>
            <a href="Call1" class="btn delete">
                <span>Delete Employee</span>
            </a>
            <a href="Call2" class="btn update">
                <span>Update Employee</span>
            </a>
            <a href="Call" class="btn view">
                <span>View Employees</span>
            </a>
        </div>

        <a href="welcomepage.jsp" class="logout">Sign Out</a>
    </div>
</body>
</html>