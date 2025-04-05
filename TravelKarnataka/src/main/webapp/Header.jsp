<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Travel ಕರ್ನಾಟಕ</title>
    <!-- Include a font that supports Kannada -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+Kannada&display=swap" rel="stylesheet">
    <style>
    * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
        body {
            margin: 0;
            font-family: 'Noto Sans Kannada', Arial, sans-serif;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #FFFFFF;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .logo {
            display: flex;
            align-items: center;
        }

        .logo img {
            height: 70px;
            width:70px;
            margin-right: 10px;
        }

        .logo span {
            font-size: 20px;
            font-weight: bold;
            
        }

        nav {
            display: flex;
            gap: 20px;
        }

        nav a {
            text-decoration: none;
            color: #333;
            font-size: 16px;
            transition: color 0.3s;
            font-size: 20px;
            margin-top:20px;
            font-weight: bold;
        }

        nav a:hover {
            color: #007bff;
        }
    </style>
</head>
<body>
    <header>
        <div class="logo">
        <a href="Home.jsp">
            <img src="Images/logo.jpg" alt="Logo">
            </a>
            <span>Travel ಕರ್ನಾಟಕ</span>
    </div>
        <div class="menu">
        <nav>
            <% if (session.getAttribute("uname") != null) { %>
                
                <a href="Home.jsp">Home</a>
                
                <a href="Contact.jsp">Contact Us</a>

                <!-- Admin-specific Menu Items (id = 1) -->
                <% if ("1".equals(session.getAttribute("id"))) { %>
                    
                    <a href="Packages.jsp">Manage trip packages</a>
                    <a href="BookedPackages.jsp">Booking</a>
                    <a href="Review.jsp">Review</a>
                <% } else { %>
                 
                    <a href="TripsPack.jsp?duration=OneWeek">Trips/Packages</a>
                    <a href="myBook.jsp">Status</a>
                    <a href="Feedback.jsp">Feedback</a>
                <% } %>

                <a href="register?logout=yes">Logout</a>
            <% } else { %>
                
                <a href="Home.jsp">Home</a>
                
                <a href="Login.jsp">Login</a>
                <a href="Registration.jsp">Register</a>
            <% } %>
        </nav>
    </div>
    </header>
</body>
</html>
