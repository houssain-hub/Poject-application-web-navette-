 <%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            <img src="${pageContext.request.contextPath}/images/tr.svg" width="200px" height="60px" class="navbar-brand" >
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    
                     <li class="nav-item">
                        <a class="nav-link text-dark" href="navetteClients.jsp">NAVETTES</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="DemandeOffre.jsp">DEMANDE DE NAVETTES</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="Abonnement.jsp">MES ABONNEMENTS </a>
                    </li>
                </ul>
                <div class="btn-group ">
       <button class="btn-dark btn-sm dropdown-toggle " type="button" data-bs-toggle="dropdown" aria-expanded="false">
      ${email}
      </button>
       <ul class="dropdown-menu">
      <li> <a href="loginClients.jsp"  onclick="return confirm('Êtes-vous sûr de vouloir de vous déconnecter ?');" class="btn ms-auto ">  <i class="fa-solid fa-right-from-bracket" style="color: #b74924;"></i> Log out </a></li>
      
     </ul>
    </div>
         
               
            </div>
        </div>
    </nav>
    <br>
     <h1>${msg}</h1>
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
                <input 
                  type="text" class="form-control" id="villeDepart" name="villeD" placeholder="Entrez la ville de départ"required>
              </div>
              <!-- Champ Ville d'Arrivée -->
              <div class="mb-3">
                <label for="villeArrivee" class="form-label">Ville d'Arrivée</label>
                <input type="text"  class="form-control" id="villeArrivee" name="villeA" placeholder="Entrez la ville d'arrivée"required>
             
              </div>
              <!-- Bouton Rechercher -->
              <div class="d-grid">
                <button type="submit" class="btn text-white" style="background-color: #EB5A3C;">Rechercher</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
    <br>

    <!-- Connexion à la base de données -->
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
            ps = con.prepareStatement("SELECT * FROM offers");
            rs = ps.executeQuery();
            
            // Affichage des résultats;
            while (rs.next()) {
    %>
    <div class="card">
        
        <div class="card-body">
             
            
            <h3 class="card-title"><i class="fa-solid fa-map-pin" style="color:#EB5A3C;"></i><%= rs.getString("villeD") %> <i class="fa-solid fa-map-pin" style="color:#EB5A3C;"></i>    <%= rs.getString("villeA") %></h3><br>
            
            <h5 class="card-text"><i class="fa-regular fa-clock" style="color:#EB5A3C;"></i> Départ: <%= rs.getString("heureD") %>    <i class="fa-regular fa-clock" style="color:#EB5A3C;"></i>   Arrivée:       <%= rs.getString("heureA") %></h5>
            
            <p class="card-text"><i class="fa-regular fa-calendar" style="color:#EB5A3C;"></i>  <%= rs.getString("abonnementD") %>   <%= rs.getString("abonnementF") %></p>
            
            <p class="card-text"><i class="fa-solid fa-user" style="color:#EB5A3C;"></i> <%= rs.getString("nombreA") %></p>
            <p class="card-text"><i class="fa-solid fa-circle-info" style="color: #EB5A3C;" ></i> <%= rs.getString("Ndescription") %></p>
            
            <p class="card-text" style="color:<%= rs.getString("statut").equals("open") ? "green" : "red" %>;">
           <%= rs.getString("statut") %>
            </p>

            
            <a href="conABb.jsp?offre_id=<%= rs.getString("id")%>&company_id=<%= rs.getString("id_company") %>&client_id=${id_client}" style="background-color: #EB5A3C;" onclick="return confirm('Êtes-vous sûr de confirmer votre abonnement ?');" class="btn  text-white">S'ABONNER</a>
            <br>
            <p class="card-text"><small class="text-muted"><%= rs.getString("created_at")%> </small></p>
        </div>
    </div><br>
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

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
</body>
</html>
 