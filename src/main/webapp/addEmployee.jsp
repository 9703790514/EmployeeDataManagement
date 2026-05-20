<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Add Employee | Employee Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }

        body {
            min-height: 100vh;
            background: linear-gradient(135deg, #1e293b, #0f172a);
            color: #f8fafc;
            padding: 2rem 1rem;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
        }

        .form-card {
            background: rgba(255, 255, 255, 0.03);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 1rem;
            padding: 2rem;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
        }

        .form-header {
            text-align: center;
            margin-bottom: 2.5rem;
        }

        .form-header h1 {
            font-size: 2rem;
            font-weight: 700;
            color: #fff;
            margin-bottom: 0.5rem;
        }

        .form-header p {
            color: #94a3b8;
            font-size: 1rem;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        label {
            font-size: 0.875rem;
            font-weight: 500;
            color: #e2e8f0;
            margin-bottom: 0.5rem;
        }

        input {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 0.5rem;
            padding: 0.75rem 1rem;
            color: #fff;
            font-size: 0.875rem;
            transition: all 0.2s ease;
            width: 100%; /* Ensure input takes full width of its container */
            box-sizing: border-box;
        }

        input:focus {
            outline: none;
            border-color: #3b82f6;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.2);
            background: rgba(255, 255, 255, 0.08);
        }

        input::placeholder {
            color: rgba(255, 255, 255, 0.3);
        }

        input[type="date"] {
            color-scheme: dark;
        }

        .button-group {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
            justify-content: space-between; /* Align buttons properly */
        }

        .btn {
            flex: 1;
            padding: 0.875rem 1.5rem;
            border: none;
            border-radius: 0.5rem;
            font-size: 0.875rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s ease;
            text-align: center;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .btn-primary {
            background: linear-gradient(to right, #3b82f6, #2563eb);
            color: white;
            box-shadow: 0 4px 6px -1px rgba(59, 130, 246, 0.2);
        }

        .btn-primary:hover {
            background: linear-gradient(to right, #2563eb, #1d4ed8);
            transform: translateY(-1px);
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.05);
            color: #fff;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .btn-secondary:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: translateY(-1px);
        }

        @media (max-width: 640px) {
            .form-grid {
                grid-template-columns: 1fr;
                gap: 1rem;
            }

            .button-group {
                flex-direction: column;
            }

            .form-card {
                padding: 1.5rem;
            }

            body {
                padding: 1rem;
            }
        }
    </style>
    
    <script>
    
   
    document.getElementById("phone").addEventListener("input", function () {
        this.value = this.value.replace(/\D/g, '').slice(0, 10); 
    });
 

document.getElementById("email").addEventListener("input", function () {
    const pattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (!pattern.test(this.value)) {
        this.setCustomValidity("Enter a valid email address");
    } else {
        this.setCustomValidity("");
    }
});

</script>
    
</head>
<body>
    <div class="container">
        <div class="form-card">
            <div class="form-header">
                <h1>Add Employee</h1>
                <p>Enter employee details to add to the system</p>
            </div>

            <form action="CallServlet" method="post">
                <div class="form-grid">
                    <div class="form-group">
                        <label for="fullName">Full Name</label>
                        <input type="text" id="fullName" name="fullName" placeholder="Enter full name" required>
                    </div>

                    <div class="form-group">
                        <label for="fathersName">Father's Name</label>
                        <input type="text" id="fathersName" name="fathersName" placeholder="Enter father's name" required>
                    </div>

                    <div class="form-group">
                        <label for="dob">Date of Birth</label>
                        <input type="date" id="dob" name="dob" required>
                    </div>

                    <div class="form-group">
                        <label for="salary">Salary</label>
                        <input type="number" id="salary" name="salary" placeholder="Enter salary amount" required>
                    </div>

                    <div class="form-group">
                        <label for="phone">Phone Number</label>
                        <input type="tel" id="phone" name="phone" pattern="[6-9]\d{9}" maxlength="10"placeholder="Enter phone number" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Email ID</label>
                        <input type="email" id="email" name="email" pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}" placeholder="Enter email address" required>
                    </div>

                    <div class="form-group">
                        <label for="designation">Designation</label>
                        <input type="text" id="designation" name="designation" placeholder="Enter designation" required>
                    </div>

                    <div class="form-group">
                        <label for="highestEducation">Highest Education</label>
                        <input type="text" id="highestEducation" name="highestEducation" placeholder="Enter highest education" required>
                    </div>

                    <div class="form-group">
                        <label for="aadharNo">Aadhar Number</label>
                        <input type="text" id="aadharNo" name="aadharNo" placeholder="Enter Aadhar number" required>
                    </div>

                    <div class="form-group full-width">
                        <label for="address">Address</label>
                        <input type="text" id="address" name="address" placeholder="Enter full address" required>
                    </div>
                </div>

                <div class="button-group">
                    <button type="submit" class="btn btn-primary">Add Employee</button>
                    <a href="dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
