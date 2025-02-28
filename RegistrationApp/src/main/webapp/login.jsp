<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        /* Reuse the same styles from register.jsp */
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

        .form-container {
            background: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            animation: fadeIn 1s ease-in-out;
        }

        /* Add error message styling */
        .error-message {
            color: #ff4444;
            text-align: center;
            margin-bottom: 1rem;
        }

        /* Rest of the styles same as register.jsp */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .input-group, .submit-btn {
            animation: slideIn 0.5s ease-in-out;
        }

        .form-title {
            text-align: center;
            font-size: 2rem;
            margin-bottom: 1.5rem;
            color: #6a11cb;
        }

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

        .register-link {
            text-align: center;
            margin-top: 1rem;
        }

        .register-link a {
            color: #6a11cb;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .register-link a:hover {
            color: #2575fc;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2 class="form-title">Login</h2>
    <%-- Error Message --%>
    <% if(request.getParameter("error") != null) { %>
    <div class="error-message">Invalid username or password!</div>
    <% } %>

    <form action="login" method="post">
        <div class="input-group">
            <input type="text" id="username" name="username" placeholder=" " required>
            <label for="username">Username</label>
        </div>
        <div class="input-group">
            <input type="password" id="password" name="password" placeholder=" " required>
            <label for="password">Password</label>
        </div>
        <button type="submit" class="submit-btn">Login</button>
    </form>
    <div class="register-link">
        <p>Don't have an account? <a href="register.jsp">Register here</a></p>
    </div>
</div>
</body>
</html>