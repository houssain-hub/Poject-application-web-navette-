<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"  />
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/societeGestion.css">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Demandes de Navettes</title>
</head>
<body>

<!-- Barre de navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-white">
    <div class="container-fluid">
        <img src="${pageContext.request.contextPath}/images/tr.svg" width="200px" height="60px" class="navbar-brand">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link text-dark" href="navette.jsp">GESTION NAVETTES</a></li>
                <li class="nav-item"><a class="nav-link text-dark" href="afficherDemandes.jsp">GESTION DE NAVETTES</a></li>
                <li class="nav-item"><a class="nav-link text-dark" href="gestionAbonnements.jsp">GESTION ABONNEMENTS</a></li>
            </ul>
            <div class="btn-group">
                <button class="btn-dark btn-sm dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                    ${email}
                </button>
                <ul class="dropdown-menu">
                    <li>
                        <a href="login.jsp" onclick="return confirm('Êtes-vous sûr de vouloir vous déconnecter ?');" class="btn ms-auto">
                            <i class="fa-solid fa-right-from-bracket" style="color: #b74924;"></i> Log out
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>

<br>
<h2>LES DEMANDES DE NAVETTES</h2>
<br>

<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        // Connexion à la base de données
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cars", "root", "");

        // Récupération des demandes
        String query = "SELECT nameC, phone, email, villeD, villeA, COUNT(*) AS nombre_demandes " +
                       "FROM demandes " +
                       "GROUP BY  villeD, villeA";

        ps = con.prepareStatement(query);
        rs = ps.executeQuery();
%>

<table class="table table-bordered table-hover">
    <thead>
        <tr>
            <th scope="col"><i class="fa-solid fa-user" style="color: #b9541d;"></i> Nom Complet</th>
            <th scope="col"><i class="fa-solid fa-phone" style="color: #d84818;"></i> Numéro de Téléphone</th>
            <th scope="col"> <i class="fa-solid fa-envelope" style="color: #d84818;"></i> Email</th>
            <th scope="col"><i class="fa-solid fa-location-dot" style="color: #d23e19;"></i> Ville de Départ</th>
            <th scope="col"><i class="fa-solid fa-location-dot" style="color: #d23e19;"></i> Ville d'Arrivée</th>
            <th scope="col"><i class="fa-solid fa-person" style="color: #f04b14;"></i> Nombre de Demandes</th>
        </tr>
    </thead>
    <tbody>
        <% while (rs.next()) { %>
            <tr>
                <td><%= rs.getString("nameC") %></td>
                <td><%= rs.getString("phone") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("villeD") %></td>
                <td><%= rs.getString("villeA") %></td>
                <td><%= rs.getInt("nombre_demandes") %></td>
            </tr>
        <% } %>
    </tbody>
</table>

<%
    } catch (Exception e) {
        out.println("<p style='color:red;'>Erreur : " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception ignore) {}
        if (ps != null) try { ps.close(); } catch (Exception ignore) {}
        if (con != null) try { con.close(); } catch (Exception ignore) {}
    }
%>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

</body>
</html>
