
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HOME</title>

       <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Fonts (Roboto) -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="styles.css">
    
   <style>
    .hero-section {
        position: relative;
        width: 100%;
        height: 60vh;
        overflow: hidden;
    }
    
    .hero-section::before { /* Adding a dark overlay */
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.6); /* Adjust this value to darken more or less */
        z-index: 1; /* Ensure it stays above the image but below the logo */
    }

    .carousel-inner img {
        width: 100%;
        height: 60vh;
        object-fit: cover;
    }

    .carousel-caption {
        background: rgba(0, 0, 0, 0.5);
        padding: 15px;
        border-radius: 10px;
    }

    /* Style for fixed logo and heading */
    #animateElement2 {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 10; /* Ensure it stays on top of the overlay */
        text-align: center;
        color: white;
    }
</style>

</head>
<body>

<!-- 🌍 Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <a href="home.jsp" class="navbar-brand">TransConfort</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link text-dark" href="home.jsp">ACCUEIL</a></li>
                <li class="nav-item"><a class="nav-link text-dark" href="navetteuser.jsp">NAVETTE</a></li>
                <li class="nav-item"><a class="nav-link text-dark" href="demandeuser.jsp">DEMANDES DE NAVETTES</a></li>
            </ul>
            <div class="d-flex">
                <a href="login.jsp" class="btn btn-primary me-2 rounded-pill">SOCIETE</a>
                <a href="loginClients.jsp" class="btn btn-outline-dark rounded-pill">CLIENTS</a>
            </div>
        </div>
    </div>
</nav>

<!-- 🚋 Hero Section with Fullscreen Carousel -->
<div class="hero-section" id="animateElement1">
    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"></button>
        </div>
        <div class="carousel-inner" >
            <div class="carousel-item active">
                <img src="${pageContext.request.contextPath}/images/tram.jpg" alt="Train">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Confort et Sécurité</h5>
                    <p>Profitez d’un voyage agréable et sécurisé.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="${pageContext.request.contextPath}/images/train.jpg" alt="Rabat">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Voyagez en toute tranquillité</h5>
                    <p>Nos services sont pensés pour votre bien-être.</p>
                </div>
            </div>
            <div class="carousel-item">
                <img src="${pageContext.request.contextPath}/images/rabat.jpeg" alt="Tram">
                <div class="carousel-caption d-none d-md-block">
                    <h5>Rapidité et Fiabilité</h5>
                    <p>Un transport rapide pour vos déplacements quotidiens.</p>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>
    </div>

    <!-- Fixed Logo and Heading on Top -->
    <div id="animateElement2">
        <div>
            <img src="${pageContext.request.contextPath}/images/tr.svg" width="400px" height="200px" alt="Logo">
            <h1>Votre confort, notre priorité.</h1>
        </div>
    </div>
</div>

<!-- 🏆 Services -->
<div id="animateElement3" class="py-3  text-center">
    <div class="container">
       <h1 class="mb-4 " >notre services</h1>
        <div class="row g-4">
            <div class="col-md-3">
                <div class="card border-0 shadow">
                    <img src="${pageContext.request.contextPath}/images/security.svg" class="card-img-top p-3" height="100" alt="Sécurité">
                    <div class="card-body">
                        <h5 class="card-title">SÉCURITÉ</h5>
                        <p class="card-text">Nos véhicules sont équipés des dernières technologies pour garantir votre sécurité.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card border-0 shadow">
                    <img src="${pageContext.request.contextPath}/images/comfort.svg" class="card-img-top p-3" height="100" alt="Confort">
                    <div class="card-body">
                        <h5 class="card-title">CONFORT</h5>
                        <p class="card-text">Un cadre agréable et moderne pour rendre votre trajet plus plaisant.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card border-0 shadow">
                    <img src="${pageContext.request.contextPath}/images/like.svg" class="card-img-top p-3" height="100" alt="Satisfaction">
                    <div class="card-body">
                        <h5 class="card-title">SATISFACTION</h5>
                        <p class="card-text">Un service rapide et efficace, conçu pour répondre à vos attentes.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card border-0 shadow">
                    <img src="${pageContext.request.contextPath}/images/quality.svg" class="card-img-top p-3" height="100" alt="Qualité">
                    <div class="card-body">
                        <h5 class="card-title">QUALITÉ</h5>
                        <p class="card-text">Des standards élevés pour vous offrir le meilleur service possible.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 📩 Footer -->
<footer id="animateElement4" class="bg-dark text-white text-center p-5">
    <p>&copy; 2025 TransConfort. Tous droits réservés.</p>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/javascript/home.js"></script>

</body>
</html>