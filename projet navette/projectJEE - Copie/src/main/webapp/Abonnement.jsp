 <%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
    <!-- Inclusion de Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
    <!-- Inclusion de la police Roboto -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    
    <!-- Inclusion de votre fichier CSS personnalisé -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/societeGestion.css">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Demandes de Navettes</title>
</head>
<body>

<!-- Barre de navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-white">
    <div class="container-fluid">
        <img src="${pageContext.request.contextPath}/images/tr.svg" width="250PX" height="60px" class="navbar-brand" >
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                
                <li class="nav-item">
                    <a class="nav-link text-dark" href="navetteClients.jsp" > NAVETTES</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="DemandeOffre.jsp" >DEMANDE D'OFFRES</a>
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
      <li> <a href="loginClients.jsp"  onclick="return confirm('Êtes-vous sûr de vouloir de vous déconnecter ?');" class="btn ms-auto ">  <i class="fa-solid fa-right-from-bracket" style="color: #b74924;"></i> Log out</a></li>
      
     </ul>
    </div>
        </div>
    </div>
</nav>
<br>
<h2>MES ABONNEMENTS</h2>
<!-- Contenu principal -->
<br>
<%
Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cars","root","");
 ps = con.prepareStatement(
		 "SELECT a.id_abonnement,u.Sname AS Sname,u.email AS email,o.villeD AS villeD,o.villeA AS villeA,o.abonnementD AS abonnementD ,o.abonnementF AS abonnementF,o.statut AS statut FROM abonnements a JOIN societes u ON a.company_id = u.company_id JOIN offers o ON a.offer_id = o.id;");
 rs = ps.executeQuery();
%>

<table class="table">

  <thead>
    <tr>
      
      <th scope="col"><i class="fa-regular fa-building" style="color: #c1581f;"></i> Nom societe</th>
      
      <th scope="col"><i class="fa-solid fa-envelope" style="color: #d84818;"></i> email</th>
      <th scope="col"><i class="fa-solid fa-location-dot" style="color: #d16015;"></i> Ville Depart</th>
      <th scope="col"><i class="fa-solid fa-location-dot" style="color: #d16015;"></i> Ville d'Arivée</th>
      <th scope="col"><i class="fa-regular fa-calendar-days" style="color: #c95618;"></i> Debut d'abonnement</th>
      <th scope="col"><i class="fa-regular fa-calendar-days" style="color: #c95618;"></i> Fin d'abonnement</th>
      <th scope="col"><i class="fa-solid fa-circle-info" style="color: #ce5a0d;"></i> Status navette</th>
    </tr>
  </thead>
  <tbody>
  <%while(rs.next()){ %>
    <tr>
      
      <td><%=rs.getString("Sname") %></td>
      <td><%=rs.getString("email") %></td>
      <td><%=rs.getString("villeD") %></td>
      <td><%=rs.getString("villeA") %></td>
      <td><%=rs.getString("abonnementD") %></td>
      <td><%=rs.getString("abonnementF")%></td>
      <td><%=rs.getString("statut")%></td>
    </tr>
    
  </tbody>
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
</table>
 

<!-- Inclusion de Bootstrap JS et Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

</body>
</html>

