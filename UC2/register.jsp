<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #333;
        }

        /* Form Container */
        .form-container {
            background: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Form Title */
        .form-title {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 1.5rem;
            color: #6a11cb;
        }

        /* Input Fields */
        .input-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            border: 2px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            outline: none;
            transition: border-color 0.3s ease;
        }

        .input-group input:focus {
            border-color: #6a11cb;
        }

        .input-group label {
            position: absolute;
            top: 50%;
            left: 10px;
            transform: translateY(-50%);
            background: #fff;
            padding: 0 5px;
            font-size: 1rem;
            color: #888;
            transition: all 0.3s ease;
            pointer-events: none;
        }

        .input-group input:focus + label,
        .input-group input:not(:placeholder-shown) + label {
            top: 0;
            font-size: 0.8rem;
            color: #6a11cb;
        }

        /* Submit Button */
        .submit-btn {
            width: 100%;
            padding: 10px;
            background: #6a11cb;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .submit-btn:hover {
            background: #2575fc;
        }

        /* Login Link */
        .login-link {
            text-align: center;
            margin-top: 1rem;
        }

        .login-link a {
            color: #6a11cb;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .login-link a:hover {
            color: #2575fc;
        }

        /* Error Message */
        .error-message {
            color: #ff4444;
            text-align: center;
            margin-bottom: 1rem;
            animation: fadeIn 0.5s ease-in-out;
        }

        /* Animations */
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateX(-20px);
            }
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .input-group {
            animation: slideIn 0.5s ease-in-out;
        }

        .input-group:nth-child(2) {
            animation-delay: 0.2s;
        }

        .input-group:nth-child(3) {
            animation-delay: 0.4s;
        }

        .submit-btn {
            animation: slideIn 0.6s ease-in-out;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2 class="form-title">Register</h2>
    <% if(request.getParameter("error") != null) { %>
    <div class="error-message"><%= request.getParameter("error") %></div>
    <% } %>
    <form action="register" method="post">
        <div class="input-group">
            <input type="text" id="name" name="name" placeholder=" " required>
            <label for="name">Name</label>
        </div>
        <div class="input-group">
            <input type="text" id="username" name="username" placeholder=" " required>
            <label for="username">Username</label>
        </div>
        <div class="input-group">
            <input type="email" id="email" name="email" placeholder=" " required>
            <label for="email">Email</label>
        </div>
        <div class="input-group">
            <input type="password" id="password" name="password" placeholder=" " required>
            <label for="password">Password</label>
        </div>
        <button type="submit" class="submit-btn">Register</button>
    </form>
    <div class="login-link">
        <p>Already have an account? <a href="login.jsp">Login here</a></p>
    </div>
</div>
</body>
</html>