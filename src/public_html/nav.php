<?php
  require_once 'bootstrap.php';
  $page = "home";
  if (isset($_GET['page']))
    $page = fromGet('page');
  $file = "pages/$page.php";
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

        <!-- JavaScript Dependencies -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.10/jquery.mask.min.js" crossorigin="anonymous"></script>
        <script src="js/shards.min.js"></script>
        <style media="screen">

        .site {
          display: flex;
          min-height: 100vh;
          flex-direction: column;
        }

        .site-content {
          flex: 1;
        }
        </style>
    </head>
    <body class="site">
      <div class="d-flex justify-content-center flex-column">
        <nav class="navbar navbar-expand-lg navbar-dark bg-secondary mb-4">
          <?php include 'layout/navigation.php';?>
        </nav>
      </div>
      <div class="container site-content">
        <?php

          if (file_exists($file))
            include $file;
          else
            include "404.php";
        ?>
      </div>
      <!-- Footer Section -->
      <?php include 'layout/footer.php';?>
      <!-- / Footer Section -->
      <script>
      $('.cpf').mask('000.000.000-00', {reverse: true});
      </script>
    </body>
</html>

