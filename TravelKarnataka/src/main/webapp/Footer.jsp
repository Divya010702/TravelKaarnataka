<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>



<style>
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
    }

    footer {
        background-color: #424242;
        color: white;
        padding: 45px 0;
        display: flex;
        flex-wrap: wrap;
        justify-content: space-around;
        height: 450px;
    }

    .footer-column {
        margin: 20px;
        width: 200px;
    }

    .footer-column h3 {
        font-size: 20px;
        margin-bottom: 20px;
        color: white;
        position: relative;
    }

    .footer-column h3::after {
        content: '';
        display: block;
        width: 50px;
        height: 3px;
        background-color: white;
        margin-top: 5px;
    }

    .footer-column ul {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .footer-column ul li {
        margin-bottom: 10px;
    }

    .footer-column ul li a {
        color: white;
        font-size: 16px;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .footer-column ul li a:hover {
        color: black;
    }

    .footer-column p {
        font-size: 14px;
        line-height: 1.8;
        text-align: justify;
    }


    .button button {
        padding: 12px 15px;
        background-color: #CE93D8;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
        transition: background-color 0.3s ease;
    }

    .button button:hover {
        background-color: #e2b20e;
    }

    .button {
        margin-top: 30px;
    }

    .footer-bottom {
        background-color: #141414;
        padding: 20px;
        text-align: center;
        color: #aaa;
        font-size: 14px;
        border-top: 1px solid #444;
    }

    .footer-bottom a {
        color: #f4d03f;
        text-decoration: none;
    }

    .footer-bottom a:hover {
        text-decoration: underline;
    }

    .footer-column img {
        width: 195px;
        margin-top: 5px;
    }
    i{
        font-size: 20px;
        color: white;
    }

    img:hover,i:hover{
        scale: 1.3;
        color: #f4d03f;
    }

</style>

<body>

    <footer>
        <div class="footer-column">
            <img src="Images/logo.jpg" alt="Logo">
            <p>"Travel Karnataka is your trusted companion for discovering the diverse culture, scenic beauty, and heritage of Karnataka."</p>
        </div>

        <div class="footer-column">
            <h3>Customer Service</h3>
            <ul>
                <li><a href="#">Help Center</a></li>
                <li><a href="#">FAQs</a></li>
            </ul>
        </div>

        <div class="footer-column">
            <h3>Get in Touch</h3>
            <p><i class="fa-solid fa-envelope"></i> <a href="mailto:support@travelkarnataka.com">support@travelkarnataka.com</a></p>
            <h3>Follow Us</h3>
            <div class="social-icons">
                <a href="#"><i class="fa-brands fa-twitter"></i></a>
                <a href="#"><i class="fa-brands fa-instagram"></i></a>
                <a href="#"><i class="fa-brands fa-facebook"></i></a>
                <a href="#"><i class="fa-brands fa-youtube"></i></a>
            </div>
            <div class="button">
                <a href="Registration.jsp"><button type="submit">Signup</button></a>
            </div>
        </div>
        </div>

    </footer>

    <section class="footer-bottom">
        <p>&copy; 2025 Travel Karnataka Pvt Ltd. All rights reserved. | <a href="">Privacy Policy</a> | <a href="#">Terms &
            Conditions</a></p>
    </section>


</body>
</html>