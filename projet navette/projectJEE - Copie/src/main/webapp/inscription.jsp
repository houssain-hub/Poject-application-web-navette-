<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/clientLogin.css">
  
<title>Insciption Societes</title>
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
<div >
  <form class="formu" action="inscriptionServlet" method="post" >
         <h2>Inscription Societe</h2>
         
        <label for="name">Nom Du Societé :</label>
        <input type="text" id="name" name="Sname" placeholder="Entrez votre nom" required>

        <label for="password">Mot de passe :</label>
        <input type="password" id="password" name="Spasword" placeholder="Entrez votre mot de passe" required>

        <label for="email">Adresse email :</label>
        <input type="email" id="email" name="email" placeholder="Entrez votre email" required>

       
        <label for="phone">Numéro de téléphone :</label>
        <input type="tel" name="phone_number" placeholder="Entrez votre numéro de téléphone" required>

        <input style="background-color:#EB5A3C;" class="rounded-pill text-white" type="submit" value="INSCRIPTION">
        <h4 class="d-flex justify-content-center"> LOGIN ICI </h4>
        <h5><a class="btn btn-secondary text-white rounded-pill  d-flex  justify-content-center" href="login.jsp">  LOGIN</a></h5>
        </form>
 </div>  
 
 <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>     
</body>
</html>








































