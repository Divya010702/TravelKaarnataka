<%@page import="Model.Packages"%>
<%@page import="Model.BookingDB"%>
<%@page import="Model.Registration"%>
<%@page import="java.util.ArrayList"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="path/to/your/styles.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            color: #333;
            line-height: 1.6;
        }

        .container-xl {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

        h2 {
            color: #444;
            font-size: 1.8em;
            margin-bottom: 10px;
        }

        .cart-item {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background-color: #fafafa;
            transition: background 0.3s;
        }

        .cart-item:hover {
            background-color: #f0f0f0;
        }

        .cart-image {
            width: 100px;
            height: auto;
            border-radius: 8px;
            margin-right: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .cart-details {
            flex-grow: 1;
        }

        .cart-name {
            font-size: 1.2em;
            color: #333;
            margin-bottom: 5px;
        }

        .cart-cost {
            font-size: 1em;
            color: #f9d04e;
        }

        .cost {
            font-size: 1.5em;
            font-weight: bold;
            margin: 20px 0;
        }

        .btn {
            background-color: #f9e55e;
            color: #333;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            transition: background 0.3s;
        }

        .btn:hover {
            background-color: #f9d04e;
        }

        select.selectpicker {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 2px solid #f9d04e;
            border-radius: 5px;
            background-color: #fff;
            font-size: 1em;
            transition: border-color 0.3s;
        }

        select.selectpicker:focus {
            border-color: #f9e55e;
            outline: none;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 2px solid #f9d04e;
            border-radius: 5px;
            font-size: 1em;
        }

        input[type="text"]:focus {
            border-color: #f9e55e;
            outline: none;
        }
        .cart-details {
    display: flex;
    flex-direction: column;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 8px;
    background-color: #fafafa;
    transition: background 0.3s;
}

.cart-details:hover {
    background-color: #f0f0f0;
}

.cart-name {
    font-size: 1.4em;
    color: #333;
    margin-bottom: 5px;
}

.cart-quantity {
    font-size: 1.2em;
    color: #555;
    margin-bottom: 5px;
}

.cart-cost {
    font-size: 1.2em;
    color: #f9d04e;
    font-weight: bold;
}

.date{
	color: black;
}
input[type="date"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            border: 2px solid black;
            border-radius: 5px;
            font-size: 1em;
        }
        
    </style>
</head>
<body>
 <div class="header">
        <div class="container">
            <%@include file="Header.jsp"%>
        </div>
    </div>

    <% if (session.getAttribute("uname") != null) { %>
        <div class="container-xl">
            <h2>Booking Form</h2>
            <div style="font-size:20px">Name: <%= session.getAttribute("uname") %></div>
            <br>
            <form action="bookStatus" method="POST">
            
                <%
                String packageId = request.getParameter("p_id");
                Registration r = new Registration(session);
                int tprice = 0;
                ArrayList<BookingDB> book= r.getbookinfo();

                if (!book.isEmpty()) {
                    for (BookingDB item : book) {
                        tprice += item.getTotalPrice();
                %>
                        <div class="cart-item">
                            <img src="AddPackages/<%= item.getb_image() %>" class="cart-image" alt="<%= item.getb_name() %>">
                            <div class="cart-details">
                                <label class="cart-name">Package Name: <input type="text" name="b_name" value="<%= item.getb_name() %>" /></label>
                                <label class="cart-quantity">Total Person : <%=item.getPerson() %></label>
                                <label class="cart-cost">Package Price: &#8377; <%= item.getb_price() %></label>
                               
                            </div>
                        </div>
                        <hr>
                <%
                    }
                } else {
                %>
                    <p>Not selected</p>
                <%
                }
                %>

                <div class="cost">
                    Total: &#8377; <%= tprice %>
                </div>
                
                <h2><u> Address:</u></h2>
               
              
                <input type="text" id="city" name="city" placeholder="Enter city" required><br>
                <input type="text" id="state" name="state" placeholder="Enter state" required><br>
                <input type="hidden" name="tprice" value="<%= tprice %>">
                <label class="date">Date of Trip</label> <input type="date" id="myDate"
						class="form-control" name="date" value=""
						onfocus="disablePastDates()">
	             <input type="submit" name="bookStatus" value="Confirm Booking" class="btn"><br>
						
            </form>
        </div>
    <% } else { %>
        <p>Please log in to view the booking form.</p>
    <% } %>

    <%@include file="Footer.jsp"%>
    <script type="text/javascript">
		function disablePastDates() {
			var today = new Date();
			var dd = String(today.getDate()).padStart(2, '0');
			var mm = String(today.getMonth() + 1).padStart(2, '0');
			var yyyy = today.getFullYear();
			today = yyyy + '-' + mm + '-' + dd;
			document.getElementById("myDate").setAttribute("min", today);
		}
	</script>

</body>
</html>