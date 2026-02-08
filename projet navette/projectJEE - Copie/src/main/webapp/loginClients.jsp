<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/clientLogin.css">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"> 
<meta charset="UTF-8">
<title>LOGIN CLIENTS</title>
</head>
<body>
    <!-- Barre de navigation -->
    <!-- Barre de navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-white">
    <div class="container-fluid">
        <img src="${pageContext.request.contextPath}/images/tr.svg" width="150PX" height="40px" class="navbar-brand" >
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
            
        </div>
    </nav><br>
<div >
 <form class="formu" action="loginClients" method="post" >
 <h2>Login Clients</h2>
<label>EMAIL:</label>
<input type="text" name="email" placeholder="Entrez votre email" required>
<label>MOT DE PASSE:</label>
<input type="password" name="password" placeholder="Entrez votre mot de passe" required><br><br>
<% if(request.getAttribute("message")!=null){%>
<p><%=request.getAttribute("message")%></p>
<%} %>
<button class="rounded-pill text-white btn-lg"  type="submit" >LOGIN</button><br><br>
<h3>Inscrire ici !<a href="ClientInscription.jsp" role="button">inscription</a></h3>
</form>


</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
</body>
</html>