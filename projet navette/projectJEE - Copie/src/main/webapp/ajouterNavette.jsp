<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/clientLogin.css">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Créer une Offre</title>
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
                
                <li class="nav-item">
                    <a class="nav-link text-dark" href="navette.jsp" > NAVETTES</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="afficherDemandes.jsp" >DEMANDE D'OFFRES</a>
                </li>
                <li class="nav-item">
                 <a class="nav-link text-dark" href="gestionAbonnements.jsp">MES ABONNEMENTS </a>
                 </li>
            </ul>
           
        </div>
    </div>
</nav><br>
   
    <form class="formu" action="offreNavette" method="post" >
        <!-- ID de la société -->
         <h2>AJOUTER OFFRE</h2>
        <input type="hidden" name="id_company"  value="${company_id}" />
        <!-- Ville de départ -->
        <label for="start_city">Ville de Départ :</label>
        <input type="text" id="start_city" name="villeD" required><br><br>

        <!-- Ville d'arrivée -->
        <label for="end_city">Ville d'Arrivée :</label>
        <input type="text" id="end_city" name="villeA" required><br><br>

        <!-- Heure de départ -->
        <label for="start_time">Heure de Départ :</label>
        <input type="time" id="start_time" name="heureD" required><br><br>

        <!-- Heure d'arrivée -->
        <label for="end_time">Heure d'Arrivée :</label>
        <input type="time" id="end_time" name="heureA" required><br><br>

        <!-- Période d'abonnement (Début) -->
        <label for="subscription_start">Début de la Période d'Abonnement :</label>
        <input type="date" id="subscription_start" name="abonnementD" required><br><br>

        <!-- Période d'abonnement (Fin) -->
        <label for="subscription_end">Fin de la Période d'Abonnement :</label>
        <input type="date" id="subscription_end" name="abonnementF" required><br><br>

        <!-- Nombre d'abonnés requis -->
        <label for="required_subscribers">Nombre d'Abonnés Requis :</label>
        <input type="number" id="required_subscribers" name="nombreA" required><br><br>

        <!-- Description du bus -->
        <label for="bus_description">Description du Bus :</label><br>
        <textarea id="bus_description" name="Ndescription" rows="4" cols="50" required></textarea><br><br>

        <!-- Statut -->
        <label for="status">Statut :</label>
        <select id="status" name="statut">
            <option value="open">Ouverte</option>
            <option value="closed">Fermée</option>
        </select><br><br>

        <button type="submit">Créer l'Offre</button>
    </form>
</body>
</html>

