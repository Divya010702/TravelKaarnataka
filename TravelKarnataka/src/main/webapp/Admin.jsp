
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Packages"%>
<%@page import="Model.Registration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>

.header {
            background-color: #E1BEE7; 
            color: black;
            padding: 30px;
            text-align: center;
             
        }

        .header h1 {
            font-family: 'Arial', sans-serif;
            font-size: 3rem;
            font-weight: bold;
            margin: 0;
        }
        .header img{
        width:100%;
        height:100%;}
        </style>

</head>
<body>
<%@include file="Header.jsp"  %>
<div class="header">
    <h1>Admin Dashboard</h1>
    <img alt="" src="Images/HomeBG.jpeg">
</div>

</body>
</html>