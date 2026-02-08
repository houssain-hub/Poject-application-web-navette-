<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
    <!-- Inclusion de Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Inclusion de la police Roboto -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    
    <!-- Inclusion de votre fichier CSS personnalisé -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/societeGestion.css">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Societe</title>
</head>
<body>

<!-- Barre de navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-white ">
    <div class="container-fluid">
        <img src="${pageContext.request.contextPath}/images/tr.svg" width="150PX" height="40px" class="navbar-brand" >
        <button class="navbar-toggler bg-dark text-danger" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                
                <li class="nav-item ">
                    <a class="nav-link text-dark " aria-current="page" href="navetteClients.jsp">GESTION DES OFFRES</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="demandeOffre.jsp">DEMANDE NAVETTES</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="gestionAbonnements.jsp" >CLIENTS</a>
                </li>
            </ul>
            
        </div>
    </div>
</nav>

<!-- Contenu principal -->
<br>
  <%
        String offreId = request.getParameter("offre_id");
        String companyId = request.getParameter("company_id");
        String clientId = request.getParameter("client_id");
    %>
<div class="card" style="width: 18rem;">
  <div class="card-body">
    <h5 class="card-title text-dark">CONFIMER</h5>
     <form action="abonnements" method="post">
        
        <input type="hidden" id="offre_id" name="id" value="<%= offreId %>" readonly><br><br>

        
        <input type="hidden" id="company_id" name="company_id" value="<%= companyId %>" readonly><br><br>

        
        <input type="hidden" id="client_id" name="id_client" value="<%= clientId %>" readonly><br><br>

        <button type="submit" class="btn btn-primary">Confirmer Abonnement</button>
    </form><br>
    
    <a href="navetteClient.jsp" class="card-link text-danger">Cancel Abonnement</a>
    
  </div>
</div>
    <!-- Affichage dans un formulaire -->
   
>

<!-- Inclusion de Bootstrap JS et Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

</body>
</html>