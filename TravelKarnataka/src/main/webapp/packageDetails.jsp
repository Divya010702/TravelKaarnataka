<%@page import="Model.Packages"%>

<%@page import="Model.BookingDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>

<%@page import="Model.Registration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
        body {
    font-family: 'Arial', sans-serif;  
}
.container {
    max-width: 1200px;
    margin: auto;
    padding: 20px;
    background-color:#F3E5F5;
    border-radius:10px;
    
}
.package-image {
    width:550px;
    height:450px;
    border-radius: 10px;
}
.price {
    font-size: 1.6rem;
    color: #6A1B9A;
    font-weight: bold;
}
@media (max-width: 768px) {
    .package-card {
        flex-direction: column;
    }
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
<%@ include file="Header.jsp" %>
<div class="container">
<%
        String pid = request.getParameter("p_id");
        int packageId = Integer.parseInt(pid);
        Registration r = new Registration(session);
        ArrayList<Packages> al = r.getpackagedetails(packageId);
        Iterator<Packages> it = al.iterator();
        while (it.hasNext()) {
        	Packages s = it.next();
    %>
    <div class="package-card p-4">
                <div class="row">
                    <div class="col-md-6">
     <img  src="AddPackages/<%= s.getP_image() %>" alt="<%= s.getP_name() %>" class="package-image">
    
    </div>
     <div class="col-md-6 description">
                        <h2><b><%= s.getP_name() %></b></h2>
                        <p class="price">Rs. <%= s.getP_price() %></p>
                        
                        
                        <ul class="package-info-list mt-2">
                            <li><strong>Duration:</strong> <%= s.getP_duration() %></li>
                            <li><strong>Destination:</strong> <%= s.getP_destination() %></li>
                            <li><strong>Activities:</strong> <%= s.getP_activities() %></li>
                            <li><strong>Accommodation:</strong> <%= s.getP_accommodation() %></li>
                            <li><strong>Inclusion:</strong> <%= s.getP_inclusion() %></li>
                        </ul>
                        <form action="booking" method="post">
                            <input type="hidden" name="p_id" value="<%= s.getP_id() %>" />
                          <label>No of Person:</label>
                                    <select name="person" id="person-<%= s.getP_id() %>" class="person-select">
                                        <% for (int i = 1; i <= 30; i++) { %>
                                            <option value="<%=i%>"><%=i%></option>
                                        <% } %>
                                    No of person</select>
                                    <br>
                                    <br>

                            <% if (session.getAttribute("uname") != null) { %>
                                <button name="booking" class="booking">book</button>
                                
                            <% } else { %>
                                <p>Please log in to book the package</p>
                            <% } %>
                        </form>
                    </div>
    
    </div>
    </div>
    <%} %>
    </div>


</body>
</html>