<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.21.0/jquery.validate.min.js"></script>
    <style>
        body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        background-position:fixed;
        background-repeat:no-repeat;
        background-size:cover;
       
        }
         .container {
        width: 450px;
        padding: 15px;
        margin: 40px auto;
        margin-left:530px;
        background-color: rgba(255, 255, 255, 0.9);
        box-shadow: 0px 15px 30px #4A4B50;
        border-radius: 15px;
        text-align: center;
        backdrop-filter: blur(5px);
    }

    h2 {
        color: black;;
        font-size: 28px;
        margin-bottom: 20px;
        font-family: 'Comic Sans MS', cursive, sans-serif;
        text-transform: uppercase;
    }
    table {
        width: 100%;
        margin-top: 20px;
    }

    td {
        text-align: left;
        font-size: 16px;
        color: black;
        padding: 8px;
    }
   input[type="text"],
    input[type="tel"],
    input[type="email"],
    input[type="password"] {
        width: 100%;
        padding: 12px;
        margin-top: 3px;
        margin-bottom: 10px;
        border: 2px solid black;
        border-radius: 10px;
        font-size: 16px;
        box-sizing: border-box;
        transition: all 0.3s ease;
    }

    input[type="text"]:focus,
    input[type="tel"]:focus,
    input[type="email"]:focus,
    input[type="password"]:focus {
        outline: none;
        border-color: black;
        box-shadow: 0 0 8px rgba(255, 152, 0, 0.5);
    }

    input[type="submit"] {
        width: 100%;
        padding: 14px;
        background-color: #AB47BC;
        color: #fff;
        border: none;
        border-radius: 10px;
        font-size: 18px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #f57c00;
    }
    input[type="submit"] {
            font-size: 16px;
        }
        </style>
    
</head>
<body>
<%@include file="Header.jsp"%> 
<script>
    jQuery.validator.addMethod("checkemail", function(value, element) {
        return /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(value) || /^[0-9]{10}$/.test(value); 
    });
   
    $(document).ready(function () {
    	$(".container").hide();
    	$(".container").slideDown(1500);
        $("#signup").validate({
            rules: {
                name: {
                    required: true
                },
                phone: {
                    required: true,
                    minlength: 10,
                    maxlength: 10,
                    digits: true
                },
                email: {
                    required: true,
                    checkemail: true
                },
                password: {
                    required: true,
                    minlength: 4
                },
                confirm: {
                    required: true,
                    minlength: 4,
                    equalTo: "#password"
                }
            },
            messages: {
                name: {
                    required: "Please enter your name"
                },
                phone: {
                    required: "Please enter your phone number",
                    minlength: "Your phone number must be exactly 10 digits",
                    maxlength: "Your phone number must be exactly 10 digits",
                    digits: "Please enter a valid phone number"
                },
                email: {
                    required: "Please enter your email"
                },
                password: {
                    required: "Please enter your password",
                    minlength: "Your password must be at least 4 characters long"
                },
                confirm: {
                    required: "Please confirm your password",
                    minlength: "Your password must be at least 4 characters long",
                    equalTo: "Passwords do not match"
                }
            },
            submitHandler: function(form) {
                form.submit();
            }
        });
    });
</script>
    <div class="container" id="container">
        <h2>Registration Form</h2>
    
        <form method="post" action="register" id="signup">
            <table>
                <tr>
                    <td>NAME</td>
                    <td><input type="text" id="name" name="name"></td>
                </tr>
                <tr>
                    <td>PHONE NUMBER</td>
                    <td><input type="tel" name="phone"></td>
                </tr>
                <tr>
                    <td>EMAIL</td>
                    <td><input type="email" name="email"></td>
                </tr>
                <tr>
                    <td>PASSWORD</td>
                    <td><input type="password" name="password" id="password"></td>
                </tr>
                <tr>
                    <td>CONFIRM PASSWORD</td>
                    <td><input type="password" name="confirm"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" name="register" value="Register">
                    </td>
                </tr>
            </table>
            <div class="login" id="container">
                <a href="Login.jsp">Already have an Account? Click here for Login</a>
            </div>
        </form>
    </div>
    
</body>
</html>