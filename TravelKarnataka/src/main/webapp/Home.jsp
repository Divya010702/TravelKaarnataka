<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Travel Karnataka</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;300&display=swap');

       
        .banner {
            width: 100%;
            height: 600px;
            background-image: url('Images/HomeBG.jpeg');
            background-position: center center;
            background-size: cover;
            background-repeat: no-repeat;
            position: relative;
            margin-top: 20px;
            
        }
        .banner h1,h3 {
            font-size:40px;
            font-family: 'Comic Sans MS', cursive, sans-serif;
            line-height: 1.5;
            color: #000000;
            margin-left:30px;
        }
           .places {
            text-align: center;
            padding: 20px 0;
            background-color:white;
            border-bottom: 2px solid #f9d04e;
        }
        .nav-buttons .btn {
        margin: 0px;
        background-color: #E0E0E0;
        color: #333;
        border-radius: 25px;
        padding: 10px 20px;
        text-decoration: none;
        transition: transform 0.3s, background-color 0.3s;
        margin-left:650px;
        
        }
        .nav-buttons .btn:hover {
        transform: scale(1.05);
        background-color: #E0E0E0;
        }     
        .nav-buttons nav {
            display: flex;
            gap: 10px;
        }
    </style>
</head>
<body>
<%@include file="Header.jsp" %>
<div class="banner">
<br><br>
        <h1>KARNATAKA</h1>
        <h3>One state,Many Worlds</h3>
    </div>
<div class="places" id="places">
    <div class="nav-buttons" >
       <nav><a class="btn" href="TripsPack.jsp?duration=OneWeek"> Destination</a>
       </nav>   
    </div>


</div>


<%@include file="places.html" %>
<%@include file="AboutUs.html" %>



<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl5/5hb8ay9h1F71z5YsHDa9yQch/a6K/2GgL5Spt5" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js" integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%@include file="Footer.jsp" %>

</body>
</html>
