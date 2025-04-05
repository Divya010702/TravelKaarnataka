<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Packages</title>
<style>
    
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }

   
    body {
         height: 100vh;
    }

  
    form {
        background-color: #ffffff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 4px 10px #CE93D8;
        width: 100%;
        max-width: 400px;
        margin-left:550px;
        margin-bottom:20px;
        text-align: center;
        border: 2px solid #CE93D8;
    }

  
    h1 {
        font-size: 24px;
        color: #333333;
        margin-bottom: 20px;
    }

   
    label {
        display: block;
        font-size: 14px;
        color: #333333;
        margin-bottom: 5px;
        text-align: left;
    }

   
    input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #F3E5F5;
        border-radius: 5px;
        font-size: 14px;
        background-color: #F3E5F5;
    }

    input[type="text"]:focus {
        border-color: #ffcc33;
        outline: none;
        box-shadow: 0px 0px 8px rgba(255, 204, 51, 0.3);
    }

    
    button[type="submit"] {
        background-color: #CE93D8;
        color: #333333;
        font-size: 16px;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.2s;
    }

    button[type="submit"]:hover {
        background-color: #fbc02d;
        transform: scale(1.05);
    }
</style>
</head>
<body>
<%@include file="Header.jsp" %>
<form action="addPackage" method="post">
    <h1>Add Packages</h1>
    <label>Package Name:</label>
    <input type="text" name="name" placeholder="Enter Package name"><br><br>
    
    <label>Package Image:</label>
    <input type="text" name="image" placeholder="Enter Package image"><br><br>
    
    <label>Package Price:</label>
    <input type="text" name="price" placeholder="Enter Package Price"><br><br>
    
    <label>Duration:</label>
    <input type="text" name="duration" placeholder="Enter Duration"><br><br>
    
    <label>Destinations:</label>
    <input type="text" name="destination" placeholder="Enter Destinations "><br><br>
    
    <label>Activities:</label>
    <input type="text" name="activities" placeholder="Enter Activities"><br><br>
    
    <label>Accommodation:</label>
    <input type="text" name="accommodation" placeholder="Enter Accommodation"><br><br>
    
    <label>Inclusions:</label>
    <input type="text" name="inclusion" placeholder="Enter Inclusions "><br><br>
    
    <button type="submit" name="addPackage">Add Packages</button>
</form>
<%@include file="Footer.jsp" %>
</body>
</html>