<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Model.Ratings"%>
<%@page import="Model.Registration"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.container {
	        max-width: 1200px;
            margin: 40px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px black;	
}

.table-responsive {
	margin: 30px 0;
}

.table-wrapper {
	background: #fff;
	padding: 20px 25px;
	border-radius: 3px;
	
	box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
}

.table-title {
	padding-bottom: 15px;
	background: #35475e;
	color: #fff;
	min-width: 100%;
	margin: -20px -25px 10px;
	border-radius: 3px 3px 0 0;
}

.table-title h2 {
	margin: 5px 0 0;
	font-size: 24px;
}

table.table tr th, table.table tr td {
	border-color: #e9e9e9;
	padding: 12px 15px;
	
}

table.table tr th:first-child {
	width: 200px;
}

table.table tr th:last-child {
	width: 300px;
}

table.table-striped tbody tr:nth-of-type(odd) {
	background-color: #fcfcfc;
}

table.table-striped.table-hover tbody tr:hover {
	background: #f5f5f5;
}

table.table th i {
	font-size: 13px;
	margin: 0 5px;
	cursor: pointer;
}

table.table td:last-child i {
	opacity: 0.9;
	font-size: 22px;
	margin: 0 5px;
}

table.table td a {
	font-weight: bold;
	color: #566787;
	display: inline-block;
	text-decoration: none;
	outline: none !important;
}

table.table td a:hover {
	color: #2196F3;
}

table.table td a.edit {
	color: #FFC107;
}

table.table td a.delete {
	color: white;
}

table.table td i {
	font-size: 19px;
}

table.table .avatar {
	border-radius: 50%;
	vertical-align: middle;
	margin-right: 10px;
}

.cost {
	float: right;
	font-size: 25px;
	color: black;
	padding-top: 20px;
	padding-right: 300px;
}

.btn btn-warning {
	margin-top: 17px
}
</style>
</head>
<body >
<%@include file="Header.jsp"%>
<div class="container">
	<div class="header">
		
			
	
	</div>
	<%
	if (session.getAttribute("uname") != null) {
	%>
	<div class="container-xl">
		<div class="table-responsive">
			<div class="table-wrapper">
				<div class="container-fluid"
					style="background-color: #E1BEE7;  width: 1090px; height: 67px; margin-left: -23px; margin-top: -20px;font-style: inherit; color:black;">
					<div class="row">
						<div class="col-sm-4">
							<h3 style="padding-left: 20px; padding-top: 14px;">
								Customer <b>Feedback</b>
							</h3>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Email</th>
							<th>Ratings out of 5</th>
							<th>Message</th>
							<th>Date</th>
						</tr>
					</thead>
					<tbody>
						<%
						Registration r = new Registration(session);
						ArrayList<Ratings> ar = r.getReviewList();
						Iterator<Ratings> itr = ar.iterator();
						while (itr.hasNext()) {
							Ratings s = itr.next();
						%>
						<tr>
							<td><%=s.getRid()%></td>
							<td><%=s.getUname()%></td>
							<td><%=s.getEmail()%></td>
							<td><%=s.getRating()%></td>
							<td><%=s.getMessage()%></td>
							<td><%=s.getDate()%></td>
						</tr>
						</tr>
						<%}%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
		</div>
	<%}%>
	<%@include file="Footer.jsp"%>
</body>
</html>