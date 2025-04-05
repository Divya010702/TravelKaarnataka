
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
        .container {
            width: 80%;
            margin: 30px auto;
            padding: 40px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        }
        .add-package-button {
        background-color:#9C27B0; 
        color: white;
        border: none;
        padding: 12px 25px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        border-radius: 5px;
        margin-left:1000px;
        margin-top:-50px;
        transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
    }

    .add-package-button:hover {
        background-color: #218838;
        transform: translateY(-2px);
    }

    .add-package-button:focus {
        outline: none;
        box-shadow: 0 0 5px rgba(40, 167, 69, 0.7);
    }

    a {
        text-decoration: none;
    }
            .package-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 20px;
            margin-top: 40px;
        }
.package-card {
    background-color: #fff;
    border: 2px solid #7B1FA2;
    border-radius: 10px;
    padding: 20px;
    width: calc(33% - 20px); 
    box-shadow: 0px 6px 20px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease;
    text-align: center;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-between;
    height: auto;
}

.package-card img {
    width: 300px;
    height: 300px;
    object-fit: cover;
    border-radius: 10px;
    margin-bottom: 15px;
}

.package-card h3 {
    font-size: 1.5rem;
    color: black;
    margin-bottom: 10px;
    margin-top: 0;
}

.package-card p {
    font-size: 1.2rem;
    color: #7B1FA2;
    margin-bottom: 20px;
}

.package-card .button-container {
    display: flex;
    flex-direction: column;
    gap: 10px;
    width: 100%;
}

.package-card form button {
    background-color: #7B1FA2; 
    color: white;
    padding: 10px 15px;
    border-radius: 5px;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
    width: 100%;
}

.package-card form button:hover {
    background-color: #CE93D8; 
}


        .no-packages {
            font-size: 1.3rem;
            color: black;
            font-weight: bold;
            text-align: center;
        }
        @media screen and (max-width: 1024px) {
            .package-card {
                width: calc(50% - 20px); 
            }
        }

        @media screen and (max-width: 768px) {
            .package-container {
                flex-direction: column;
                align-items: center;
            }

            .package-card {
                width: 100%;
                margin-bottom: 20px;
            }

            .container {
                width: 90%;
                padding: 20px;
            }
        }
         button[type="submit"] {
            background-color: #ffeb3b; 
            color: white;
            border: none;
            border-radius: 5px;
            padding: 12px 18px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
            margin-top: 10px;
        }

        button[type="submit"]:hover {
            background-color: #fbc02d; 
            transform: scale(1.05);
        }
        </style>
        
</head>
<body>
<%@include file="Header.jsp"  %>
<div class="header">
    <h1>Manage Trip Packages</h1>
</div>
<div class="container">
     <h2>Current Packages</h2>
     <br>
     <br>
     <a href="AddPackage.jsp">
    <button class="add-package-button">Add Packages</button>
</a>
    <div class="package-container">
        <%
                Registration r = new Registration(session);
                ArrayList<Packages> al = r.get_all_packagesinfo();
                if (al != null && !al.isEmpty()) {
                    for (Packages s : al) {
            %>
                <div class="package-card">
                    <h3><%= s.getP_name() %></h3>
                    <img src="AddPackages/<%= s.getP_image() %>" alt="<%= s.getP_name() %>" />
                    <p>Price: &#8377; <%= s.getP_price() %><br>Duration:<%=s.getP_duration() %></p>
                    <div class="button-container">
                        
                        <form action="UpdateDetails.jsp" method="get">
                                <input type="hidden" name="p_id" value="<%= s.getP_id() %>" />
                                <button type="submit" class="btn">Update</button>
                            </form>
                        
                        <form action="deletePackage" method="post" style="display:inline;">
                            <input type="hidden" name="p_id" value="<%= s.getP_id() %>" />
                            <button type="submit" class="btn">Delete</button>
                        </form>
                        
                        
                       
                    </div>
                   
                </div>

                <%
                    }
                } else {
            %>
                    <p class="no-packages">No packages found.</p>
            <%
                }
            %>
        
    </div>
</div>
</body>
</html>