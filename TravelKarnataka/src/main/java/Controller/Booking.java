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
@WebServlet(name = "booking", urlPatterns = {"/booking"})
public class Booking extends HttpServlet {
   
	 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        
	        PrintWriter out = response.getWriter();
	        HttpSession session = request.getSession();
	        Registration reg = new Registration(session);
	        try {
	            if (request.getParameter("booking") != null) {
	                String p_id = request.getParameter("p_id");
	               String person = request.getParameter("person");
	                String status = reg.booking(p_id,person);
	                if (status.equals("success")) {
	                    RequestDispatcher rd1 = request.getRequestDispatcher("Book.jsp");
	                    rd1.forward(request, response);
	                }
	            }
	            else if (request.getParameter("delete") != null) {
	                int b_id = Integer.parseInt(request.getParameter("bid"));
	                int status = reg.delete(b_id);
	                if (status > 0) {
	                    RequestDispatcher rd1 = request.getRequestDispatcher("Book.jsp");
	                    rd1.forward(request, response);
	                }
	            }
	        }
	            catch (Exception e) {
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