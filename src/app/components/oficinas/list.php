<?php
  require_once 'data.php';
  $lst = getMiniCursos();
  shuffle($lst);
  foreach ($lst as $item) {
  ?>
  <div class="col-md-12 col-lg-4">
    <div class="card mb-4" style="max-height: 600px; height: 600px;">
      <img class="card-img-top" src="images/common/<?=$item['foto']?>" alt="<?=$item['titulo']?>">
      <div class="card-body">
        <h5 class="card-title text-center"><?=$item['titulo']?></h5>
        <p class="card-text text-justify " style="max-height: 100px;"><?=addEllipsis($item['descricao'], 180)?> 
       <a href="nav.php?page=detalhe-minicurso&id=<?=$item['id']?>">(leia mais)</a>
        </p>
        
      </div>
    </div>
  </div>
<?php } ?>
