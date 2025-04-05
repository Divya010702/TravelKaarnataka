package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;
import java.io.PrintWriter;

import Model.Registration;

@WebServlet(name = "bookStatus", urlPatterns = {"/bookStatus"})
public class BookTrip extends HttpServlet {

	 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
		 HttpSession session = request.getSession();
	        Registration registration = new Registration(session);

	        try {
	            if (request.getParameter("bookStatus") != null) {
	                // Retrieve form parameters
	            	String name=request.getParameter("b_name");
	                String address = request.getParameter("address");
	                String city = request.getParameter("city");
	                String state = request.getParameter("state");
	                String tprice = request.getParameter("tprice");
	                String date = request.getParameter("date");

	                // Call the details method in the Registration class
	                String status = registration.details(name, city, state, tprice, date);

	                // Redirect based on status
	                if ("success".equals(status)) {
	                    RequestDispatcher dispatcher = request.getRequestDispatcher("myBook.jsp");
	                    dispatcher.forward(request, response);
	                } else {
	                    request.setAttribute("error", "Booking failed. Please try again.");
	                    RequestDispatcher dispatcher = request.getRequestDispatcher("myBook.jsp");
	                    dispatcher.forward(request, response);
	                }
	            }
	            else if (request.getParameter("delete") != null) {
	                int bid = Integer.parseInt(request.getParameter("bookid"));
	                int status = registration.deletebook(bid);
	                if (status > 0) {
	                    RequestDispatcher rd1 = request.getRequestDispatcher("myBook.jsp");
	                    rd1.forward(request, response);
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	 @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        processRequest(request, response);
	    }

	   
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        processRequest(request, response);
	    }

}
