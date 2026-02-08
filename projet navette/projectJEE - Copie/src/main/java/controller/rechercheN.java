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
import java.sql.ResultSet;

@WebServlet("/rechercheN")
public class rechercheN extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public rechercheN() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Charger le driver JDBC et se connecter à la base
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cars", "root", "");

            // Récupérer les paramètres du formulaire
            String villeD = request.getParameter("villeD");
            String villeA = request.getParameter("villeA");

            // Préparer la requête SQL avec des paramètres
            String query = "SELECT * FROM offers WHERE villeD = ? AND villeA = ?";
            PreparedStatement ps = con.prepareStatement(query);

            // Remplacer les paramètres par les valeurs
            ps.setString(1, villeD);
            ps.setString(2, villeA);

            // Exécuter la requête
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                // Ajouter les données au contexte de la requête
                request.setAttribute("ville_depart", rs.getString("villeD"));
                request.setAttribute("ville_arrivee", rs.getString("villeA"));
                request.setAttribute("heure_depart", rs.getString("heureD"));
                request.setAttribute("heure_arrivee", rs.getString("heureA"));
                request.setAttribute("abonnementD", rs.getString("abonnementD"));
                request.setAttribute("abonnementF", rs.getString("abonnementF"));
                request.setAttribute("abonnementN", rs.getString("nombreA"));
                request.setAttribute("Ndescription", rs.getString("Ndescription"));
                request.setAttribute("createdAt", rs.getString("created_at"));
                request.setAttribute("status", rs.getString("statut"));
                // Rediriger vers la page de résultats
                request.getRequestDispatcher("recherche.jsp").forward(request, response);
            } else {
                // Aucun résultat trouvé
                request.setAttribute("msg", "Aucune offre trouvée pour ce trajet.");
                request.getRequestDispatcher("navetteClients.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Erreur lors de l'exécution : " + e.getMessage());
        }
    }
}
