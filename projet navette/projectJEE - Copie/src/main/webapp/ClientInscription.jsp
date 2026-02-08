<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/clientLogin.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"> 
<meta charset="UTF-8">
<title>CLIENT INSCRIPTION</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-white">
        <div class="container-fluid">
           <img src="${pageContext.request.contextPath}/images/tr.svg" width="200PX" height="60px" class="navbar-brand" >
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
           
                
               
        </div>
    </nav><br>
<form class="formu" action="ClientInscription " method="post">
        <h2>Inscription Clients</h2>
        
        <label for="name">Nom complet :</label>
        <input type="text" id="name" name="Cname" placeholder="Entrez votre nom" required>

        <label for="password">Mot de passe :</label>
        <input type="password" id="password" name="password" placeholder="Entrez votre mot de passe" required>

        <label for="email">Adresse email :</label>
        <input type="email" id="email" name="email" placeholder="Entrez votre email" required>

       
        <label for="phone">Numéro de téléphone :</label>
        <input type="tel" name="phone_number" placeholder="Entrez votre numéro de téléphone" required><br>
        <br>
       <button class="rounded-pill text-white btn-lg"  type="submit" >INSCRIPTION</button><br><br>
        <h5 class="d-flex justify-content-center"> LOGIN ICI   <a class="btn btn-secondary text-white rounded-pill  d-flex  justify-content-center" href="loginClients.jsp">  LOGIN</a></h5>
        </form>
        
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
</body>
</html>