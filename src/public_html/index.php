<?php
require_once 'bootstrap.php';
?>
<!doctype html>
<html class="no-js" lang="pt-BR">

<head>
  <meta charset="utf-8">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title><?= $data['name'] ?></title>
  <meta name="description" content="<?= $data['description'] ?>">
  <meta name="author" content="<?= $data['author'] ?>">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="shortcut icon" href="favicon.ico">
  <link href="https://fonts.googleapis.com/css?family=Architects+Daughter&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
  <link rel="stylesheet" href="css/shards.css">
  <link rel="stylesheet" href="css/shards-extras.css">
  <link rel="stylesheet" href="css/site.css">
</head>

<body class="shards-landing-page--1">
  <div class="welcome d-flex justify-content-center flex-column">
    <nav class="navbar navbar-expand-lg navbar-dark  mb-4">
      <?php include 'layout/navigation.php'; ?>
    </nav>
    <!-- Welcome Section -->
    <div class="inner-wrapper mt-auto mb-auto container">
      <div class="row">
        <div class="col-md-9">
          <h1 class="welcome-heading display-3 text-white">
            <img src="images/logo_mini.png" class="img-main" alt="<?= $data['name'] ?>">
            <?= $data['name'] ?>
          </h1>
          <h2 class="welcome-heading display-5 text-white"><?= $data['fullname'] ?></h2>
          <p class="text-white h6 text-justify"><?= $data['description'] ?></p>
          <a href="nav.php?page=inscricao" class="btn btn-lg btn-primary btn-squared align-self-center main-button">Inscrições Abertas</a>
          <a href="nav.php?page=submissao" class="btn btn-lg btn-secondary btn-squared align-self-center main-button">Submissão de Trabalhos</a>
        </div>
      </div>
    </div>
    <!-- / Welcome Section -->
  </div>

  <!-- Apresentacao Section -->
  <?php include 'layout/principal.php'; ?>
  <!-- / Apresentacao Section -->

  <!-- Palestrantes Section -->
  <div class="testimonials section-invert py-4">
    <h3 class="section-title text-center m-5">Profissionais Confirmados</h3>
    <div class="container py-5">
      <div class="row">
        <?php participantesRenderList(); ?>
      </div>
    </div>
  </div>
  <!-- / Palestrantes Section -->

  <!-- Minicursos Section -->
  <div class="blog section section py-4">
    <h3 class="section-title text-center m-5" id="minicursos">Minicursos</h3>
    <div class="container">
      <div class="py-4">
        <div class="row">
          <div class="card-deck">
            <?php minicursosRenderList(); ?>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- / Minicursos Section -->

  <!-- Faleconosco Section -->
  <div class="testimonials section-invert py-4">
    <h3 class="section-title text-center m-5">Fale Conosco</h3>
    <div class="container py-5">
      <div class="row">
        <div class="col">
          <p class="text-center h5">Em caso de dúvidas entre em contato conosco utilizando um dos canais abaixo </p>
          <div class="spacer-50"> </div>
          <div class="h6 text-center">
            <p> <i class="fab fa-whatsapp text-success"></i> Whatsapp: +55 43 9 9968-4031 (Prof. Biluka)</p>
            <p> <i class="far fa-envelope text-danger"></i> <a href="mailto:cct@uenp.edu.br">cct@uenp.edu.br</a> - Centro de Ciências Tecnológicas</p>
            <p> <i class="fab fa-facebook text-primary"></i> <a href="https://www.facebook.com/siuenp">Página do CCT no Facebook</a></p>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- / Faleconosco Section -->

  <!-- Footer Section -->
  <?php include 'layout/footer.php'; ?>
  <!-- / Footer Section -->

  <!-- JavaScript Dependencies -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>

</html>