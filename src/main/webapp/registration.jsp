<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Register | Employee Management</title>
    <style>
    * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
}

body {
    min-height: 100vh;
    background: linear-gradient(135deg, #1e3c72, #2a5298);
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 1rem;
}

.container {
    width: 100%;
    max-width: 28rem;
}

.form-card {
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(10px);
    padding: 2rem;
    border-radius: 1rem;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
}

.header {
    text-align: center;
    margin-bottom: 2rem;
}

.header h2 {
    color: white;
    font-size: 1.875rem;
    font-weight: bold;
    margin-bottom: 0.5rem;
}

.header p {
    color: #bfdbfe;
    font-size: 0.875rem;
}

.register-form {
    display: flex;
    flex-direction: column;
    gap: 1rem;
}

.input-group {
    position: relative;
}

.icon {
    position: absolute;
    left: 0.75rem;
    top: 50%;
    transform: translateY(-50%);
    color: #bfdbfe;
    pointer-events: none;
}

input {
    width: 100%;
    padding: 0.75rem 1rem 0.75rem 2.5rem;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(191, 219, 254, 0.2);
    border-radius: 0.5rem;
    color: white;
    font-size: 0.875rem;
    transition: all 0.2s;
}

input::placeholder {
    color: #bfdbfe;
}

input:focus {
    outline: none;
    border-color: transparent;
    box-shadow: 0 0 0 2px rgba(96, 165, 250, 0.5);
}

.submit-btn {
    margin-top: 0.5rem;
    padding: 0.75rem;
    background: linear-gradient(to right, #4ade80, #22c55e);
    border: none;
    border-radius: 0.5rem;
    color: white;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.2s;
}

.submit-btn:hover {
    background: linear-gradient(to right, #22c55e, #16a34a);
}

.submit-btn:focus {
    outline: none;
    box-shadow: 0 0 0 2px rgba(74, 222, 128, 0.5), 0 0 0 4px rgba(0, 0, 0, 0.1);
}

.login-link {
    margin-top: 1.5rem;
    text-align: center;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
}

.login-link svg {
    color: #bfdbfe;
}

.login-link a {
    color: #bfdbfe;
    text-decoration: none;
    font-size: 0.875rem;
    transition: color 0.2s;
}

.login-link a:hover {
    color: white;
}

@media (max-width: 640px) {
    .form-card {
        padding: 1.5rem;
    }

    .header h2 {
        font-size: 1.5rem;
    }
}
    </style>
</head>
<body>
    <div class="container">
        <div class="form-card">
            <div class="header">
                <h2>Register Account</h2>
                <p>Join our employee management system</p>
            </div>

            <form action="signupcall" method="POST" class="register-form">
                <div class="input-group">
                    <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><line x1="19" y1="8" x2="19" y2="14"/><line x1="22" y1="11" x2="16" y2="11"/></svg>
                    <input type="text" name="username" placeholder="Username" required>
                </div>

                <div class="input-group">
                    <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="20" height="16" x="2" y="4" rx="2"/><path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7"/></svg>
                    <input type="email" name="email" placeholder="Email address" required>
                </div>

                <div class="input-group">
                    <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"/></svg>
                    <input type="tel" name="phone" placeholder="Phone number" required>
                </div>

                <div class="input-group">
                    <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="18" height="11" x="3" y="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
                    <input type="password" name="password" placeholder="Password" required>
                </div>

                <div class="input-group">
                    <svg class="icon" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><rect width="18" height="11" x="3" y="11" rx="2" ry="2"/><path d="M7 11V7a5 5 0 0 1 10 0v4"/></svg>
                    <input type="password" name="confirmPassword" placeholder="Confirm password" required>
                </div>

                <button type="submit" class="submit-btn">Register</button>
            </form>

            <div class="login-link">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M15 3h4a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4"/><polyline points="10 17 15 12 10 7"/><line x1="15" x2="3" y1="12" y2="12"/></svg>
                <a href="login.jsp">Already have an account? Login here</a>
            </div>
        </div>
    </div>
</body>
</html>