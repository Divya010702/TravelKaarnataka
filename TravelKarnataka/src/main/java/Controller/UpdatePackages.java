package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import Model.Packages;
import Model.Registration;


@WebServlet("/updatePackage")
public class UpdatePackages extends HttpServlet {
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int packageId = Integer.parseInt(request.getParameter("p_id"));
            String name = request.getParameter("p_name");
            String image = request.getParameter("p_image");
            double price = Double.parseDouble(request.getParameter("p_price"));
            String duration = request.getParameter("p_duration");
            String destination = request.getParameter("p_destination");
            String activities = request.getParameter("p_activities");
            String accommodation = request.getParameter("p_accommodation");
            String inclusions = request.getParameter("p_inclusion");

            Packages updatedPackage = new Packages();
            updatedPackage.setP_id(packageId);
            updatedPackage.setP_name(name);
            updatedPackage.setP_image(image);
            updatedPackage.setP_price(price);
            updatedPackage.setP_duration(duration);
            updatedPackage.setP_destination(destination);
            updatedPackage.setP_activities(activities);
            updatedPackage.setP_accommodation(accommodation);
            updatedPackage.setP_inclusion(inclusions);

            Registration registration = new Registration(request.getSession());
            boolean success = registration.updatePackage(updatedPackage);

            if (success) {
                response.sendRedirect("Packages.jsp?message=Package updated successfully!");
            } else {
                response.sendRedirect("Packages.jsp?error=Failed to update package.");
            }
        } catch (Exception e) {
            response.sendRedirect("Packages.jsp?error=An error occurred.");
        }
    }
}


