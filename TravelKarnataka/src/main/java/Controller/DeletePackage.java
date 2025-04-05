package Controller;

import java.io.IOException;
import Model.Registration;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/deletePackage")
public class DeletePackage extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
        String packageid = request.getParameter("p_id");

        if (packageid != null && !packageid.isEmpty()) {
            try {
                int pId = Integer.parseInt(packageid);
                Registration registration = new Registration(session);
                boolean isDeleted = registration.deletePackage(pId);

                if (isDeleted) {
                    response.sendRedirect("Admin.jsp?message=Package deleted successfully");
                } else {
                    response.sendRedirect("Admin.jsp?message=Error deleting package");
                }

            } catch (NumberFormatException e) {
                response.sendRedirect("Admin.jsp?message=Invalid package ID");
            }
        } else {
            response.sendRedirect("Admin.jsp?message=Package ID is missing");
        }
    }
}
