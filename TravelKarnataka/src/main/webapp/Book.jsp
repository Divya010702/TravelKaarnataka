<%@page import="java.util.Iterator"%>
<%@page import="Model.BookingDB"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Registration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f9f9f9;
            font-family: 'Arial', sans-serif;
            color: #333;
        }

        .container {
            max-width: 900px;
            margin: 50px auto;
            padding: 30px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #ff4500;
            font-weight: bold;
        }

        .total-cost {
            font-size: 26px;
            font-weight: bold;
            text-align: right;
            margin-top: 20px;
            border-top: 2px solid #ff4500;
            padding-top: 10px;
        }

        .checkout-button {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<%@include file="Header.jsp" %>
<div class="container">
        <% if (session.getAttribute("uname") != null) { %>
            <h2>Travel Karnataka</h2>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Book Id</th>
                        <th>Image</th>
                        <th>Package Name</th>
                        <th>Price (&#8377;)</th>
                        <th>Person</th>
                        <th>Total (&#8377;)</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                   <% 
                        int tcost = 0;
                        Registration r = new Registration(session);
                        ArrayList<BookingDB> ar = r.getbookinfo();
                        Iterator<BookingDB> itr = ar.iterator();
                        while (itr.hasNext()) {
                        	BookingDB s = itr.next();
                            int itemTotalCost = Integer.parseInt(s.getb_price()) * Integer.parseInt(s.getPerson());
                            tcost += itemTotalCost;  
                    %>
                    <tr>
                        <td><%=s.getb_id() %>
                        <td><img src="AddPackages/<%=s.getb_image()%>" alt="<%=s.getb_name()%>" style="height: 80px; width: auto; border-radius: 10px;"></td>
                        <td><%=s.getb_name()%></td>
                        <td>&#8377;<%=s.getb_price()%></td>
                        <td><%=s.getPerson() %></td>
                        <td>&#8377;<%=itemTotalCost%></td>
                        <td>
                            <form action="booking" method="post" style="display:inline;">
                                <input type="hidden" name="bid" value="<%=s.getb_id()%>"/>
                                <button type="submit" name="delete" class="btn btn-danger"><i class="fas fa-trash"></i> Remove</button>
                            </form>
                        </td>
                    </tr>

                   <% } %>
                  
                </tbody>
            </table>
            <div class="total-cost">Total: &#8377;<%=tcost%></div>
            <div class="checkout-button">
                <a href="Processtobook.jsp" class="btn btn-primary">Proceed to Book</a>
                <a href="TripsPack.jsp?duration=OneWeek" class="btn btn-primary">Back</a>
            </div>
            <% } else { %>
            <h2>Please log in to book.</h2>
        <% } %>
        
    </div>


</body>
</html>