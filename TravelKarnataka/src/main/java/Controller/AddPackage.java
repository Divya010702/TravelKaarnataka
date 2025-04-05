package Controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.io.IOException;

import Model.Packages;
import Model.Registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/addPackage")
public class AddPackage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        String name = request.getParameter("name");
        String image = request.getParameter("image");
        double price = Double.parseDouble(request.getParameter("price"));
        String duration = request.getParameter("duration");
        String destination = request.getParameter("destination");
        String activities = request.getParameter("activities");
        String accommodation = request.getParameter("accommodation");
        String inclusion = request.getParameter("inclusion");

        
        Packages p = new Packages();
        p.setP_name(name);
        p.setP_image(image);
        p.setP_price(price);
        p.setP_duration(duration);
        p.setP_destination(destination);
        p.setP_activities(activities);
        p.setP_accommodation(accommodation);
        p.setP_inclusion(inclusion);
        System.out.println(p);
   

        
        HttpSession session = request.getSession();
        Registration registration = new Registration(session);
        
        
        boolean success = registration.addPackages(p);
        
        if (success) {
            response.sendRedirect("Admin.jsp?message=Packages added successfully!");
        } else {
            response.sendRedirect("Admin.jsp?error=Failed to add package.");
        }
    }
}