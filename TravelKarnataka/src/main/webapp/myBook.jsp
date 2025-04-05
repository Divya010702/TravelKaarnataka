
<%@page import="java.util.Iterator"%>
<%@page import="Model.BookStatus"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Registration"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 body {
           
            font-family: 'Roboto', sans-serif;
            color: #333;
        }
         h1 {
            margin-bottom: 20px;
            font-size: 2rem;
            color: #CE93D8;
            font-weight: bold;
        }
        .table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
        }
         th {
            font-size:20px;
            background-color: white;
            color: black;
            font-weight: bold;
        }
        .container{
            max-width: 1200px;
            margin: 50px auto;
            padding: 30px;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }
        .package-image {
            width: 80px; 
            height: auto;
            border-radius: 8px;
            transition: transform 0.3s;
        }
        .package-image:hover {
            transform: scale(1.1);
        }
        .btn-warning {
            background-color: #CE93D8;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.2s;
        }
        .btn-warning:hover {
            background-color: red;
            transform: scale(1.05);
        }
        a{
        text-decoration: none;
            color: #333;
            font-size: 16px;
            transition: color 0.3s;
            font-size: 20px;
            margin-top:20px;
            font-weight: bold;}
        
        
        
        
</style>
</head>
<body>
 <%@include file="Header.jsp" %>  
 
  <div class="container" >
  <table class="table table-striped table-hover">
  <h1><b>My Trip</b></h1>
                    <thead>
                        <tr>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Package Price</th>
                            <th>Booked date</th>
                            <th>Trip date</th>
                            <th>Status</th>
                            <th>Actions</th>
                            <th>Rating</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                            Registration s1 = new Registration(session);
                            ArrayList<BookStatus> ar = s1.getmybookinfo();
                            Iterator<BookStatus> itr = ar.iterator();
                            while (itr.hasNext()) {
                            	BookStatus s = itr.next();%> 
                        <%
                                Registration s2 = new Registration(session);
                                ArrayList<BookStatus> ar1 = s2.getbookinfotrip(s.getBook_id());
                                Iterator<BookStatus> itr1 = ar1.iterator();
                                while (itr1.hasNext()) {
                                	BookStatus s3 = itr1.next();
                                	int tprice=Integer.parseInt(s3.getB_price())*Integer.parseInt(s3.getPerson());

                        %> 
                         	<tr> 
                            <td><img src="AddPackages/<%=s3.getP_image()%>" class="package-image" ></td>
                            <td><%=s3.getB_name()%></td>
                            <td>&#8377 <%=tprice%></td>
                             <td><%=s.getDate() %></td>
                              <td><%=s.getBs_date() %></td>
                               <td><%=s.getStatus()%></td>
                               <td>
                                <%if (s.getStatus().equals("booked")) {%>
                                <form action="bookStatus" method="post">
                                    <input type="hidden" name="bookid" value="<%=s.getBook_id()%>"/>
                                    <input type="submit" class="btn btn-warning" name="delete" value="Cancel">
                                </form>
                                <%}%>
                            </td>
                            <td><a href="Feedback.jsp">Review</a></td>
                            
                              
                            
                           
                        </tr>
                         	<%} }%>
                      </tbody>
 </table>
 </div>


</body>
</html>