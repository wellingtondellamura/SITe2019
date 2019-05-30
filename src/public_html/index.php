<?php
  require 'layout/data.inc';
?>
<!doctype html>
<html class="no-js" lang="pt-BR">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title><?=$data['name']?></title>
        <meta name="description" content="<?=$data['description']?>">
        <meta name="author" content="<?=$data['author']?>">
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
        <?php include 'layout/navigation.inc';?>
        <!-- Welcome Section -->
        <?php include 'layout/welcome.inc';?>
        <!-- / Welcome Section -->
      </div>

      <!-- Apresentacao Section -->
      <?php include 'layout/apresentacao.inc';?>
      <!-- / Apresentacao Section -->


      <!-- Palestrantes Section -->
      <?php include 'layout/palestrantes.inc';?>
      <!-- / Palestrantes Section -->


      <!-- Minicursos Section -->
      <?php include 'layout/minicursos.inc';?>
      <!-- / Minicursos Section -->


      <!-- Faleconosco Section -->
      <?php include 'layout/faleconosco.inc';?>
      <!-- / Faleconosco Section -->

      <!-- Footer Section -->
      <?php include 'layout/footer.inc';?>
      <!-- / Footer Section -->

      <!-- JavaScript Dependencies -->
      <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
