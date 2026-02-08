 <%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/societeGestion.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>Gestion Navette </title>
</head>
<body>
    <!-- Barre de navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-white ">
        <div class="container-fluid">
           <img src="${pageContext.request.contextPath}/images/tr.svg" width="200PX" height="60px" class="navbar-brand" >
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="navette.jsp">GESTION DE NAVETTES</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-dark" href="afficherDemandes.jsp">DEMANDES DE NAVETTES</a>
                    </li>
                    <li class="nav-item">
                 <a class="nav-link text-dark" href="gestionAbonnements.jsp">GESTION ABONNEMENTS </a>
                 </li>
                </ul>
                <div class="btn-group ">
       <button class="btn-dark btn-sm dropdown-toggle " type="button" data-bs-toggle="dropdown" aria-expanded="false">
      ${email}
      </button>
       <ul class="dropdown-menu">
      <li> <a href="login.jsp"  onclick="return confirm('Êtes-vous sûr de vouloir de vous déconnecter ?');" class="btn ms-auto ">  <i class="fa-solid fa-right-from-bracket" style="color: #b74924;"></i> Log out </a></li>
      
     </ul>
    </div>
            </div>
        </div>
    </nav>
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

            // Affichage des résultats
            while (rs.next()) {
    %>
    <div class="card">
        
        <div class="card-body">
             
            
            <h3 class="card-title"><i class="fa-solid fa-map-pin" style="color: #EB5A3C;"></i> <%= rs.getString(2) %> <i class="fa-solid fa-arrow-right" style="color: #EB5A3C;"></i> <i class="fa-solid fa-map-pin" style="color: #EB5A3C;"></i> <%= rs.getString(3) %></h3><br>
            
            <p class="card-text"><i class="fa-regular fa-clock" style="color: #EB5A3C;"></i>  <%= rs.getString(4) %>            <%= rs.getString(5) %></p>
            
            <p class="card-text"><i class="fa-regular fa-calendar" style="color: #EB5A3C;"></i>  <%= rs.getString(6) %>   <%= rs.getString(7) %></p>
            
            <p class="card-text"><i class="fa-solid fa-user" style="color: #EB5A3C;"></i> <%= rs.getString(8) %></p>
            <p class="card-text"><i class="fa-solid fa-circle-info" style="color: #EB5A3C;" ></i> <%= rs.getString(9) %></p>
            <p class="card-text"><%= rs.getString(10) %></p>
          <p class="card-text"><small class="text-muted"><%= rs.getString(11)%> </small></p>
            
    <div class="btn-group ">
       <button class="btn btn-dark btn-lg dropdown-toggle " type="button" data-bs-toggle="dropdown" aria-expanded="false">
      OPERATION
      </button>
       <ul class="dropdown-menu ">
      <li> <a href="deleteN?id=<%=rs.getInt(1) %>"  onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette offre ?');" class="btn ms-auto "> <i class="fa-solid fa-trash"> </i> SUPPRIMER </a></li>
      <li> <a href="modifierNavette.jsp?id=<%=rs.getInt(1) %>" onclick="return confirm('Êtes-vous sûr de vouloir modifier cette offre ?');" class="btn "><i class="fa-solid fa-pen">  </i> MODIFIER</a></li>
      <li> <a href="ajouterNavette.jsp?id=${company_id}"  onclick="return confirm('Êtes-vous sûr de vouloir ajouter un autre offre ?');" class="btn ms-auto "> <i class="fa-solid fa-trash "> </i> AJOUTER</a></li>
     </ul>
    </div>
         <br>
             
   </div>
 </div>
    <br>
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
 