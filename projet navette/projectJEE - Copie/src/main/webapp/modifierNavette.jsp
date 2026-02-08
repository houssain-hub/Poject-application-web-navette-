 <%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

<!-- Inclusion de Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ajouterN.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Créer une Offre</title>
</head>
<body>
 <%
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Chargement du driver JDBC
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Connexion à la base de données
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cars", "root", "");
            // Préparation de la requête SQL
             
            ps = con.prepareStatement("SELECT * FROM offers where id=?");
            int id=Integer.parseInt(request.getParameter("id"));
            ps.setInt(1,id);
            rs = ps.executeQuery();%>

            // Affichage des résultats
           <%if (rs.next()) {
    %>
 
  <form action="modifierServlet" method="post">
    <!-- Champ caché pour l'ID de l'offre -->
    <input type="hidden" name="id" value="<%=rs.getInt(1) %>" />

    <!-- Photo de transport -->
    

    <!-- Ville de départ -->
    <label for="start_city">Ville de Départ :</label>
    <input type="text" id="start_city" name="villeD" value="<%=rs.getString(2) %>" required><br><br>

    <!-- Ville d'arrivée -->
    <label for="end_city">Ville d'Arrivée :</label>
    <input type="text" id="end_city" name="villeA" value="<%=rs.getString(3) %>" required><br><br>

    <!-- Heure de départ -->
    <label for="start_time">Heure de Départ :</label>
    <input type="time" id="start_time" name="heureD" value="<%=rs.getString(4) %>" required><br><br>

    <!-- Heure d'arrivée -->
    <label for="end_time">Heure d'Arrivée :</label>
    <input type="time" id="end_time" name="heureA" value="<%=rs.getString(5) %>" required><br><br>

    <!-- Période d'abonnement -->
    <label for="subscription_start">Début de la Période d'Abonnement :</label>
    <input type="date" id="subscription_start" name="abonnementD" value="<%=rs.getString(6) %>" required><br><br>

    <label for="subscription_end">Fin de la Période d'Abonnement :</label>
    <input type="date" id="subscription_end" name="abonnementF" value="<%=rs.getString(7) %>" required><br><br>

    <!-- Nombre d'abonnés requis -->
    <label for="required_subscribers">Nombre d'Abonnés Requis :</label>
    <input type="number" id="required_subscribers" name="nombreA" value="<%=rs.getString(8) %>" required><br><br>

    <!-- Description du bus -->
    <label for="bus_description">Description du Bus :</label>
    <textarea id="bus_description" name="Ndescription" rows="4" cols="50" required><%=rs.getString(9) %></textarea><br><br>
     
    <!-- Statut -->
    <label for="status">Statut :</label>
    <select id="status" name="statut">
        <option value="open" ${offre.statut == 'open' ? 'selected' : ''}>Ouverte</option>
        <option value="closed" ${offre.statut == 'closed' ? 'selected' : ''}>Fermée</option>
    </select><br><br>

    <button type="submit">Modifier l'Offre</button>
</form>
                  <%
            }
        } catch (Exception e) {
            out.println("<p style='color:red;'>Erreur : " + e.getMessage() + "</p>");
        } finally {
            // Fermeture des ressources
            if (rs != null) try { rs.close(); } catch (Exception ignore) {}
            if (ps != null) try { ps.close(); } catch (Exception ignore) {}
            if (con != null) try { con.close(); } catch (Exception ignore) {}
        }
    %>
</body>
</html>

