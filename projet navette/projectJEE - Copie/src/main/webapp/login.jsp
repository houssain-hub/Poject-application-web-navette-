<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"> 


<meta charset="UTF-8">
<title>LOGIN SOCIETES</title>
</head>
<body>
    <!-- Barre de navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-white">
    <div class="container-fluid">
        <img src="${pageContext.request.contextPath}/images/tr.svg" width="100%" height="60px" class="navbar-brand" >
        
        </div>
</nav><br>
<div >
 <form class="formu" action="LoginServlet" method="post" >
 <h2>Login Societes</h2>
<label>EMAIL:</label>
<input type="text" name="email" placeholder="Entrez votre email" required>
<label>MOT DE PASSE:</label>
<input type="password" name="Spasword" placeholder="Entrez votre mot de passe" required><br><br>
<% if(request.getAttribute("message")!=null){%>
<p><%=request.getAttribute("message")%></p>
<%} %>
<button class="rounded-pill" type="submit" >LOGIN</button><br><br>
<h5>Inscrire ici !<a href="inscription.jsp" role="button">inscription</a></h5>
</form>


</div>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
</body>
</html>