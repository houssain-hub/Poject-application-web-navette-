<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/navette.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>NAVETTES</title>
</head>
<body>
    <!-- Barre de navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-white">
        <div class="container-fluid">
             <img src="${pageContext.request.contextPath}/images/tr.svg" width="200PX" height="60px" class="navbar-brand" >
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                   
                    <li class="nav-item"><a class="nav-link text-dark" href="navetteClients.jsp">NAVETTES</a></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="demandeOffre.jsp">DEMANDE DE NAVETTES</a></li>
                    <li class="nav-item"><a class="nav-link text-dark" href="Abonnement.jsp">MES ABONNEMENTS</a></li>
                </ul>
                <div class="btn-group">
                    <button class="btn-dark btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        ${email}
                    </button>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="loginClients.jsp" onclick="return confirm('Êtes-vous sûr de vouloir de vous déconnecter ?');" class="btn ms-auto">
                                <i class="fa-solid fa-right-from-bracket" style="color: #b74924;"></i> Log out
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>
    <br>

    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <!-- Carte Bootstrap -->
                <div class="card">
                    <div class="card-header bg-dark text-white">
                        <h5 class="card-title mb-0">Recherche de Navette</h5>
                    </div>
                    <div class="card-body">
                        <form action="rechercheN" method="post">
                            <!-- Champ Ville de Départ -->
                            <div class="mb-3">
                                <label for="villeDepart" class="form-label">Ville de Départ</label>
                                <input type="text" class="form-control" id="villeDepart" name="villeD" placeholder="Entrez la ville de départ" required>
                            </div>
                            <!-- Champ Ville d'Arrivée -->
                            <div class="mb-3">
                                <label for="villeArrivee" class="form-label">Ville d'Arrivée</label>
                                <input type="text" class="form-control" id="villeArrivee" name="villeA" placeholder="Entrez la ville d'arrivée" required>
                            </div>
                            <!-- Bouton Rechercher -->
                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Rechercher</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>

    <% 
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;
try {
    // Charger le driver JDBC et se connecter à la base
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cars", "root", "");

    // Récupérer les paramètres du formulaire
    String villeD = request.getParameter("villeD");
    String villeA = request.getParameter("villeA");

    if (villeD != null && villeA != null) {
        // Préparer la requête SQL avec des paramètres
        String query = "SELECT * FROM offers WHERE villeD = ? AND villeA = ?";
        ps = con.prepareStatement(query);

        // Remplacer les paramètres par les valeurs
        ps.setString(1, villeD);
        ps.setString(2, villeA);

        // Exécuter la requête
        rs = ps.executeQuery();

        // Vérifier s'il y a des résultats
        boolean hasResults = false;
        while (rs.next()) {
            hasResults = true;
%>
            <div class="card mb-3">
                <div class="card-body">
                    <h3 class="card-title">
                        <i class="fa-solid fa-map-pin" style="color:#EB5A3C;"></i>
                        <%= rs.getString(2) %> 
                        <i class="fa-solid fa-map-pin" style="color:#EB5A3C;"></i> 
                        <%= rs.getString(3) %>
                    </h3>
                    <h5 class="card-text">
                        <i class="fa-regular fa-clock" style="color:#EB5A3C;"></i> 
                        Départ: <%= rs.getString(4) %> Arrivée: <%= rs.getString(5) %>
                    </h5>
                    <p class="card-text">
                        <i class="fa-regular fa-calendar" style="color:#EB5A3C;"></i> 
                        <%= rs.getString(6) %> <%= rs.getString(7) %>
                    </p>
                    <p class="card-text">
                        <i class="fa-solid fa-user" style="color:#EB5A3C;"></i> 
                        <%= rs.getString(8) %>
                    </p>
                    <p class="card-text">
                        <i class="fa-solid fa-circle-info" style="color:#EB5A3C;"></i> 
                        <%= rs.getString(9) %>
                    </p>
                    <a href="offreNavette?id=<%= rs.getInt(1) %>" style="background-color: rgb(128, 0, 255);" onclick="return confirm('Êtes-vous sûr de confirmer votre abonnement ?');" class="btn ms-auto align-items-lg-end text-white">
                        S'ABONNER
                    </a>
                </div>
            </div>
<%
        }
        if (!hasResults) {
%>
            <div class="alert alert-danger" role="alert">Aucune navette trouvée</div>
<%
        }
    }
} catch (Exception e) {
    e.printStackTrace();
    response.getWriter().println("Erreur lors de l'exécution : " + e.getMessage());
} finally {
    // Fermer les ressources
    if (rs != null) try { rs.close(); } catch (Exception ignored) {}
    if (ps != null) try { ps.close(); } catch (Exception ignored) {}
    if (con != null) try { con.close(); } catch (Exception ignored) {}
}
%>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
</body>
</html>
