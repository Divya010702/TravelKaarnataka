package Controller;

import java.io.IOException;

import Model.Registration;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminlogin")
public class adminlogin extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Registration admin = new Registration(session);
		
		 if(req.getParameter("login")!=null) {
				String email=req.getParameter("email");
				String password=req.getParameter("password");
				
				String status =admin.login(email, password);
				if(status.equals("success")) {
					req.setAttribute("status", "Login Successfull");
					RequestDispatcher rd =req.getRequestDispatcher("Admin.jsp");
					rd.forward(req, resp);
				}
				else if(status.equals("failure")) {
					req.setAttribute("status", "Login failed");
					RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
					rd.forward(req, resp);
				}
				
		
			}
		 else if (req.getParameter("acceptevent") != null) {
			    int order_id = Integer.parseInt(req.getParameter("book_id"));
			    int status = admin.acceptBook(order_id);  
			    if (status > 0) {
			        RequestDispatcher rd = req.getRequestDispatcher("BookedPackages.jsp");
			        rd.forward(req, resp);
			    }
			}
		 else if ( req.getParameter("cancel") != null) {
			    int order_id = Integer.parseInt(req.getParameter("book_id"));
			    int status = admin.cancelBook(order_id);
			    if (status > 0) {
			        RequestDispatcher rd = req.getRequestDispatcher("BookedPackages.jsp");
			        rd.forward(req, resp);
			    }
			}
		 

	}

}
