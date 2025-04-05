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


      
        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            background-color: #E1BEE7;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-container {
            padding: 20px;
            background-color: #E1BEE7;
            border-radius: 8px;
            box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.1);
        }

        .form-container h2 {
            color: black;
            font-size: 1.8rem;
            margin-bottom: 20px;
            text-align: center;
        }

        label {
            font-weight: bold;
            color: #555;
            display: block;
            margin-top: 15px;
            font-size: 1rem;
        }

        input[type="text"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #fff;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus {
            border-color: #ffeb3b;
            outline: none;
        }

        .btn {
            background-color: #CE93D8;
            color: #333;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1.1rem;
            font-weight: bold;
            margin-top: 20px;
            transition: background-color 0.3s ease, transform 0.2s ease;
            width: 100%;
            text-align: center;
        }

        .btn:hover {
            background-color: #fbc02d;
            transform: translateY(-2px);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 15px;
            }

            .header h1 {
                font-size: 2rem;
            }

            .btn {
                font-size: 1rem;
                padding: 10px;
            }
        }
</style>
</head>
<body>

<%@include file="Header.jsp"%>


     <%
    String packageIdParam = request.getParameter("p_id");
    Packages packageDetails = null;

    if (packageIdParam != null) {
        try {
            int packageId = Integer.parseInt(packageIdParam);
            Registration r = new Registration(session);
            packageDetails = r.getPackageById(packageId);
        } catch (NumberFormatException e) {
%>
            <p class="error-message">Invalid package ID format.</p>
<%
            return;
        }
    }

    if (packageDetails == null) {
%>
        <p class="error-message">Package not found.</p>
<%
        return;
    }
%>
    <div class="container">
 
            <div class="form-container">
                <h2>Update Package Information</h2>
                <form action="updatePackage" method="post">
            <input type="hidden" name="p_id" value="<%= packageDetails.getP_id() %>" />
            <label>Package Name:</label>
            <input type="text" name="p_name" value="<%= packageDetails.getP_name() %>" /><br>
            <label>Image:</label>
        <input type="text" name="p_image" value="<%= packageDetails.getP_image() %>" /><br>
        
        <label>Price:</label>
        <input type="text" name="p_price" value="<%= packageDetails.getP_price() %>" /><br>
        
        <label>Duration:</label>
        <input type="text" name="p_duration" value="<%= packageDetails.getP_duration() %>" /><br>
        
        <label>Destination:</label>
        <input type="text" name="p_destination" value="<%= packageDetails.getP_destination() %>" /><br>
        
        <label>Activities:</label>
        <input type="text" name="p_activities" value="<%= packageDetails.getP_activities() %>" /><br>
        
        <label>Accommodation:</label>
        <input type="text" name="p_accommodation" value="<%= packageDetails.getP_accommodation() %>" /><br>
        
        <label>Inclusions:</label>
        <input type="text" name="p_inclusion" value="<%= packageDetails.getP_inclusion() %>" /><br>
        
        <button type="submit" class="btn" >Save</button>
                </form>
            </div>
           
</div>


</body>
</html>