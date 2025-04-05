<%@page import="java.util.ArrayList"%>
<%@page import="Model.Packages"%>
<%@page import="Model.Registration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
            font-family: 'Roboto', sans-serif;
            background-color: white;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .header {
            text-align: center;
            padding: 40px 0;
            background-color:#E1BEE7;
            border-bottom: 2px solid #E1BEE7;
        }

        .header h1 {
            margin-bottom: 20px;
            font-weight: 500;
            color: #333;
        }
        .nav-buttons .btn {
    margin: 0 10px;
    background-color: #CE93D8;
    color: #333;
    border-radius: 25px;
    padding: 10px 20px;
    text-decoration: none;
    transition: transform 0.3s, background-color 0.3s;
}

.nav-buttons .btn:hover {
    transform: scale(1.05);
    background-color: white;
}
.package-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .package-card {
            background-color: #ffffff;
            border: 2px solid #f9d04e;
            border-radius: 20px;
            margin: 20px;
            padding: 25px;
            width: 350px;
            transition: transform 0.3s, box-shadow 0.3s;
            display: flex;
            flex-direction: column;
            align-items: center;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
        }

        .package-image img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 15px;
        }

        .title {
            text-align: center;
            margin: 15px 0;
            font-weight: 600;
            color: #444;
            font-size: 1.5em;
        }

        .price {
            color: black;
            text-align: center;
            font-size: 1.5em;
            font-weight: 700;
            margin: 10px 0;
        }
        h4{
        margin-top:100px;
        }
        .booking {
            flex: 1;
            margin-right: 5px;
            background-color: #CE93D8;
            color: #333;
            border: none;
            border-radius: 25px;
            padding: 10px 15px;
            font-size: 1.2em;
            transition: background-color 0.3s, transform 0.3s;
        }

        .booking:hover {
            background-color: white;
            transform: scale(1.05);
        }

        .person-select {
            margin-left: 5px;
            padding: 8px;
            border: 2px solid #CE93D8;
            border-radius: 5px;
            font-size: 1em;
            background-color: #fff;
        }
        

        </style>
</head>
<body>
<%@include file="Header.jsp" %>
<div class="header">
    <h1>Welcome to Travel Karnataka</h1>
    <div class="nav-buttons">
        <b><a href="TripsPack.jsp?duration=OneWeek" class="btn">One Week</a>
        <a href="TripsPack.jsp?duration=TwoWeeks" class="btn">Two Weeks</a>
        <a href="TripsPack.jsp?duration=ThreeWeek" class="btn">Three Weeks</a></b>
        
    </div>
    <div class="container">
   
    <div class="package-container">
   
        <%
            Registration r = new Registration(session);
            ArrayList<Packages> al = r.get_packagesinfo(request.getParameter("duration"));
            if (al != null && !al.isEmpty()) {
                for (Packages s : al) {
        %>
                    <div class="package-card">
                        <div class="package-image">
                            <a href="packageDetails.jsp?p_id=<%= s.getP_id() %>">
                                <img src="AddPackages/<%= s.getP_image() %>" alt="<%= s.getP_name() %>">
                            </a>
                        </div>
                        <h2 class="title"><%= s.getP_name() %></h2>
                        <p class="price">&#8377; <%= s.getP_price() %></p>
                        <h3><%= s.getP_destination() %></h3>
                        
                         <form action="booking" method="post" style="width: 100%;">
                            <input type="hidden" name="p_id" value="<%= s.getP_id() %>" />
                            
                            <% if(session.getAttribute("uname") != null) { %>
                                <div class="button-container">
                                    <button name="booking" class="booking">Book</button>
                                    <label>No of Person:</label>
                                    <select name="person" id="person-<%= s.getP_id() %>" class="person-select">
                                        <% for (int i = 1; i <= 30; i++) { %>
                                            <option value="<%=i%>"><%=i%></option>
                                        <% } %>
                                    No of person</select>
                                </div>
                            <% } else { %>
                            <p style="text-align: center;">Please log in to book the package.</p>
                            <% } %>
                        </form>
                        
                    </div>
        <%
                }
            } else {
        %>
                <h4>No Packages</h4>
        <%
            }
        %>
    </div>
</div>

</body>
</html>