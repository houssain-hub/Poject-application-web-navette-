package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class deleteN
 */
@WebServlet("/deleteN")
public class deleteN extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteN() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Connection to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cars", "root", "");

            // Retrieve the `id` parameter from the request
            int id = Integer.parseInt(request.getParameter("id"));

            // Step 1: Delete rows from the `abonnements` table where `offer_id` matches
            PreparedStatement psAbonnements = con.prepareStatement("DELETE FROM abonnements WHERE offer_id = ?");
            psAbonnements.setInt(1, id);
            psAbonnements.executeUpdate();

            // Step 2: Delete the row from the `offers` table
            PreparedStatement psOffers = con.prepareStatement("DELETE FROM offers WHERE id = ?");
            psOffers.setInt(1, id);
            int rowsDeleted = psOffers.executeUpdate();

            // Check if the deletion was successful
            if (rowsDeleted > 0) {
                response.sendRedirect("navette.jsp");
                response.getWriter().println("Offre supprimée avec succès !");
            } else {
                response.getWriter().println("Aucune offre trouvée avec cet ID.");
            }

            // Close resources
            psAbonnements.close();
            psOffers.close();
            con.close();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
