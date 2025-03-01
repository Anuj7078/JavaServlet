<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Success</title>
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

        /* Success Container */
        .success-container {
            background: #fff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
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

        /* Success Message */
        .success-message {
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
            color: #6a11cb;
        }

        /* Logout Button */
        .logout-btn {
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

        .logout-btn:hover {
            background: #2575fc;
        }
    </style>
</head>
<body>
<div class="success-container">
    <h2 class="success-message">Swagat hai aapka Anuj ke project mein </h2>
    <form action="logout" method="post">
        <button type="submit" class="logout-btn">Logout</button>
    </form>
</div>
</body>
</html>